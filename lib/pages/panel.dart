import 'package:admin/pages/registered.dart';
import 'package:admin/service/cloud.dart';
import 'package:flutter/material.dart';

import 'package:admin/pages/add.dart';

import 'account.dart';
class AdminPanel extends StatefulWidget {

  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();

}

class _AdminPanelState extends State<AdminPanel> {

  TextEditingController txt =TextEditingController();
    upload ()async{
    Map<String,dynamic> data ={
      'event name': txt.text,
      'college': 'MIT'
    };
    await FirestoreData().addData(data);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 15,
        title: Text("Admin",style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body:       SafeArea(
        child: ListView(
          children:[ Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 150,
                      width: 150,
                      child: InkWell(
                        onTap: (){
                          Navigator.push((context), MaterialPageRoute(builder: (context)=>AddPage()));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          color: Colors.purple.shade100,
                          elevation: 15,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add),
                                Text("Add Event")
                              ],
                            ),
                          ),
                        ),
                      )),
                  InkWell(
                    onTap: (){
                      Navigator.push((context), MaterialPageRoute(builder: (context)=>Registered()));
                    },
                    child: Container(
                        height: 150,
                        width: 150,
                        child: Card(
                          elevation: 15,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          color: Colors.blue.shade100,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.person),
                                Text("Registered Users")
                              ],
                            ),
                          ),
                        )),
                  ),

                ],
              ),


             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /* Later on feature
                  Container(
                      height: 150,
                      width: 150,
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        color: Colors.pink.shade100,
                        elevation: 20,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.event),
                              Text("Events")
                            ],
                          ),
                        ),
                      )), */
                  Container(
                      height: 150,
                      width: 150,
                      child: InkWell(
                        onTap: (){
                          Navigator.push((context), MaterialPageRoute(builder: (context)=>Account()));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          color: Colors.green.shade100,
                          elevation: 15,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.admin_panel_settings),
                                Text("Admin Account")
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),

            ],
          ),
        ]
        ),
      )
    );
  }
}
