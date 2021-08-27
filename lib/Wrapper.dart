import 'package:feedback/screens/home/home.dart';
import 'package:feedback/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatefulWidget {
  static String id = 'wrapper';
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();


    if (firebaseUser != null){
      return HomePage();
    }
    return WelcomeScreen();
  }
}
