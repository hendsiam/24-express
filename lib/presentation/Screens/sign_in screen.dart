import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sign_up/presentation/Screens/change_password.dart';
import 'package:sign_up/presentation/Screens/home_screen.dart';
import 'package:sign_up/presentation/Screens/sign_up%20screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenstate();
}

class _SignInScreenstate extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isScure = true;
  bool isLoading = false;

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
                onTap: () async {
                  isLoading = true;
                  setState(() {});

                  final uri = Uri.parse('https://v-mesta.com/api/sign-in');
                  var request = Request('POST', uri);
                  final body = json.encode({
                    "email": _emailController.text,
                    "password": _passwordController.text,
                    "device_id": 111,
                    "device_type": "ios",
                  });
                  print("request body is ::: $body");
                  request.body = body;
                  request.headers.addAll({
                    "Content-Type": "application/json",
                  });
                  var response = await request.send();
                  log(response.statusCode.toString(), name: "status code");
                  if (response.statusCode == 200) {
                    String responseBody = await response.stream.bytesToString();
                    log(responseBody, name: "response body");
                    final decodedBody = json.decode(responseBody);
                    log(decodedBody.toString(), name: " decoded response body");
                    isLoading = false;
                    setState(() {});
                    if (decodedBody['key'] == "success") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      }));
                    } else if (decodedBody['key'] == "fail") {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              title: Text("Error!"),
                              content: Text(
                                decodedBody['msg'].toString(),
                              ),
                            );
                          });
                    } else {
                      print("error");
                    }
                  }
                },
                child: Container(
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
