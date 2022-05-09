import 'package:arbor/views/home/form_data.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:slider/slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormUpdate extends StatefulWidget {
  final String treeID;
  final String Age;
  final String City;
  final String QRcodeid;
  final String TreeName;
  final String Zone;
  final String common;
  final String division;
  final String girth;
  final String gps;
  final String height;
  final String tid;
  String land;
  final String lat;
  final String long;
  final String railway;
  final String road;
  final String scientificName;
  String typeofland;
  final String ward;
   FormUpdate({ 
    Key key, 
    this.treeID, 
    this.Age, 
    this.City, 
    this.QRcodeid, 
    this.TreeName, 
    this.Zone, 
    this.common, 
    this.division, 
    this.girth,
    this.gps,
    this.height,
    this.land,
    this.lat,
    this.long,
    this.railway,
    this.road,
    this.scientificName,
    this.tid,
    this.typeofland,
    this.ward,
     }) : super(key: key);

  @override
  State<FormUpdate> createState() => _FormUpdateState();
}

class _FormUpdateState extends State<FormUpdate> {

  CollectionReference trees = FirebaseFirestore.instance.collection('tree_collection');


  TextEditingController answerController = TextEditingController();
  TextEditingController qrController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zoneController = TextEditingController();
  TextEditingController divisionController = TextEditingController();
  TextEditingController wardController = TextEditingController();
  TextEditingController gpsController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();
  TextEditingController commonUtilityController = TextEditingController();
  TextEditingController roadController = TextEditingController();
  TextEditingController railwayController = TextEditingController();
  TextEditingController treeNameController = TextEditingController();
  TextEditingController scientificTreeNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController girthController = TextEditingController();
  TextEditingController tidController = TextEditingController();
  
  
  @override
    void initState() {  
    ageController.text = widget.Age;
    cityController.text = widget.City;
    qrController.text = widget.QRcodeid;
    treeNameController.text = widget.TreeName;
    zoneController.text = widget.Zone;
    commonUtilityController.text = widget.common;
    divisionController.text = widget.division;
    girthController.text = widget.girth;
    gpsController.text = widget.gps;
    heightController.text = widget.height;
    latController.text = widget.lat;
    longController.text = widget.long;
    railwayController.text = widget.railway;
    roadController.text = widget.road;
    scientificTreeNameController.text = widget.scientificName;
    tidController.text = widget.tid;
    wardController.text = widget.ward;

    

    super.initState();
  }


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


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Update Tree data')),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
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

              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(206, 209, 140, 36)
                  ),
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
                   hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Colors.orange)
                      ),
                      contentPadding: EdgeInsets.all(20)
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(206, 209, 140, 36)
                  ),
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
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Colors.orange)
                      ),
                      contentPadding: EdgeInsets.all(20)
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(206, 209, 140, 36)
                  ),
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
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Colors.orange)
                      ),
                      contentPadding: EdgeInsets.all(20)
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(206, 209, 140, 36)
                  ),
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
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Colors.orange)
                      ),
                      contentPadding: EdgeInsets.all(20)
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(206, 209, 140, 36)
                  ),
                  validator: (String value){
                    if(value.isEmpty){
                      return "GPS location cannot be empty";
                    } 
                    return null;
                  },
                  controller: gpsController,
                  decoration: InputDecoration(
                    labelText: 'GPS location',
                    hintText: 'GPS location',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Colors.orange)
                      ),
                      contentPadding: EdgeInsets.all(20)
                  ),
                ),
              ),
                

               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(206, 209, 140, 36)
                  ),
                  validator: (String value){
                    if(value.isEmpty){
                      return "lattitude cannot be empty";
                    } 
                    return null;
                  },
                  controller: latController,
                  decoration: InputDecoration(
                    labelText: 'lattitude',
                    hintText: 'lattitude',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Colors.orange)
                      ),
                      contentPadding: EdgeInsets.all(20)
                  ),
                ),
              ),


               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(206, 209, 140, 36)
                  ),
                  validator: (String value){
                    if(value.isEmpty){
                      return "lonitude cannot be empty";
                    } 
                    return null;
                  },
                  controller: longController,
                  decoration: InputDecoration(
                    labelText: 'longitude',
                    hintText: 'longitude',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Colors.orange)
                      ),
                      contentPadding: EdgeInsets.all(20)
                  ),
                ),
              ),


               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(206, 209, 140, 36)
                  ),
                  validator: (String value){
                    if(value.isEmpty){
                      return "common utility cannot be empty";
                    } 
                    return null;
                  },
                  controller: commonUtilityController,
                  decoration: InputDecoration(
                    labelText: 'common utility',
                    hintText: 'common utility',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Colors.orange)
                      ),
                      contentPadding: EdgeInsets.all(20)
                  ),
                ),
              ),


               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(206, 209, 140, 36)
                  ),
                  validator: (String value){
                    if(value.isEmpty){
                      return "road cannot be empty";
                    } 
                    return null;
                  },
                  controller: roadController,
                  decoration: InputDecoration(
                    labelText: 'road',
                    hintText: 'road',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Colors.orange)
                      ),
                      contentPadding: EdgeInsets.all(20)
                  ),
                ),
              ),

     
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(206, 209, 140, 36)
                  ),
                  validator: (String value){
                    if(value.isEmpty){
                      return "Railway";
                    } 
                    return null;
                  },
                  controller: railwayController,
                  decoration: InputDecoration(
                    labelText: 'railway',
                    hintText: 'railway',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Colors.orange)
                      ),
                      contentPadding: EdgeInsets.all(20)
                  ),
                ),
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
                                color: Colors.orange,
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
                                    color: Color.fromARGB(206, 209, 140, 36),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: widget.land,
                      onChanged: (value) {
                        setState(() {
                          widget.land = value as String;
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
                        borderRadius: BorderRadius.circular(50),
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
                                color: Colors.orange,
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
                                    color: Color.fromARGB(206, 209, 140, 36),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: widget.typeofland,
                      onChanged: (value) {
                        setState(() {
                          widget.typeofland = value as String;
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
                        borderRadius: BorderRadius.circular(50),
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


                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(206, 209, 140, 36)
                  ),
                  validator: (String value){
                    if(value.isEmpty){
                      return "cannot be empty";
                    } 
                    return null;
                  },
                  controller:treeNameController,
                  decoration: InputDecoration(
                    labelText: 'NAME',
                    hintText: 'NAME',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Colors.orange)
                      ),
                      contentPadding: EdgeInsets.all(20)
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(206, 209, 140, 36)
                  ),
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
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Colors.orange)
                      ),
                      contentPadding: EdgeInsets.all(20)
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(206, 209, 140, 36)
                  ),
                  validator: (String value){
                    if(value.isEmpty){
                      return "cannot be empty";
                    } 
                    return null;
                  },
                  controller: ageController,
                  decoration: InputDecoration(
                    labelText: 'AGE',
                    hintText: 'AGE',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Colors.orange)
                      ),
                      contentPadding: EdgeInsets.all(20)
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(206, 209, 140, 36)
                  ),
                  validator: (String value){
                    if(value.isEmpty){
                      return "cannot be empty";
                    } 
                    return null;
                  },
                  controller: heightController,
                  decoration: InputDecoration(
                    labelText: 'HEIGHT',
                    hintText: 'HEIGHT',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Colors.orange)
                      ),
                      contentPadding: EdgeInsets.all(20)
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromARGB(206, 209, 140, 36)
                  ),
                  validator: (String value){
                    if(value.isEmpty){
                      return "cannot be empty";
                    } 
                    return null;
                  },
                  controller: girthController,
                  decoration: InputDecoration(
                    labelText: 'GIRTH',
                    hintText: 'GIRTH',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Colors.orange)
                      ),
                      contentPadding: EdgeInsets.all(20)
                  ),
                ),
              ),

               Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                                  //Navigator.of(context).pushNamedAndRemoveUntil('/admin/', (route) => false);
                                   Navigator.push(
                      context,
                      MaterialPageRoute(
                            builder: (context) => 
                                FormData(
                                  treeID: widget.treeID,
                                  Age: ageController.text,
                                  City:cityController.text,
                                  QRcodeid:widget.treeID,
                                  TreeName:treeNameController.text,
                                  Zone:zoneController.text,
                                  common:commonUtilityController.text,
                                  division:divisionController.text,
                                  girth:girthController.text,
                                  gps:gpsController.text,
                                  height:heightController.text,
                                  tid:widget.treeID,
                                  land:widget.land,
                                  lat:latController.text,
                                  long:longController.text,
                                  railway:railwayController.text,
                                  road:roadController.text,
                                  scientificName:scientificTreeNameController.text,
                                  typeofland:widget.typeofland,
                                  ward:wardController.text,
                                  ),
                        ));
          //Navigator.of(context).pushNamedAndRemoveUntil('/admin/', (route) => false);
                          },
                          child: const Text('Go back', style: TextStyle(fontSize: 20)),
                           style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            textStyle: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold)
                           )
                        )
            ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()
        {
        if(_formKey.currentState.validate()){

          trees.doc(widget.treeID).update({
            'City':cityController.text,
            'Zone':zoneController.text,
            'division':divisionController.text,
            'ward':wardController.text,
            'gps':gpsController.text,
            'common':commonUtilityController.text,
            'lat':latController.text,
            'long':longController.text,
            'railway':railwayController.text,
            'road':roadController.text,
            'land':widget.land,
            'typeofland':widget.typeofland,
            'TreeName':treeNameController.text,
            'scientificName':scientificTreeNameController.text,
            'Age':ageController.text,
            'height':heightController.text,
            'girth':girthController.text,
            'QRcodeid':widget.treeID,
            'id':widget.treeID,
            
          }).then((value) => print("Tree data successfully added"))
          .catchError((error) => print("Failed to add tree data"));

          //Navigator.of(context).pushNamedAndRemoveUntil('/admin/', (route) => false);
          Navigator.push(
                      context,
                      MaterialPageRoute(
                            builder: (context) => 
                                FormData(
                                  treeID: widget.treeID,
                                  Age: ageController.text,
                                  City:cityController.text,
                                  QRcodeid:widget.treeID,
                                  TreeName:treeNameController.text,
                                  Zone:zoneController.text,
                                  common:commonUtilityController.text,
                                  division:divisionController.text,
                                  girth:girthController.text,
                                  gps:gpsController.text,
                                  height:heightController.text,
                                  tid:widget.treeID,
                                  land:widget.land,
                                  lat:latController.text,
                                  long:longController.text,
                                  railway:railwayController.text,
                                  road:roadController.text,
                                  scientificName:scientificTreeNameController.text,
                                  typeofland:widget.typeofland,
                                  ward:wardController.text,
                                  ),
                        ));
          //Navigator.of(context).pushNamedAndRemoveUntil('/admin/', (route) => false);
        };
        
      },
        child: const Icon(Icons.done),
        focusColor: Colors.orange,
        backgroundColor: Colors.orange,
      ),
    );
  }
}