import 'package:feedback/screens/authenticate/login_page.dart';
import 'package:feedback/screens/home/home.dart';
import 'package:feedback/screens/welcome_screen.dart';
import 'package:feedback/services/User.dart';
import 'package:feedback/services/auth.dart';
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
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<UserModel?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<UserModel?> snapshot){
          if (snapshot.connectionState == ConnectionState.active){
            final UserModel? user = snapshot.data;
            return user == null? WelcomeScreen() : HomePage();
          }else{
            return Scaffold(body: Center(child: CircularProgressIndicator(),),);
    }
    });
  }
}
