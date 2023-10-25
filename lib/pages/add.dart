import 'package:admin/service/cloud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
TextEditingController program = TextEditingController();

  TextEditingController clgName = TextEditingController();
  TextEditingController category = TextEditingController();
  //TextEditingController cover= TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController entryfee = TextEditingController();
  //TextEditingController images = TextEditingController();
  TextEditingController members = TextEditingController();
  TextEditingController pDate = TextEditingController();









  bool isEditing = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.purple.shade100,
              )),
          backgroundColor: Colors.white,
          elevation: 15,
          title: Text(
            "Add Events",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Collge Name :"),
                          Container(width: 200, child: TextField(controller: clgName,)),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Program Name:"),
                          Container(width: 200, child: TextField(controller: program,)),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Date :"),
                          Container(width: 250, child: TextField(controller: pDate,)),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Description:"),
                          Container(width: 250, child: TextField(controller: des,)),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Category:"),
                          Container(width: 250, child: TextField(
                            controller: category,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Members per team:"),
                          Container(width: 200, child: TextField(
                            controller: members,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Entry Fee:"),
                          Container(width: 250, child: TextField(
                            controller: entryfee,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Add Images:"),
                          Container(
                              child: Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 30, top: 10),
                            child: Icon(Icons.photo),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                          onTap: ()async{
                            FirestoreData().addData({"clgName":clgName.text,"category":category.text,"cover":"","date":date.text,"des":des.text,"entryfee":entryfee.text
                             ,"images":"","members":members.text,"pDate":pDate.text,"programName":program.text});
                          },
                          child: Container(
                            height: 60,
                            width: 100,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                color: Colors.purple.shade100,
                                child: Center(child: Text("Add Event"))),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
