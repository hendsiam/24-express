import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_up/presentation/Screens/categories_home_screen.dart';
import 'package:sign_up/presentation/Screens/home_screen.dart';
import 'package:sign_up/presentation/Screens/milk.dart';
import 'package:sign_up/presentation/Screens/sign_in%20screen.dart';

bool isLoggedIn = false;
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: FirebaseAuth.instance.currentUser!=null
    ?
    HomeScreen()
        :
    SignInScreen(),
    );
  }
}
