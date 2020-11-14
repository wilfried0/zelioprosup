import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zelioprosup/constantes.dart';
import 'package:zelioprosup/screens/auth/login.dart';


class ActivationScreen extends StatefulWidget {
  @override
  _ActivationScreenState createState() => _ActivationScreenState();
}

class _ActivationScreenState extends State<ActivationScreen> {

  bool isConnecting = false;
  String matricule, annee;
  var _annee = ["2019 - 2020","2020 - 2021"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  //alignment: Alignment.center,
                  height: 80,//this._sizeAnimation.value,
                  width: 80,//this._sizeAnimation.value,
                  child: ClipRRect(
                    child: SvgPicture.asset(
                      "assets/icons/grad_cap.png",
                      height: 180.0,
                      width: 180.0,
                    ),
                  ),
                ),
              ),
              Text(
                "ZelioProSup",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0 - 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 100),
                child: Container(
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                    ),
                    color: Colors.white,
                  ),
                  height: kHchamp,
                  child: Row(
                    children: [
                      Expanded(
                        flex:2,
                        child: new Icon(Icons.lock, color: kIconColor,),
                      ),
                      Expanded(
                        flex: 12,
                        child: new TextFormField(
                          controller: null,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              fontSize: kSizeText,
                              color: kBGColor
                          ),
                          validator: (String value){
                            if(value.isEmpty){
                              return 'Champ code vide !';
                            }else{
                              return null;
                            }
                          },
                          decoration: InputDecoration.collapsed(
                            hintText: 'Code d\'activation',
                            hintStyle: TextStyle(color: kTextColor,
                                fontSize: kSizeText),
                            //contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10),
                child: new GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: new Container(
                    height: kHchamp,
                    width: MediaQuery.of(context).size.width - 80,
                    decoration: new BoxDecoration(
                      color: kBGButton,
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    child: new Center(child: isConnecting==false?new Text("ACTIVATION",//SitLocalizations.of(context).suivant,
                      style: new TextStyle(fontSize: kSizeText, color: kBGChamp, fontWeight: FontWeight.normal),):
                    Theme(
                        data: ThemeData(cupertinoOverrideTheme: CupertinoThemeData(brightness: Brightness.dark)),
                        child: CupertinoActivityIndicator(radius: 20,)),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Code non reçu? ", style: TextStyle(
                      color: kBGChamp,
                      fontSize: kSizeText,
                    ),),

                    InkWell(
                      onTap: (){

                      },
                      child: Text(" Renvoyer le code", style: TextStyle(
                          color: kBGButton,
                          fontSize: kSizeText,
                          fontWeight: FontWeight.bold
                      ),),
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
