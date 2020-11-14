import 'package:flutter/material.dart';
import 'package:zelioprosup/constantes.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBGColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text("Configurations", style: TextStyle(
          fontSize: kSizeText
        ),),
      ),
    );
  }
}
