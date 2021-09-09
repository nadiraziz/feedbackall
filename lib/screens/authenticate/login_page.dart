import 'package:feedback/screens/home/home.dart';
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Material(
          color: Colors.white,
          child: Form(
          key: _formKey,
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
                        controller: _emailController,
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
                        controller: _passwordController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) => val!.length < 6 ? 'Enter 6+ character': null,
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
                          await authService.signInWithEmailPassword(_emailController.text, _passwordController.text);
                          Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
                        }),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }
}
