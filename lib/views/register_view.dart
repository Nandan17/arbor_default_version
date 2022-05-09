import 'package:arbor/utilities/dialogs/error_dialog.dart';
import 'package:arbor/views/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:arbor/views/dropdown/expandedListAnimationWidget.dart';
import 'package:arbor/views/dropdown/scrollbar.dart';
//import 'dart:developer' as devtools show log;

class RegisterView extends StatefulWidget {
  const RegisterView({ Key key }) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isPasswordVisible = false;
  TextEditingController _email;
  TextEditingController _password;

  var options = [
    'Admin',
    'Master',
    'Public',
  ];

  var _currentItemSelected = "Admin";
  var role = "Admin";
  int groupValue = 0;
  String title = 'Login as';
  bool isStrechedDropDown = false;

  @override
  void initState(){
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose(){ //dispose the Textediting controller
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      	child: Container(
	        child: Column(
	          children: <Widget>[
	            Container(
	              height: 400,
	              decoration: const BoxDecoration(
	                image: DecorationImage(
	                  image: AssetImage('assets/images/background.png'),
	                  fit: BoxFit.fill
	                )
	              ),
	              child: Stack(
	                children: <Widget>[
	                  Positioned(
	                    left: 30,
	                    width: 80,
	                    height: 200,
	                    child: Container(
	                      decoration: const BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/light-1.png')
	                        )
	                      ),
	                    ),
	                  ),
	                  Positioned(
	                    left: 140,
	                    width: 80,
	                    height: 150,
	                    child: Container(
	                      decoration: const BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/light-2.png')
	                        )
	                      ),
	                    ),
	                  ),
	                  Positioned(
	                    right: 40,
	                    top: 40,
	                    width: 80,
	                    height: 150,
	                    child: Container(
	                      decoration: const BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/clock.png')
	                        )
	                      ),
	                    ),
	                  ),
	                  Positioned(
	                    child: Container(
	                      margin: const EdgeInsets.only(top: 50),
	                      child: const Center(
	                        child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
	                      ),
	                    ),
	                  )
	                ],
	              ),
	            ),
	            Padding(
	              padding: const EdgeInsets.all(30.0),
	              child: Column(
	                children: <Widget>[
	                 Container(
	                    padding: const EdgeInsets.all(5),
	                    decoration: BoxDecoration(
	                      color: Colors.white,
	                      borderRadius: BorderRadius.circular(10),
	                      boxShadow: const [
	                        BoxShadow(
	                          color: Color.fromRGBO(143, 148, 251, .2),
	                          blurRadius: 20.0,
	                          offset: Offset(0, 10)
	                        )
	                      ]
	                    ),
	                    child: Column(
	                      children: <Widget>[
	                        Container(
	                          padding: const EdgeInsets.all(8.0),
	                          decoration: const BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Color.fromARGB(220, 220, 220, 220)))
	                          ),
	                          child: TextField(
                              controller: _email,
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.emailAddress,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Email",
	                              hintStyle: TextStyle(color: Colors.grey[400]),
                                 icon: const Icon(
                                  Icons.email,
                                  color: Colors.purple,
                                  size: 20,
                                )
	                            ),
	                          ),
	                        ),
	                        Container(
	                          padding: const EdgeInsets.all(8.0),
	                          child: TextField(
                              controller: _password,
                              obscureText: isPasswordVisible,
                              enableSuggestions: false,
                              autocorrect: false,
	                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  color: Colors.purple,
                                  icon: isPasswordVisible 
                                  ? const Icon(Icons.visibility_off) 
                                  : const Icon(Icons.visibility),
                                  onPressed: () =>
                                    setState(() => isPasswordVisible = !isPasswordVisible),
                                ),
	                              border: InputBorder.none,
	                              hintText: "Password",
	                              hintStyle: TextStyle(color: Colors.grey[400]),
                                icon: const Icon(
                                  Icons.password,
                                  color: Colors.purple,
                                  size: 20,
                                )
	                            ),
	                          ),
	                        )
	                      ],
	                    ),
	                  ),

                    //DropDown
                    SafeArea(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: const Color.fromARGB(220, 220, 220, 220)),
                                    borderRadius: const BorderRadius.all(Radius.circular(27))
                                    ),
                                child: Column(
                                  children: [

                                    Container(
                                        // height: 45,
                                        width: double.infinity,
                                        padding: const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: const Color.fromARGB(220, 220, 220, 220),),
                                            borderRadius:const BorderRadius.all(Radius.circular(25)),
                                            ),
                                        constraints: const BoxConstraints(
                                          minHeight: 45,
                                          minWidth: double.infinity,
                                        ),
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 20, vertical: 10,),
                                                child: Text(
                                                    title,
                                                ),
                                              ),
                                            ),
                                           
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isStrechedDropDown =
                                                        !isStrechedDropDown;
                                                  });
                                                },
                                                child: Icon(isStrechedDropDown
                                                    ? Icons.arrow_upward
                                                    : Icons.arrow_downward))
                                          ],
                                        )
                                      ),

                                    ExpandedSection(
                                      expand: isStrechedDropDown,
                                      height: 100,
                                      child: MyScrollbar(
                                        builder: (context, scrollController2) =>
                                            ListView.builder(
                                                padding: const EdgeInsets.all(0),
                                                controller: scrollController2,
                                                shrinkWrap: true,
                                                itemCount: options.length,
                                                itemBuilder: (context, index) {
                                                  return RadioListTile(
                                                    title: Text(options.elementAt(index)),
                                                      value: index,
                                                      groupValue: groupValue,
                                                      onChanged: (val) {
                                                      setState(() {
                                                        if(val== 0){
                                                          groupValue = val as int;
                                                          _currentItemSelected = options[0];
                                                          role = options[0];
                                                          title = options[0];
                                                        } else if(val == 1){
                                                          groupValue = val as int;
                                                          _currentItemSelected = options[1];
                                                          role = options[1];
                                                          title = options[1];
                                                        } else if(val ==2) {
                                                          groupValue = val as int;
                                                          _currentItemSelected = options[2];
                                                          role = options[2];
                                                          title = options[2];
                                                        }

                                                       
                                                      });
                                                      });
                                                }),
                                          ),
                                        )
                                  ],
                                ),
                              )),
                            ],
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 30,),
                    Container(
                      height: 50,
	                    decoration: BoxDecoration(
	                      borderRadius: BorderRadius.circular(10),
	                      gradient: const LinearGradient(
	                        colors: [
	                          Color.fromRGBO(143, 148, 251, 1),
	                          Color.fromRGBO(143, 148, 251, .6),
	                        ]
	                      )
	                    ),
                      child: TextButton(onPressed: () async {
                    
                            final email = _email.text;
                            final password = _password.text;
                    
                            try{
                              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: email, 
                              password: password,
                              ).then((value) => {postDetailsToFirestore(email, role)});
                              FirebaseAuth.instance.currentUser?.sendEmailVerification();
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                '/verify-email-view/', 
                                (route) => false,
                                );
                            } on FirebaseAuthException catch(e) {
                              if(e.code == 'weak-password'){
                                await showErrorDialog(
                                  context, 
                                  'Weak Password',
                                  );
                              } else if(e.code == 'email-already-in-use'){
                                await showErrorDialog(
                                  context, 
                                  'Email already in use',
                                  );
                              } else if(e.code == 'invalid-email'){
                                await showErrorDialog(
                                  context, 
                                  'This is an invalid email address',
                                  );
                              } else {
                                await showErrorDialog(
                                  context, 
                                  'Error: ${e.code}',
                                  );
                              }
                            }catch (e) {
                                await showErrorDialog(
                                  context, 
                                  e.toString(),
                                  );
                            }
    
                          }, 
                          
                          child: const Center(
                                child: Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                    
                    
                          ),
                      ),


                    TextButton(onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                            '/login/',
                            (route) => false);
                          },
                          child: const Text('Already registered? Login here!'),
                    ),
	                ],
	              ),
	            )
	          ],
	        ),
	      ),
      )
    );
   
  }
  postDetailsToFirestore(String email, String role) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User user = FirebaseAuth.instance.currentUser;
    UserModel userModel = UserModel();
    userModel.email = email;
    userModel.uid = user.uid;
    userModel.role = role;
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
  }
}



//  return Scaffold(
    //   appBar: AppBar(title: const Text('Register'),
    //   ),
    //   body: Column(
    //     children: [
    //       TextField(
    //         controller: _email,
    //               enableSuggestions: false,
    //               autocorrect: false,
    //               keyboardType: TextInputType.emailAddress,
    //               decoration: const InputDecoration(
    //                 hintText: 'email'
    //               ),
    //             ),
    //       TextField(
    //               controller: _password,
    //               obscureText: true,
    //               enableSuggestions: false,
    //               autocorrect: false,
    //               decoration: const InputDecoration(
    //                 hintText: 'password'
    //               ),
    //             ),

    //       TextButton(onPressed: () async {

    //         final email = _email.text;
    //         final password = _password.text;

    //         try{
    //           await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //           email: email, 
    //           password: password,
    //           );
    //           final user = FirebaseAuth.instance.currentUser;
    //           await user?.sendEmailVerification();
    //           Navigator.of(context).pushNamed(
    //             '/verify-email-view/', 
    //             );
    //         } on FirebaseAuthException catch(e) {
    //           if(e.code == 'weak-password'){
    //             await showErrorDialog(
    //               context, 
    //               'Weak Password',
    //               );
    //           } else if(e.code == 'email-already-in-use'){
    //             await showErrorDialog(
    //               context, 
    //               'Email already in use',
    //               );
    //           } else if(e.code == 'invalid-email'){
    //             await showErrorDialog(
    //               context, 
    //               'This is an invalid email address',
    //               );
    //           } else {
    //             await showErrorDialog(
    //               context, 
    //               'Error: ${e.code}',
    //               );
    //           }
    //         }catch (e) {
    //             await showErrorDialog(
    //               context, 
    //               e.toString(),
    //               );
    //         }
    //       }, 
    //       child: const Text('Register'),
    //       ),
    //       TextButton(onPressed: () {
    //               Navigator.of(context).pushNamedAndRemoveUntil(
    //               '/login/',
    //               (route) => false);
    //             },
    //             child: const Text('Already registered? Login here!'),
    //             )
    //   ]),
    // );

