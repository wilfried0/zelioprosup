import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zelioprosup/constantes.dart';

class ProfilScreen extends StatefulWidget {
  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {

  bool isConnecting = false, _loadImage = false;
  String sexe, nom, prenom, _image, jr, mo, an, _birthday="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBGColor,
        iconTheme: IconThemeData(
          color: kBGChamp,
        ),
        elevation: 0.0,
        title: Text("Profil", style: TextStyle(
            color: kBGChamp,
            fontSize: 15
        ),),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child:_loadImage==false? IconButton(
              icon: Icon(Icons.camera_alt,size: 30, color: Colors.white,),
              onPressed: (){
                setState(() {
                  _loadImage = true;
                });
                getImage();
              },
            ):CupertinoActivityIndicator(),
          )
        ],
      ),

      body: Stack(
        children: [
          CustomPaint(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            painter: HeaderCurvedContainer(),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _profileText(),
                _image == null?_circleAvatar(context):
                Container(
                  height:  MediaQuery.of(context).size.width - 150,
                  width:  MediaQuery.of(context).size.width - 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: _image==null? AssetImage("assets/images/avatar.png"):NetworkImage(_image),
                        fit: BoxFit.cover,
                      )
                  ),
                  child: Image.network(_image, fit: BoxFit.contain,
                      loadingBuilder: (BuildContext ctx, Widget child, ImageChunkEvent loadingProgress){
                        if (loadingProgress == null) return Container();
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null ?
                            loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        );
                      }
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<String> getImage() async {
    //var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    //Upload(image);
    return null;
  }
}

Widget _profileText() {
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: Text(
      'ZelioProSup',
      style: TextStyle(
        fontSize: 28.0,
        color: kBGChamp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _circleAvatar(BuildContext context) {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.width / 3,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 5),
          shape: BoxShape.circle,
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/avatar.png'),
          ),
        ),
      ),
    ),
  );
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = kBGColor;
    Path path = Path()
      ..relativeLineTo(0, 100)
      ..quadraticBezierTo(size.width / 2, 200.0, size.width, 100)
      ..relativeLineTo(0, -100)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
