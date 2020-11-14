import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zelioprosup/constantes.dart';
import 'package:zelioprosup/screens/auth/register.dart';
import 'package:zelioprosup/screens/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
                        child: new Icon(Icons.perm_contact_calendar, color: kIconColor,),
                      ),
                      Expanded(
                        flex: 12,
                        child: new TextFormField(
                          controller: null,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              fontSize: kSizeText,
                              color: kBGColor
                          ),
                          validator: (String value){
                            if(value.isEmpty){
                              return 'Champ matricule vide !';
                            }else{
                              return null;
                            }
                          },
                          decoration: InputDecoration.collapsed(
                            hintText: 'Matricule',
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
                padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                child: Container(
                  //margin: EdgeInsets.only(top: 0.0),
                  decoration: new BoxDecoration(
                    color: kBGChamp,
                    borderRadius: new BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                    ),

                  ),
                  height: kHchamp,
                  child: Row(
                    children: <Widget>[
                      new Expanded(
                        flex:2,
                        child: new Icon(Icons.calendar_today, color: kIconColor,),
                      ),
                      Expanded(
                        flex:12,
                        child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              icon: new Icon(Icons.arrow_drop_down,
                                color: kIconColor,),
                              isDense: true,
                              elevation: 1,
                              isExpanded: true,
                              onChanged: (String selected){
                                setState(() {
                                  annee = selected;
                                });
                              },
                              value: annee,
                              hint: Text('Année scolaire',
                                style: TextStyle(
                                  color: kTextColor,
                                  fontSize:kSizeText,
                                ),),
                              items: _annee.map((String name){
                                return DropdownMenuItem<String>(
                                  value: name,
                                  child: Text(name,
                                    style: TextStyle(
                                        color: kBGColor,
                                        fontSize:kSizeText,
                                        fontWeight: FontWeight.normal
                                    ),),
                                );
                              }).toList(),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10),
                child: new GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: new Container(
                    height: kHchamp,
                    width: MediaQuery.of(context).size.width - 80,
                    decoration: new BoxDecoration(
                      color: kBGButton,
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    child: new Center(child: isConnecting==false?new Text("CONNEXION",//SitLocalizations.of(context).suivant,
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
                    Text("Pas encore de compte? ", style: TextStyle(
                      color: kBGChamp,
                      fontSize: kSizeText,
                    ),),

                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                      },
                      child: Text(" Je m'inscris", style: TextStyle(
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