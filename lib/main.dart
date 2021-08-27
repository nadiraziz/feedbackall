import 'dart:ui';
import 'package:feedback/Wrapper.dart';
import 'package:feedback/screens/authenticate/login_page.dart';
import 'package:feedback/screens/authenticate/sign_up.dart';
import 'package:feedback/screens/dashboard.dart';
import 'package:feedback/screens/home/home.dart';
import 'package:feedback/screens/rating/compents/rate_screen.dart';
import 'package:feedback/screens/welcome_screen.dart';
import 'package:feedback/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) => context.read<AuthenticationService>().authStateChanges,
            initialData: null
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Color.fromRGBO(171, 105, 50, 0),
          primaryTextTheme: GoogleFonts.latoTextTheme()),
          darkTheme: ThemeData(
          brightness: Brightness.dark) ,
          initialRoute: Wrapper.id,
          routes: {
            LoginPage.id: (context) => LoginPage(),
            Wrapper.id: (context) => Wrapper(),
            Rating.id: (context) => Rating(customerPhone: '', customerName: '', customerEmail: '',),
            WelcomeScreen.id: (context) => WelcomeScreen(),
            SignUp.id: (context) => SignUp(),
            HomePage.id: (context) => HomePage(),
            CustomerInfoDashboard.id: (context) => CustomerInfoDashboard(),
          },
        ),

    );
  }
}



