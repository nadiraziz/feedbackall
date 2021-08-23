import 'package:feedback/screens/authenticate/login_page.dart';
import 'package:feedback/screens/authenticate/sign_up.dart';
import 'package:flutter/material.dart';



class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(

              children: [
                SizedBox(
                  height: 100.0,
                ),
                Expanded(child: Image.asset('assets/images/welcome.png', fit: BoxFit.cover)),
                Text(
                  'Welcome To FeedBack', style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
                ),
                SizedBox(
                  height: 50.0,
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, LoginPage.id);
                  },
                  child: Text('  Sign In  ', style: TextStyle(fontSize: 24)),
                  style: TextButton.styleFrom(),
                ),
                SizedBox(
                  height: 50.0,
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, SignUp.id);
                  },
                  child: Text(' Sign Up ', style: TextStyle(fontSize: 24)),
                  style: TextButton.styleFrom(),
                ),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
    );
  }
}

