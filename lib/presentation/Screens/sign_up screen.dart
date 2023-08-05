import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 40,
            ),
          )),
      body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          children: [
            SizedBox(
              height: 24,
            ),
            Text(
              "Sign\nUp",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 36,
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
                hintText: "Name",
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
                hintText: "Email",
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
                hintText: "phone",
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
                suffixIcon: Icon(Icons.visibility_off),
                hintText: "Password",
              ),
            ),
            SizedBox(
              height: 32,
            ),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
                suffixIcon: Icon(Icons.visibility_off),
                hintText: "confirm Password",
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                isLoading
                    ? CircularProgressIndicator()
                    : InkWell(
                        onTap: () async {
                          isLoading = true;
                          setState(() {});
                          final uri =
                              Uri.parse("https://v-mesta.com/api/sign-up");
                          var request = http.Request('POST', uri);
                          final body = json.encode({
                            "name": _nameController.text,
                            "country_code": 966,
                            "phone": _phoneController.text,
                            "email": _emailController.text,
                            "password": _passwordController.text,
                            "password_confirmation":
                                _confirmPasswordController.text,
                            "d_o_b": '13-10-2001',
                          });
                          print("request body is ::: $body");
                          request.body = body;
                          request.headers.addAll({
                            "Content-Type": "application/json",
                          });
                          var response = await request.send();
                          log(response.statusCode.toString(),
                              name: "status code");
                          if (response.statusCode == 200) {
                            String responseBody =
                                await response.stream.bytesToString();
                            log(responseBody, name: "response body");
                            final decodedBody = json.decode(responseBody);
                            log(decodedBody.toString(),
                                name: " decoded response body");
                            isLoading = false;
                            setState(() {});
                            if (decodedBody['key'] == "needActive") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => OtpScreen(
                                            email: _emailController.text,
                                          )));
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
                          width: 101,
                          decoration: BoxDecoration(
                            color: Color(0xffA71E27),
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
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ]),
    );
  }
}
