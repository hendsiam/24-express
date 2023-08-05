import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget{

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 40,
            ),
          )
      ),
      body:ListView(
          padding: EdgeInsets.symmetric(horizontal: 16,),
          children:[
            SizedBox(height: 24,),
            Text("Change\nPassword",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 36,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
                hintText: "New Password",
              ),
            ),
            SizedBox(height: 16,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
                hintText: "Confirm Password",
              ),
            ),
            SizedBox(height:32,),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    print("change password");
                  },
                  child: Container(
                    height: 45,
                    width: 200,
                    decoration: BoxDecoration(
                      color:Color(0xffA71E27),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffA71E27),
                          blurRadius: 5.0, // soften the shadow
                          spreadRadius: 1.0, //extend the shadow
                        )
                      ],
                    ),
                    child: Center(
                      child: Text('CHANGE PASSWORD',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white ,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ]
      ),
    );
  }
}