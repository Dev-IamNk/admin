import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registered extends StatefulWidget {

  const Registered({super.key});

  @override
  State<Registered> createState() => _RegisteredState();
}

class _RegisteredState extends State<Registered> {

  @override
  Widget build(BuildContext context) {
    try{ return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
              margin: EdgeInsets.only(right: 30),
              child: Icon(Icons.search, color: Colors.purple.shade100,))
        ],
        title: Text("Registered Users", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded, color: Colors.purple.shade100,),
        ),
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, i) {
                  final DocumentSnapshot documentSnapshot =
                  snapshot.data!.docs[i];
                  return Container(
                    height: 65,
                    margin: EdgeInsets.all(25),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Name :"),
                              Text(documentSnapshot['name']),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Event :"),
                              Text(documentSnapshot['event'])],
                          ),
                          Row(
                            children: [
                              Text("Amount: "),
                              Text(documentSnapshot['amnt']),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
          return Container();
        },

      ),
    );
  }
  catch(e){
      return Scaffold(
        body: Center(
          child: Container(
            child: Text("Something went wrong try again later"),
          ),
        ),
      );
  }
  }
}
