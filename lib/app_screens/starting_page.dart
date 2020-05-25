import 'package:flutter/material.dart';
import 'package:railway_app_final/app_screens/login_page.dart';

class StartingPage extends StatefulWidget {
  @override
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 400.0,
              ),
              ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.transparent])
                        .createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset('assets/2.jpg', fit: BoxFit.cover)),
              SizedBox(height: 50.0,),
              RotatedBox(
                quarterTurns: 3,
                child: Text('CEYLON',
                    style: TextStyle(
                        fontSize: 75,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.3),
                        letterSpacing: 10.0)),
              ),
              Positioned(
                top: 150.0,
                left: 80.0,
                child: Column(
                  children: <Widget>[
                    Text(
                      'WELCOME TO',
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 185.0,
                left: 80.0,
                child: Column(
                  children: <Widget>[
                    Text(
                      'SRILANKA',
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: 60.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 250.0,
                left: 80.0,
                child: Column(
                  children: <Widget>[
                    Text(
                      'RAILWAY',
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: 60.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(height: 120.0,),
                    Container(
                      width: 250.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        color: Colors.red[400],
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text('START',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
