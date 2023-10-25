import 'dart:async';
import 'package:admin/service/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:admin/pages/panel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class adminSign extends StatefulWidget {
  const adminSign({super.key});

  @override
  State<adminSign> createState() => _adminSignState();
}

class _adminSignState extends State<adminSign> {

  TextEditingController otpController = TextEditingController();
  TextEditingController pass = TextEditingController();
  EmailOTP myauth = EmailOTP();

  List clgNames = ['PTU', 'SMVEC', 'MVIT', 'SVMC'];
  List clgMails = [
    'nandhaarasan@gmail.com',
    'nandhakumarannkit@gmail.com',
    'nandhaarasan@gmail.com',
    'nandhakumarannkit@gmail.com'
  ];
  List foundMatch = [];
  TextEditingController txt = TextEditingController();
  TextEditingController txtmail = TextEditingController();
  void runfilter(String txt) {
    if (txt.isEmpty) {
      foundMatch = clgNames;
    } else {
      foundMatch = clgNames
          .where((element) =>
          element.toString().toLowerCase().contains(txt.toLowerCase()))
          .toList();
    }
    setState(() {
      foundMatch;
    });
  }

  String clg = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade100,
        title: Text("Admin Register"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  SizedBox(height: 30,),
                  Text("Select College "),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 200,
                          child: TextField(onChanged: (value) => runfilter(value), controller: txt)),
                      Icon(Icons.search)
                    ],
                  ),
                  Container(
                    height: 85,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, i) => GestureDetector(
                        onTap: () {
                          setState(() {
                            clg = foundMatch[i];
                            txt.text = clg;
                            foundMatch = [];
                            if (clg.toLowerCase() == 'smvec') {
                              txtmail.text = clgMails[1];
                            } else if (clg.toLowerCase() == 'ptu') {
                              txtmail.text = clgMails[0];
                            } else if (clg.toLowerCase() == 'mvit') {
                              txtmail.text = clgMails[2];
                            } else if (clg.toLowerCase() == 'svmc') {
                              txtmail.text = clgMails[3];
                            }
                          });
                        },
                        child: Container(
                          height: 50,
                          child: Card(
                            child: Center(child: Text(foundMatch[i])),
                          ),
                        ),
                      ),
                      itemCount: foundMatch.length,
                    ),
                  ),
                  Container(
                    child: Text(txtmail.text.toUpperCase()),
                  ),
                  SizedBox(height: 30,),

                  InkWell(
                    child:  Container(
                      width: 150,
                      height: 50,
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        color: Colors.purple.shade100,
                        elevation: 15,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Send OTP")
                            ],
                          ),
                        ),
                      ),
                    ),
                      onTap: () async {
                        myauth.setConfig(
                            appEmail: "nandhakumarannkit@gmail.com",
                            appName: "Email OTP",
                            userEmail: txtmail.text,
                            otpLength: 6,
                            otpType: OTPType.digitsOnly);
                        if (await myauth.sendOTP() == true) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("OTP has been sent"),
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Oops, OTP send failed"),
                          ));
                        }
                      },
                    ),


                  Center(
                    child: Container(
                      width: 200,
                      child: TextField(
                        controller: otpController,
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () async {
                        if (await myauth.verifyOTP(otp: otpController.text) == true) {
                          Auth().signUp(email: txtmail.text, pass:'1234567890');
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminPanel()));
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("OTP is verified"),
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Invalid OTP"),
                          ));
                        }
                      },
                      child:InkWell(
                        child:  Container(
                          width: 150,
                          height: 50,
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            color: Colors.purple.shade100,
                            elevation: 15,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Verify OTP ")
                                ],
                              ),
                            ),
                          ),
                        ),)
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
