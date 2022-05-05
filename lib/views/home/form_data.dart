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
  String tree;
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
    this.tree,
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
        title: const Text('Fetched Data'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children:<Widget>[
          
            Container(
              height: 50,
              color: Colors.white,
              child: Text("Tree Age : ${widget.Age.toString()}"),
            ),
             Container(
              height: 50,
              color: Colors.white,
              child: Text("City : ${widget.City.toString()}")
            ),
             Container(
              height: 50,
              color: Colors.white,
              child: Text("QRcodeid : ${widget.QRcodeid.toString()}")
            ),
             Container(
              height: 50,
              color: Colors.white,
              child: Text("Tree Name : ${widget.TreeName.toString()}")
            ),
             Container(
              height: 50,
              color: Colors.white,
              child: Text("Zone : ${widget.Zone.toString()}")
            ),
             Container(
              height: 50,
              color: Colors.white,
              child: Text("Common : ${widget.common.toString()}")
            ),
             Container(
              height: 50,
              color: Colors.white,
              child: Text("division : ${widget.division.toString()}")
            ),
             Container(
              height: 50,
              color: Colors.white,
              child: Text("Girth : ${widget.girth.toString()}")
            ),
             Container(
              height: 50,
              color: Colors.white,
              child: Text("GPS : ${widget.gps.toString()}")
            ),
             Container(
              height: 50,
              color: Colors.white,
              child: Text("Height : ${widget.height.toString()}")
            ),
             Container(
              height: 50,
              color: Colors.white,
              child: Text("Tree ID : ${widget.tid.toString()}")
            ),
             Container(
              height: 50,
              color: Colors.white,
              child: Text("Tree Land : ${widget.land.toString()}")
            ),
             Container(
              height: 50,
              color: Colors.white,
              child: Text("Lattitude : ${widget.lat.toString()}")
            ),
             Container(
              height: 50,
              color: Colors.white,
              child: Text("Longitude : ${widget.long.toString()}")
            ),
             Container(
              height: 50,
              color: Colors.white,
              child: Text("Railway : ${widget.railway.toString()}")
            ),
             Container(
              height: 50,
              color: Colors.white,
              child: Text("Road : ${widget.road.toString()}")
            ),
             Container(
              height: 50,
              color: Colors.white,
              child: Text("Scientific Name : ${widget.scientificName.toString()}")
            ),
             Container(
              height: 50,
              color: Colors.white,
              child: Text("Tree : ${widget.tree.toString()}")
            ),
             Container(
              height: 50,
              color: Colors.white,
              child: Text("Type of Land : ${widget.typeofland.toString()}")
            ),
             Container(
              height: 50,
              color: Colors.white,
              child: Text("Ward : ${widget.ward.toString()}")
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
                                          tree:widget.tree,
                                          typeofland:widget.typeofland,
                                          ward:widget.ward,
                                          ),
                                    ));
                          },
                          child: const Text('Update data', style: TextStyle(fontSize: 20))
                        )
            ),
        ],
        )
    );
  }
}