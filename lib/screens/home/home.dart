import 'package:feedback/screens/rating/rate_screen.dart';
import 'package:feedback/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  static String id = 'home_screen';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('My Home page'),
            Align(
              alignment: Alignment.topRight,
              child: MaterialButton(
                  onPressed: (){
                    context.read<AuthenticationService>().signOut();
                  },
                child: Text('Log Out')),
            )
          ],
        ),
        elevation: 0.0,

      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Rate the Hotel'),
          onPressed: () {
            Navigator.pushNamed(context, Rating.id);
          },
        ),

      ),
    );
  }
}
