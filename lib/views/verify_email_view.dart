import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({ Key key }) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Verify the email')),
      backgroundColor: Color.fromARGB(111, 111, 111, 111)
      ),
      body: Column(
        children: [

          Card(
            color: Color.fromARGB(255, 197, 186, 186),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                          'We\'ve sent to you an email varification. Please open it to verify your account',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                    ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          "If you haven\'t received a verification email yet, press the button below",
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: TextButton(         
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
                },
                child:const Text('Send email varification', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 123, 207, 207),
                  fixedSize: Size.fromWidth(250),
                  elevation: 10,
                ),
             ),
          ),
            TextButton(
             onPressed: () async{
               await FirebaseAuth.instance.signOut();
               Navigator.of(context).pushNamedAndRemoveUntil(
                 '/login/',
                 (route) => false,
                 );
             },
             child: const Text("Go to login ",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
             style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 123, 207, 207),
                  fixedSize: Size.fromWidth(250),
                  elevation: 10,
                )
             )
        ],
      ),
    );
  }
}
