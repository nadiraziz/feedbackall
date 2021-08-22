import 'package:feedback/screens/authenticate/sign_up.dart';
import 'package:feedback/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  static String id = 'login_screen';


  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username"
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
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
                      child: Text('Login'),
                      style: TextButton.styleFrom(),
                      onPressed: (){
                        context.read<AuthenticationService>().signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());
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


