import 'package:feedback/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SignUp extends StatefulWidget {

  static String id = 'sign_up';

  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(child: Image.asset('assets/images/signup.png', fit: BoxFit.cover)),
            SizedBox(
              height: 20.0,
            ),
            Text('Sign Up your Account', style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold),),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username"
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password"
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    child: Text('Sign up'),
                    style: TextButton.styleFrom(),
                    onPressed: (){
                      context.read<AuthenticationService>().signUp(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());
                    },
                  ),
                ]
              ),
            ),
        ]),
      ),
    );
  }
}


