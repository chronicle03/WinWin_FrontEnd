import "package:flutter/material.dart";
import "package:winwin/pages/home/home_page.dart";
import "package:winwin/pages/landing_page.dart";
import "package:winwin/pages/login_page.dart";
import "package:winwin/pages/register_page.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LandingPage(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
