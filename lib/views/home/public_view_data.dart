import 'package:flutter/material.dart';

class PubliViewData extends StatefulWidget {
  const PubliViewData({ Key key }) : super(key: key);

  @override
  State<PubliViewData> createState() => _PubliViewDataState();
}

class _PubliViewDataState extends State<PubliViewData> {
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
      body:  Column(
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
                            "For this tree data doesn't exist",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                                  Navigator.of(context).pushNamedAndRemoveUntil('/public/', (route) => false);
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
        ],
        
      ),

             
    );
  }
}