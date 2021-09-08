import 'package:feedback/screens/authenticate/login_page.dart';
import 'package:feedback/screens/rating/compents/customer_info.dart';
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
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/vivah.png'),fit: BoxFit.contain
                )),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, CustomerInfo.id);
                    },
                    child: Text('Start', style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300)),
                    style: TextButton.styleFrom(),
                  ),
                  SizedBox(height: 20.0),
                  MaterialButton(
                    onPressed: (){
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                    child: Text('Admin', style: TextStyle(fontSize: 14,color: Colors.grey)),
                    // style: TextButton.styleFrom(),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

