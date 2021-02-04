import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:railway_app_final/app_screens/profile_page.dart';
import 'package:railway_app_final/utilities/constants.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _mobileNumber = TextEditingController();

  DateTime _dob;
  DateTime date;
  String imgSrc = '';
  String _valGender;
  File _image;
  String _valCountryCode;

  String profPic;
  bool isLoad = true;
  final picker = ImagePicker();

  static InputBorder enabledBorder =
      OutlineInputBorder(borderSide: BorderSide(color: Color(0xffDFDFDF)));

  Future getImage(String source) async {
    var image;
    if (source == "camera") {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else if (source == "gallery") {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    if (image != null) {
      _image = image;
      imgSrc = image.path.toString();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF37474F),
              Color(0xFF37474F),
              Color(0xFF37474F),
              Color(0xFF37474F),
            ],
            //stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 155.00,
              child: Stack(
                children: [
                  Positioned(
                      left: (MediaQuery.of(context).size.width - 115) / 2,
                      top: 26.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(72.5),
                        child: Container(
                          child: _image == null
                              ? profPic != null
                                  ? Image.network(
                                      profPic,
                                      width: 115,
                                      height: 115,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      "assets/1.jpg",
                                      width: 115,
                                      height: 115,
                                      fit: BoxFit.cover,
                                    )
                              : Image.asset(imgSrc,
                                  width: 115, height: 115, fit: BoxFit.cover),
                        ),
                      )),
                  Positioned(
                      right: (MediaQuery.of(context).size.width - 39) / 2,
                      //  right: 20.0,
                      top: 112.0,
                      child: GestureDetector(
                        onTap: () => getImage('gallery'),
                        child: CircleAvatar(
                          radius: 19.5,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 17.5,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.photo_camera,
                              color: Colors.white,
                              size: 22.0,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),

            SizedBox(
              height: 10.0,
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Form(
                key: _formKey,
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                    ),
                    // Container(
                    //   color: Colors.blue,
                    //   child: TextField(
                    //     controller: _firstName,
                    //     keyboardType: TextInputType.text,
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontFamily: 'OpenSans',
                    //     ),
                    //     decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       contentPadding: EdgeInsets.only(top: 14.0),
                    //       prefixIcon: Icon(
                    //         Icons.account_box,
                    //         color: Colors.white,
                    //       ),
                    //       hintText: 'Enter your Firat Name',
                    //       hintStyle: kHintTextStyle,
                    //     ),
                    //   ),
                    // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'First Name',
                      style: kLabelStyle,
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60.0,
                      child: TextField(
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your First Name',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Last Name',
                          style: kLabelStyle,
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          height: 60.0,
                          child: TextField(
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              hintText: 'Enter your Last Name',
                              hintStyle: kHintTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Mobile Number',
                          style: kLabelStyle,
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          height: 60.0,
                          child: TextField(
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              hintText: 'Enter your Mobile Number',
                              hintStyle: kHintTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    _updateButton(),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _updateButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: (){
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfileApp()));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'UPDATE',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  void updateUser(
      String firstName,
      String lastName,
      String postCode,
      String street,
      String city,
      File file,
      String gender,
      String countryCode,
      String dob) async {}
}
