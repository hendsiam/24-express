import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sign_up/presentation/Screens/change_password.dart';
import 'package:sign_up/presentation/Screens/home_screen.dart';
import 'package:sign_up/presentation/Screens/sign_up%20screen.dart';

import '../../service/firebase_authentication_service.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenstate();
}

class _SignInScreenstate extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isScure = true;
  bool isLoading = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 32, right: 32, top: 122),
          child: Column(
            children: [
              Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 64,
                child: TextField(
                  controller: _emailController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      labelText: "Email,User",
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      floatingLabelStyle: const TextStyle(color: Colors.red)),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 64,
                child: TextField(
                  controller: _passwordController,
                  obscureText: isScure,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      labelText: "Password",
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          isScure = !isScure;
                          setState(() {});
                          print(isScure);
                        },
                        child: Icon(
                          isScure ? Icons.visibility_off : Icons.visibility,
                          size: 20,
                          color: Colors.grey,
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ChangePassword();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'change Password!',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 13,
              ),
    InkWell(
    onTap: ()async{
    FirebaseAuthenticationService
        .signIn(
    email: _emailController.text,
    password: _passwordController.text,
    ).then(
    (credential){
    print("cred. ${credential.user?.uid}");
    },
    onError: (err){
    errorMessage  =err.toString();
    setState(() {

    });
    print("error ${err.toString()}");
    },
    );

    // Navigator.pushAndRemoveUntil(context,
    //     MaterialPageRoute(builder: (c)=>HomeScreen())
    //     , (route) => false);
    },


                  child:
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffA71E27).withOpacity(.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset:
                          const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(22),
                      color: Color(0xffA71E27),
                    ),
                    child: Center(
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
    ),
              const SizedBox(
                height: 23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account ?',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      //Navigate to the sign up screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'Sing up',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
