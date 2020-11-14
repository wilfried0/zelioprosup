import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zelio',
      theme: ThemeData(
        primaryColor: Color(0xFF202328),
        accentColor: Color(0xFF63CF93),
        backgroundColor: Color(0xFF12171D),
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    );
  }
}