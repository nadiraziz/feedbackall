import 'package:feedback/screens/authenticate/login_page.dart';
import 'package:feedback/screens/home/dashboard.dart';
import 'package:feedback/screens/rating/rate_screen.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('My Home page'),
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                  onPressed: (){
                    context.read<AuthenticationService>().signOut();
                    // Navigator.of(context)
                    //     .pushNamedAndRemoveUntil(LoginPage.id, (Route<dynamic> route) => false);
                    Navigator.pushNamed(context, LoginPage.id);
                  },
                child: Text('Log Out')),
            )
          ],
        ),
        elevation: 0.0,

      ),
      body: Center(
        child: Column(
          children: [
          Expanded(child: Image.asset('assets/images/home.png', fit: BoxFit.fitWidth)),
          ElevatedButton(
            child: Text('Rate the Hotel', style: TextStyle(fontSize: 24),),
            onPressed: () {
              Navigator.pushNamed(context, Rating.id);
            },
          ),
          ElevatedButton(
              child: Text('Dashboard', style: TextStyle(fontSize: 24),),
              onPressed: () {
                Navigator.pushNamed(context, Dashboard.id);
              },
            ),
          ]
        ),
      ),
    );
  }
}
