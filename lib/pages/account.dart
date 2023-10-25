import 'package:flutter/material.dart';
class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded,color: Colors.purple.shade100,),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
         Container(
           margin: EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Text("Fill The Field with Receiver Account UPI and Verify"),
                Row(
                  children: [
                    Text("Enter UPI:"),
                    Container(
                        width: 200,
                        child: TextField()),
                  ],
                ),
                SizedBox(height: 30,),
                Text("We Will send an OTP to the College Email to verify its You"),
                InkWell(
                    onTap: (){}, child: Container(
                  height: 60,width: 100,
                  child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      color: Colors.purple.shade100,
                      child: Center(child: Text("Send OTP"))),
                )),
                Container(
                    width: 200,
                    child: TextField()),
                SizedBox(height: 50,),
                InkWell(
                    onTap: (){}, child: Container(
                  height: 60,width: 100,
                  child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      color: Colors.purple.shade100,
                      child: Center(child: Text("Verify"))),
                )),


              ],
            ),
          )
        ],
      ),
    );
  }
}
