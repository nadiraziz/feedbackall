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
  final _formKey = GlobalKey<FormState>();


  String email = "";
  String password = "";



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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (val) => {
                        setState(() => email = val)
                      },
                      validator: (val) => val!.isEmpty ? 'Enter a Email': null,
                      decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username"
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      validator: (val) => val!.length < 6 ? 'Enter 6+ character': null,
                      onChanged: (val) => {
                        setState(() => password = val)
                      },
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
                      onPressed: () async {
                        setState(() {
                          if(_formKey.currentState!.validate()){
                            context.read<AuthenticationService>().signUp(
                                email: email,
                                password: password);
                          }
                        });
                      },
                    ),
                  ]
                ),
              ),
            ),
        ]),
      ),
    );
  }
}
