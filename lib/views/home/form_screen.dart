import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
//import 'package:slider/slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({ Key key }) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  TextEditingController cityController = TextEditingController();
  TextEditingController zoneController = TextEditingController();
  TextEditingController divisionController = TextEditingController();
  TextEditingController wardController = TextEditingController();
  TextEditingController treeNameController = TextEditingController();
  TextEditingController scientificTreeNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController girthController = TextEditingController();
  TextEditingController circumferenceController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController taggedByController = TextEditingController();
  TextEditingController dataRecoveredByController = TextEditingController();
  TextEditingController dataVerifiedByController = TextEditingController();
  

  String selectedValue_gps;
  List<String> gps = [
    'LAT',
    'LONG',
  ];

  String selectedValue_utility;
  List<String> utility = [
    'ROAD',
    'RAILWAY',
    'ETC'
  ];

  String selectedValue_gvt_land;
  List<String> gvt_land = [
    'TANK',
    'FOREST',
    'BBMP',
    'PWD',
    'EDUCATION',
    'BWSSB',
    'ISRO',
    'IISC',
    'IIM',
    'EDUCATIONAL',
    'INDUSTRIAL',
    'HOME',
    'ARMY',
    'AIR FORCE',
    'AIRPORT',
    'OTHER DEFENCE'
  ];

  String selectedValue_land_type;
  List<String> land_type = [
    'PRIVATE',
    'EDUCATIONAL',
    'INDUSTRIAL',
    'RESIDENTIAL'
  ];

  String selectedValue_tree_type_a;
  List<String> tree_type_a = [
    'INDIGENOUS',
    'EXOTIC',
   ];

    String selectedValue_tree_type_b;
    List<String> tree_type_b = [
    'SEMI-EVERGREEN',
    'DECIDUOUS',
   ];

   String selectedValue_tree_type_c;
    List<String> tree_type_c = [
    'LARGE TREE',
    'MEDIUM TREE',
    'SMALL TREE',
   ];

   double rating = 0.0;

   String selectedValue_oxygen_capacity;
    List<String> oxygen_capacity = [
    'HIGH',
    'MEDIUM',
    'LOW',
   ];

   DateTime date = DateTime(2022,4,10);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    CollectionReference treeData = FirebaseFirestore.instance.collection('tree_data');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body:Container(
        padding: const EdgeInsets.symmetric(
          vertical: 25.0,
          horizontal: 5.0,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[

              const Center(child: Text("LOCATION")),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "City cannot be empty";
                    } else if(value.length < 3){
                      return "length of city must be atleast 3 character long";
                    }
                    return null;
                  },
                  controller: cityController,
                  decoration: InputDecoration(
                    labelText: 'City',
                    hintText: 'City',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "Zone cannot be empty";
                    } 
                    return null;
                  },
                  controller: zoneController,
                  decoration: InputDecoration(
                    labelText: 'Zone',
                    hintText: 'Zone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "Division cannot be empty";
                    } 
                    return null;
                  },
                  controller: divisionController,
                  decoration: InputDecoration(
                    labelText: 'Division',
                    hintText: 'Division',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "Ward cannot be empty";
                    } 
                    return null;
                  },
                  controller: wardController,
                  decoration: InputDecoration(
                    labelText: 'Ward',
                    hintText: 'Ward',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),

              const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("GPS LOCATION")
                  )
                ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Icon(
                            Icons.list,
                            size: 16,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'GPS Location',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: gps
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValue_gps,
                      onChanged: (value) {
                        setState(() {
                          selectedValue_gps = value as String;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.yellow,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 320,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.white,
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(60, 0),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("COMMON UTILITY")
                  )
                ),

                Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Icon(
                            Icons.list,
                            size: 16,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'COMMON UTILITY',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: utility
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValue_utility,
                      onChanged: (value) {
                        setState(() {
                          selectedValue_utility = value as String;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.yellow,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 320,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.white,
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(60, 0),
                    ),
                  ),
                ),


                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("GOVERNMENT LAND")
                  )
                ),

                Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Icon(
                            Icons.list,
                            size: 16,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'GOVERNMENT LAND',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: gvt_land
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValue_gvt_land,
                      onChanged: (value) {
                        setState(() {
                          selectedValue_gvt_land = value as String;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.yellow,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 320,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.white,
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(60, 0),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("TYPE OF LAND")
                  )
                ),

                Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Icon(
                            Icons.list,
                            size: 16,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'TYPE OF LAND',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: land_type
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValue_land_type,
                      onChanged: (value) {
                        setState(() {
                          selectedValue_land_type = value as String;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.yellow,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 320,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.white,
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(60, 0),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("TREES")
                  )
                ),

                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "cannot be empty";
                    } 
                    return null;
                  },
                  controller:treeNameController,
                  decoration: InputDecoration(
                    labelText: 'NAME OF THE TREE',
                    hintText: 'NAME OF THE TREE',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "cannot be empty";
                    } 
                    return null;
                  },
                  controller: scientificTreeNameController,
                  decoration: InputDecoration(
                    labelText: 'SCIENTIFIC NAME',
                    hintText: 'SCIENTIFIC NAME',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "cannot be empty";
                    } 
                    return null;
                  },
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'AGE',
                    hintText: 'AGE',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "cannot be empty";
                    } 
                    return null;
                  },
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'HEIGHT IN MTRS',
                    hintText: 'HEIGHT IN MTRS',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "cannot be empty";
                    } 
                    return null;
                  },
                  controller: girthController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'GIRTH IN MTRS',
                    hintText: 'GIRTH IN MTRS',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),



              const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("TREE TYPE A")
                  )
                ),


                Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Icon(
                            Icons.list,
                            size: 16,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'TREE TYPE A',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: tree_type_a
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValue_tree_type_a,
                      onChanged: (value) {
                        setState(() {
                          selectedValue_tree_type_a = value as String;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.yellow,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 320,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.white,
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(60, 0),
                    ),
                  ),
                ),



                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("TREE TYPE B")
                  )
                ),


                Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Icon(
                            Icons.list,
                            size: 16,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'TREE TYPE B',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: tree_type_b
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValue_tree_type_b,
                      onChanged: (value) {
                        setState(() {
                          selectedValue_tree_type_b = value as String;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.yellow,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 320,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.white,
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(60, 0),
                    ),
                  ),
                ),


                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("TREE TYPE C")
                  )
                ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Icon(
                            Icons.list,
                            size: 16,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'TREE TYPE C',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: tree_type_c
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValue_tree_type_c,
                      onChanged: (value) {
                        setState(() {
                          selectedValue_tree_type_c = value as String;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.yellow,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 320,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.white,
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(60, 0),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("CROWN DENSITY")
                  )
                ),

                Slider(value: rating, onChanged: (newRating){
                  setState(() {
                    rating = newRating;
                  });
                },
                min: 0.0,
                max: 1.0,
                divisions: 5,
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("CIRCUMFERENCE OF CROWN IN MTRS")
                  )
                ),

                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "cannot be empty";
                    } 
                    return null;
                  },
                  controller: circumferenceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'CIRCUMFERENCE OF CROWN',
                    hintText: 'CIRCUMFERENCE OF CROWN',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),

              const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("OXYGEN GENERATING CAPABLITY")
                  )
                ),

                Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Icon(
                            Icons.list,
                            size: 16,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'OXYGEN GENERATING CAPABLITY',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: oxygen_capacity
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValue_oxygen_capacity,
                      onChanged: (value) {
                        setState(() {
                          selectedValue_oxygen_capacity = value as String;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.yellow,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 320,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.white,
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(60, 0),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("DATE OF TAG")
                  )
                ),

                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "cannot be empty";
                    } 
                    return null;
                  },
                  controller: dateController,
                  decoration: InputDecoration(
                    labelText: 'DATE OF TAG',
                    hintText: 'DATE OF TAG',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),

              const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("TAGGED BY")
                  )
                ),

                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "cannot be empty";
                    } 
                    return null;
                  },
                  controller: taggedByController,
                  decoration: InputDecoration(
                    labelText: 'TAGGED BY',
                    hintText: 'TAGGED BY',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),

              const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("DATA RECOVERED BY")
                  )
                ),

                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "cannot be empty";
                    } 
                    return null;
                  },
                  controller: dataRecoveredByController,
                  decoration: InputDecoration(
                    labelText: 'DATA RECOVERED BY',
                    hintText: 'DATA RECOVERED BY',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),

              const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("DATA VERIFIED BY")
                  )
                ),

                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "cannot be empty";
                    } 
                    return null;
                  },
                  controller: dataVerifiedByController,
                  decoration: InputDecoration(
                    labelText: 'DATA VERIFIED BY',
                    hintText: 'DATA VERIFIED BY',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()
        {
        if(_formKey.currentState.validate()){
          print(cityController.text);
          print(zoneController.text);
          print(divisionController.text);
          print(wardController.text);
          print(selectedValue_gps);
          print(selectedValue_utility);
          print(selectedValue_gvt_land);
          print(selectedValue_land_type);
          print(treeNameController.text);
          print(scientificTreeNameController.text);
          print(ageController.text);
          print(heightController.text);
          print(girthController.text);
          print(selectedValue_tree_type_a);
          print(selectedValue_tree_type_b);
          print(selectedValue_tree_type_c);
          print(rating);
          print(circumferenceController.text);
          print(selectedValue_oxygen_capacity);
          print(dateController.text);
          print(taggedByController.text);
          print(dataRecoveredByController.text);
          print(dataVerifiedByController.text);

          

          treeData.add({
            'city':cityController.text,
            'zone':zoneController.text,
            'division':divisionController.text,
            'ward':wardController.text,
            'gps_location':selectedValue_gps,
            'common_utility':selectedValue_utility,
            'gvt_land':selectedValue_gvt_land,
            'land_type':selectedValue_land_type,
            'tree_name':treeNameController.text,
            'scientific_tree_name':scientificTreeNameController.text,
            'age':ageController.text,
            'height':heightController.text,
            'girth':girthController.text,
            'tree_type_a':selectedValue_tree_type_a,
            'tree_type_b':selectedValue_tree_type_b,
            'tree_type_c':selectedValue_tree_type_c,
            'crown_density':rating,
            'circumference_of_crown':circumferenceController.text,
            'oxygen_capacity':selectedValue_oxygen_capacity,
            'date_of_tag':dateController.text,
            'tagged_by':taggedByController.text,
            'data_recovered_by':dataRecoveredByController.text,
            'data_verified_by':dataVerifiedByController.text
            
          }).then((value) => print("Tree data successfully added"))
          .catchError((error) => print("Failed to add tree data"));

        }
        
      },
        child: const Icon(Icons.done),
      ),
    );
  }
}

