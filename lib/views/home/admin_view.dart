import 'dart:developer';
import 'dart:io';

import 'package:arbor/views/home/form_data.dart';
import 'package:arbor/views/home/form_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:arbor/utilities/dialogs/logout_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:developer' as devtools show log;
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminView extends StatefulWidget {
  const AdminView({ Key key }) : super(key: key);

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Scan the data')),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async{
              switch (value) {
                
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialog(context);
                  //logout from firebase
                  if(shouldLogout){
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/login/',
                       (_) => false,
                       );
                  }
                  devtools.log(shouldLogout.toString());
                  break;
              }
              devtools.log(value.toString());
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem<MenuAction>(
                value: MenuAction.logout,
                child: Text('Log out'),
                ),
            ];
          },
        )
        ],
        backgroundColor: Color.fromARGB(111, 111, 111, 111),
    ),
    body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QRViewExample(),
            ));
          },
          child: const Text('SCAN NOW'),
          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 47, 110, 146),
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                            textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold)
          )
        ),
      ),
    );
  }
}

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');


  CollectionReference trees = FirebaseFirestore.instance.collection('tree_collection');
  String treeID;
  bool flag;
  var Age;
  var City;
  var QRcodeid;
  var TreeName;
  var Zone;
  var common;
  var division;
  var girth;
  var gps;
  var height;
  var tid;
  var land;
  var lat;
  var long;
  var railway;
  var road;
  var scientificName;
  var typeofland;
  var ward;
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

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

      getTreeAge(id) {
        trees.doc(id).get().then((DocumentSnapshot doc){
        Age = doc.get("Age");
        });
      }

      getTreeCity(id) {
        trees.doc(id).get().then((DocumentSnapshot doc){
            City = doc.get("City");
        });
      }

      getTreeCode(id) {
        trees.doc(id).get().then((DocumentSnapshot doc){
            QRcodeid = doc.get("QRcodeid");
          });
      }

      getTreeName(id) {
        trees.doc(id).get().then((DocumentSnapshot doc){
            TreeName = doc.get("TreeName");
          });
      }

      getTreeZone(id) {
        trees.doc(id).get().then((DocumentSnapshot doc){
            Zone = doc.get("Zone");
          });
      }

      getTreeCommon(id) {
        trees.doc(id).get().then((DocumentSnapshot doc){
            common = doc.get("common");
          });
      }

      getTreeDivision(id) {
        trees.doc(id).get().then((DocumentSnapshot doc){
            division = doc.get("division");
          });
      }

      getTreeGirth(id) {
        trees.doc(id).get().then((DocumentSnapshot doc){
            girth = doc.get("girth");
          });
      }

      getTreeGps(id) {
        trees.doc(id).get().then((DocumentSnapshot doc){
            gps = doc.get("gps");
          });
      }

      getTreeHeight(id) {
        trees.doc(id).get().then((DocumentSnapshot doc){
            height = doc.get("height");
          });
      }

      getTreeId(id) {
        trees.doc(id).get().then((DocumentSnapshot doc){
            tid = doc.get("id");
          });
      }

      getTreeLand(id) {
        trees.doc(id).get().then((DocumentSnapshot doc){
            land = doc.get("land");
          });
      }

      getTreeLat(id) {
        trees.doc(id).get().then((DocumentSnapshot doc){
            lat = doc.get("lat");
          });
      }

      getTreeLong(id) {
        trees.doc(id).get().then((DocumentSnapshot doc){
            long = doc.get("long");
          });
      }

      getTreeRailway(id) {
        trees.doc(id).get().then((DocumentSnapshot doc){
            railway = doc.get("railway");
          });
      }

      getTreeRoad(id) {
        trees.doc(id).get().then((DocumentSnapshot doc){
            road = doc.get("road");
          });
      }

      getTreeScientificName(id) {
        trees.doc(id).get().then((DocumentSnapshot doc){
            scientificName = doc.get("scientificName");
          });
      }

      getTreeTypeofLand(id) {
        trees.doc(id).get().then((DocumentSnapshot doc){
            typeofland = doc.get("typeofland");
          });
      }

      getTreeWard(id) {
        trees.doc(id).get().then((DocumentSnapshot doc){
            ward = doc.get("ward");
          });
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text(
                        'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}', style: TextStyle(fontSize: 15, color: Colors.grey) )
                  else
                    const Text('Scan a code', style: TextStyle(fontSize: 20, color: Colors.grey)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Text('Flash: ${snapshot.data}');
                              },
                            ),
                            style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 123, 207, 207),
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                            textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold)
                           )
                            ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Text(
                                      '${describeEnum(snapshot.data)} Camera');
                                } else {
                                  return const Text('loading');
                                }
                              },
                            ),
                            style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 123, 207, 207),
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                            textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold)
                           )
                            ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            var id = result.code.toString()[35];
                            treeID = id;
                            setState(() {
                                  getTreeById(treeID);
                                  getTreeAge(treeID);
                                  getTreeCity(treeID);
                                  getTreeCode(treeID);
                                  getTreeName(treeID);
                                  getTreeZone(treeID);
                                  getTreeCommon(treeID);
                                  getTreeDivision(treeID);
                                  getTreeGirth(treeID);
                                  getTreeGps(treeID);
                                  getTreeHeight(treeID);
                                  getTreeId(treeID);
                                  getTreeLand(treeID);
                                  getTreeLat(treeID);
                                  getTreeLong(treeID);
                                  getTreeRailway(treeID);
                                  getTreeRoad(treeID);
                                  getTreeScientificName(treeID);
                                  getTreeTypeofLand(treeID);
                                  getTreeWard(treeID);
                                });
                            print(flag);
                            if(flag){
                                 Navigator.of(context).pushNamedAndRemoveUntil('/form/', (route) => false);
                                 Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => 
                                        FormData(
                                          treeID: treeID, 
                                          Age: Age,
                                          City:City,
                                          QRcodeid:QRcodeid,
                                          TreeName:TreeName,
                                          Zone:Zone,
                                          common:common,
                                          division:division,
                                          girth:girth,
                                          gps:gps,
                                          height:height,
                                          tid:tid,
                                          land:land,
                                          lat:lat,
                                          long:long,
                                          railway:railway,
                                          road:road,
                                          scientificName:scientificName,
                                          typeofland:typeofland,
                                          ward:ward,
                                          ),
                                    )); 
                                                                        
                              }else{
                                   // Navigator.of(context).pushNamedAndRemoveUntil('/fetch/', (route) => false);
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => 
                                        FormScreen(treeID: treeID,),
                                    ));
                            }
                          },
                          child: const Text('Submit', style: TextStyle(fontSize: 20),),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 127, 77, 160),
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                            textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold)
                           )
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

enum MenuAction { logout }