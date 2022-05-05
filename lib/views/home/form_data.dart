import 'package:arbor/views/home/form_update.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'dart:developer' as devtools show log;
import 'package:flutter/widgets.dart';


class FormData extends StatefulWidget {
  //CollectionReference tree_data = FirebaseFirestore.instance.collection('tree_data');
  final String treeID;
  String Age;
  String City;
  String QRcodeid;
  String TreeName;
  String Zone;
  String common;
  String division;
  String girth;
  String gps;
  String height;
  String tid;
  String land;
  String lat;
  String long;
  String railway;
  String road;
  String scientificName;
  String typeofland;
  String ward;

  FormData({ 
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
  State<FormData> createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  bool flag;
  CollectionReference trees = FirebaseFirestore.instance.collection('tree_collection');

    @override
    void initState() {
      return super.initState();
  }


    getTreeById(id) async{
    trees.doc(id).get().then((DocumentSnapshot doc){
      // print(doc.data);
      if(doc.exists){
        flag = true;
      } else{
        flag = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('TREE DATA'),
          ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(111, 111, 111, 111),
      ),
      body: ListView(
          padding: const EdgeInsets.all(16),
          children: [

            Card(
            color: const Color.fromRGBO(143, 148, 251, .6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                          'TREE ID',
                          style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                    ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          widget.QRcodeid.toString(),
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
            
            Card(
            color: const Color.fromRGBO(143, 148, 251, .6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: const Text(
                          'TREE CITY',
                          style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                    ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          widget.City.toString().toUpperCase(),
                          style: const TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ),

            Card(
            color: const Color.fromRGBO(143, 148, 251, .6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                          'TREE ZONE',
                          style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                    ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          widget.Zone.toString().toUpperCase(),
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ),

             Card(
            color: const Color.fromRGBO(143, 148, 251, .6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                          'TREE DIVISION',
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                    ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          widget.division.toString().toUpperCase(),
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ),

            Card(
            color: const Color.fromRGBO(143, 148, 251, .6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                          'WARD',
                          style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                    ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          widget.ward.toString().toUpperCase(),
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ),

            Card(
            color: const Color.fromRGBO(143, 148, 251, .6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: const Text(
                          'GPS LOCATION',
                          style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                    ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          widget.gps.toString().toUpperCase(),
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ),


            Card(
            color: const Color.fromRGBO(143, 148, 251, .6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                          'LATTITUDE',
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                    ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          widget.lat.toString().toUpperCase(),
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ),

            Card(
            color: const Color.fromRGBO(143, 148, 251, .6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                          'LONGITUDE',
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                    ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          widget.long.toString().toUpperCase(),
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ),

            Card(
            color: const Color.fromRGBO(143, 148, 251, .6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                          'COMMON UTILITY',
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                    ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          widget.common.toString().toUpperCase(),
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ),

            Card(
            color: const Color.fromRGBO(143, 148, 251, .6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                          'ROAD',
                          style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                    ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          widget.road.toString().toUpperCase(),
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ),

            Card(
            color: const Color.fromRGBO(143, 148, 251, .6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: const Text(
                          'RAILWAY',
                          style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                    ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          widget.railway.toString().toUpperCase(),
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ),

            Card(
            color: const Color.fromRGBO(143, 148, 251, .6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                          'TREE LAND',
                          style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                    ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          widget.land.toString().toUpperCase(),
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ),

            Card(
            color: const Color.fromRGBO(143, 148, 251, .6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                          'TYPE OF LAND',
                          style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                    ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          widget.typeofland.toString().toUpperCase(),
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ),

             Card(
            color: const Color.fromRGBO(143, 148, 251, .6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                          'TREE NAME',
                          style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                    ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          widget.TreeName.toString().toUpperCase(),
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ),

            Card(
            color: const Color.fromRGBO(143, 148, 251, .6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                          'SCIENTIFIC NAME',
                          style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                    ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          widget.scientificName.toString().toUpperCase(),
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ),

            Card(
            color: const Color.fromRGBO(143, 148, 251, .6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: const Text(
                          'TREE AGE',
                          style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                    ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          widget.Age.toString(),
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ),

            Card(
            color: const Color.fromRGBO(143, 148, 251, .6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: const Text(
                          'TREE HEIGHT',
                          style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                    ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          widget.height.toString(),
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
        
            Card(
            color: const Color.fromRGBO(143, 148, 251, .6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: const Text(
                          'TREE GIRTH',
                          style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                    ),
                      const SizedBox(height: 5),
                      Center(
                        child: Text(
                          widget.girth.toString(),
                          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ),

            
          Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                                  Navigator.of(context).pushNamedAndRemoveUntil('/admin/', (route) => false);
                          },
                          child: const Text('Go back', style: TextStyle(fontSize: 20)),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 164, 97, 180),
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                            textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold)
                          ),
                        )
            ),

                  Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                                  //Navigator.of(context).pushNamedAndRemoveUntil('/formupdate/', (route) => false);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => 
                                        FormUpdate(
                                          treeID: widget.treeID,
                                          Age:widget.Age,
                                          City:widget.City,
                                          QRcodeid:widget.QRcodeid,
                                          TreeName:widget.TreeName,
                                          Zone:widget.Zone,
                                          common:widget.common,
                                          division:widget.division,
                                          girth:widget.girth,
                                          gps:widget.gps,
                                          height:widget.height,
                                          tid:widget.tid,
                                          land:widget.land,
                                          lat:widget.lat,
                                          long:widget.long,
                                          railway:widget.railway,
                                          road:widget.road,
                                          scientificName:widget.scientificName,
                                          typeofland:widget.typeofland,
                                          ward:widget.ward,
                                          ),
                                    ));
                          },
                          child: const Text('Update data', style: TextStyle(fontSize: 20)),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 123, 207, 207),
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                            textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold)
                           )
                        ),
                  )
          ],
        ),
    );

  }

}