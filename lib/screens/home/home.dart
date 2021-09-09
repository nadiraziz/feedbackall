import 'package:feedback/screens/home/dashboard.dart';
import 'package:feedback/screens/welcome_screen.dart';
import 'package:feedback/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  static String id = 'home_screen';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
          Expanded(child: Image.asset('assets/images/vivah.png', fit: BoxFit.fitWidth)),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ElevatedButton(
                child: Text('Dashboard', style: TextStyle(fontSize: 24),),
                onPressed: () {
                  Navigator.pushNamed(context, Dashboard.id);
                },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
                onPressed: () async {
                  await  authService.signOut();
                  Navigator.pushNamed(context, WelcomeScreen.id);
                },
                child: Text('Log Out')),
          ),
          ]
        ),
      ),
    );
  }
}
