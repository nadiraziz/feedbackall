import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Dashboard extends StatefulWidget {
  static String id = 'dash_screen';
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('DASHBOARD', style: TextStyle(
        color: Colors.white38,
        fontSize: 35),)
      ),
      body: Column(
        children: [
          Text('Total people rated : 10')
        ],
      ),
    );

  }
}
