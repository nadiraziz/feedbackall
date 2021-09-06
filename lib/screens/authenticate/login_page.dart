import 'package:feedback/screens/authenticate/sign_up.dart';
import 'package:feedback/screens/home/home.dart';
import 'package:feedback/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  static String id = 'login_screen';


  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final _formKey = GlobalKey<FormState>();
  // if(_formKey.currentState!.validate()){
  final User? user = FirebaseAuth.instance.currentUser;

  String email = "";
  String password = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Material(
          color: Colors.white,
          child: Column(

            children: [
              Expanded(child: Image.asset('assets/images/login.png', fit: BoxFit.cover)),
              SizedBox(
                height: 10.0,
              ),
              Text('Login your account', style: TextStyle(
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
                      onChanged: (val) => {
                        setState(() => email = val)
                      },
                      validator: (val) => val!.isEmpty ? 'Enter a Email': null,
                      decoration: InputDecoration(
                          hintText: "Enter Email",
                          labelText: "Email"
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
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
                      child: Text('Login'),
                      style: TextButton.styleFrom(),
                      onPressed: () async {
                           setState(() {
                             context.read<AuthenticationService>().signIn(
                                 email: email,
                                 password: password);
                             // Navigator.of(context)
                             //     .pushNamedAndRemoveUntil(HomePage.id, (Route<dynamic> route) => false);
                             Navigator.pushNamedAndRemoveUntil(context, HomePage.id, ModalRoute.withName('/'));
                           });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Text('If you don\'t Have account', style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17),),
                        SizedBox(
                          width: 20.0,
                        ),
                        ElevatedButton(
                          child: Text('Sign Up'),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black54,
                          ),
                          onPressed: (){
                            Navigator.pushNamed(context, SignUp.id);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}



void goHome(){

}
