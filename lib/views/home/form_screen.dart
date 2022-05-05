import 'package:arbor/views/home/form_data.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
//import 'package:slider/slider.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'firebase_options.dart';

class FormScreen extends StatefulWidget {
  final String treeID;
  const FormScreen({ Key key, this.treeID }) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  TextEditingController _cityController;
  TextEditingController _zoneController;
  TextEditingController _divisionController;
  TextEditingController _wardController;
  TextEditingController _gpsController;
  TextEditingController _latController;
  TextEditingController _longController;
  TextEditingController _commonUtilityController;
  TextEditingController _roadController;
  TextEditingController _railwayController;
  TextEditingController _treeNameController;
  TextEditingController _scientificTreeNameController;
  TextEditingController _ageController;
  TextEditingController _heightController;
  TextEditingController _girthController;
  

  @override
  void initState(){
    _cityController = TextEditingController();
    _zoneController = TextEditingController();
    _divisionController = TextEditingController();
    _wardController = TextEditingController();
    _gpsController = TextEditingController();
    _latController = TextEditingController();
    _longController = TextEditingController();
    _commonUtilityController = TextEditingController();
    _roadController = TextEditingController();
    _railwayController = TextEditingController();
    _treeNameController = TextEditingController();
    _scientificTreeNameController = TextEditingController();
    _ageController = TextEditingController();
    _heightController = TextEditingController();
    _girthController = TextEditingController();
    return super.initState();
  }

  @override
  void dispose() {
    _cityController.dispose();
    _zoneController.dispose();
    _divisionController.dispose();
    _wardController.dispose();
    _gpsController.dispose();
    _latController.dispose();
    _longController.dispose();
    _commonUtilityController.dispose();
    _roadController.dispose();
    _railwayController.dispose();
    _treeNameController.dispose();
    _scientificTreeNameController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _girthController.dispose();
    super.dispose();
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

    CollectionReference tree_data = FirebaseFirestore.instance.collection('tree_collection');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
        automaticallyImplyLeading: false,
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
                  controller: _cityController,
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
                  controller: _zoneController,
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
                  controller: _divisionController,
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
                  controller: _wardController,
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
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "GPS location cannot be empty";
                    } 
                    return null;
                  },
                  controller: _gpsController,
                  decoration: InputDecoration(
                    labelText: 'GPS location',
                    hintText: 'GPS location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),

              const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("Lattitude")
                  )
                ),

               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "lattitude cannot be empty";
                    } 
                    return null;
                  },
                  controller: _latController,
                  decoration: InputDecoration(
                    labelText: 'lattitude',
                    hintText: 'lattitude',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),


                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("Longitude")
                  )
                ),

               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "lonitude cannot be empty";
                    } 
                    return null;
                  },
                  controller: _longController,
                  decoration: InputDecoration(
                    labelText: 'longitude',
                    hintText: 'longitude',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),

              const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("Common Utility")
                  )
                ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "common utility cannot be empty";
                    } 
                    return null;
                  },
                  controller: _commonUtilityController,
                  decoration: InputDecoration(
                    labelText: 'common utility',
                    hintText: 'common utility',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),
                
              
             
              const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("ROAD")
                  )
                ),

               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "road cannot be empty";
                    } 
                    return null;
                  },
                  controller: _roadController,
                  decoration: InputDecoration(
                    labelText: 'road',
                    hintText: 'road',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),

              const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: Text("Railway")
                  )
                ),

               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "Railway";
                    } 
                    return null;
                  },
                  controller: _railwayController,
                  decoration: InputDecoration(
                    labelText: 'railway',
                    hintText: 'railway',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
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
                  controller:_treeNameController,
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
                  controller: _scientificTreeNameController,
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
                  controller: _ageController,
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
                  controller: _heightController,
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
                  controller: _girthController,
                  decoration: InputDecoration(
                    labelText: 'GIRTH IN MTRS',
                    hintText: 'GIRTH IN MTRS',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                ),
              ),


               Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                                  Navigator.of(context).pushNamedAndRemoveUntil('/admin/', (route) => false);
                          },
                          child: const Text('Go back', style: TextStyle(fontSize: 20))
                        )
            ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()
        {
        if(_formKey.currentState.validate()){
          

          

          tree_data.doc(widget.treeID).set({
            'City':_cityController.text,
            'Zone':_zoneController.text,
            'division':_divisionController.text,
            'ward':_wardController.text,
            'gps':_gpsController.text,
            'common':_commonUtilityController.text,
            'lat':_latController.text,
            'long':_longController.text,
            'railway':_railwayController.text,
            'road':_roadController.text,
            'land':selectedValue_gvt_land,
            'typeofland':selectedValue_land_type,
            'TreeName':_treeNameController.text,
            'scientificName':_scientificTreeNameController.text,
            'Age':_ageController.text,
            'height':_heightController.text,
            'girth':_girthController.text,
            'QRcodeid':widget.treeID,
            'id':widget.treeID,
            
          }).then((value) => print("Tree data successfully added"))
          .catchError((error) => print("Failed to add tree data"));

            Navigator.push(
                      context,
                      MaterialPageRoute(
                            builder: (context) => 
                                FormData(
                                  treeID: widget.treeID,
                                  Age: _ageController.text,
                                  City:_cityController.text,
                                  QRcodeid:widget.treeID,
                                  TreeName:_treeNameController.text,
                                  Zone:_zoneController.text,
                                  common:_commonUtilityController.text,
                                  division:_divisionController.text,
                                  girth:_girthController.text,
                                  gps:_gpsController.text,
                                  height:_heightController.text,
                                  tid:widget.treeID,
                                  land:selectedValue_gvt_land,
                                  lat:_latController.text,
                                  long:_longController.text,
                                  railway:_railwayController.text,
                                  road:_roadController.text,
                                  scientificName:_scientificTreeNameController.text,
                                  typeofland:selectedValue_land_type,
                                  ward:_wardController.text,
                                  ),
                        ));
          //Navigator.of(context).pushNamedAndRemoveUntil('/admin/', (route) => false);
        };
        
      },
        child: const Icon(Icons.done),
      ),
      
    );
  }
}

