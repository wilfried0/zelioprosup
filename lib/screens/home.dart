import 'package:flutter/material.dart';
import 'package:zelioprosup/constantes.dart';
import 'package:zelioprosup/screens/profil.dart';
import 'package:zelioprosup/screens/settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  List<String> tabs = ["NOTES", "ABSENCES", "RETARDS", "CONSIGNES", "EXCLUSIONS"];
  TabController _tabController;
  String _image;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: kBGChamp,
        appBar: AppBar(
          backgroundColor: kBGColor,
          elevation: 0.0,
          title: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilScreen()));
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image:_image == null? AssetImage('assets/images/avatar.png')
                          :NetworkImage("https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"),
                          fit: BoxFit.cover)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("Wilfried Assam Engozo'o", style: TextStyle(
                  fontSize: kSizeText
                ),),
              )
            ],
          ),

          actions: [
            IconButton(
              icon: Icon(Icons.settings, color: kBGChamp,),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => SettingScreen()));
              }
            )
          ],

          bottom: PreferredSize(
            preferredSize: Size.fromHeight(150.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text("UNIVERSITE DE YAOUNDE II", style: TextStyle(
                        color: kBGChamp,
                        fontWeight: FontWeight.normal
                    ),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text("SCIENCES ECONOMIQUES", style: TextStyle(
                      color: kBGChamp,
                      fontWeight: FontWeight.normal
                    ),),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text("NIVEAU I", style: TextStyle(
                        color: kBGChamp,
                        fontWeight: FontWeight.normal
                    ),),
                  ),
                ),
                TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    indicatorColor: Colors.white,

                    controller: _tabController,
                    tabs: [
                      Tab(
                        child: Text(tabs[0], style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Tab(
                        child: Text(tabs[1], style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Tab(
                        child: Text(tabs[2], style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Tab(
                        child: Text(tabs[3], style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Tab(
                        child: Text(tabs[4], style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                    ]
                ),
              ],
            ),
          ),
        ),

        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              child: Center(
                child: Text('NOTES'),
              ),
            ),
            Container(
              child: Center(
                child: Text('ABSENCES'),
              ),
            ),
            Container(
              child: Center(
                child: Text('RETARDS'),
              ),
            ),
            Container(
              child: Center(
                child: Text('CONSIGNES'),
              ),
            ),
            Container(
              child: Center(
                child: Text('EXCLUSIONS'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
