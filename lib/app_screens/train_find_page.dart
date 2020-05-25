import 'package:flutter/material.dart';
import 'package:railway_app_final/utilities/constants.dart';
import 'package:railway_app_final/app_screens/login_page.dart';
import 'dart:async';
import 'package:railway_app_final/app_screens/find_train.dart';

class TrainFindPage extends StatefulWidget {
  @override
  _TrainFindPageState createState() => _TrainFindPageState();
}

class _TrainFindPageState extends State<TrainFindPage> {
  var _currencies = ['colombo', 'kurunegala'];
  var _currencies1 = ['colombo', 'kurunegala'];
  var _currentItemSelected = 'colombo';
  var _currentItemSelected1 = 'colombo';
  Widget _buildFromTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'From',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        DropdownButton<String>(
          items: _currencies.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(dropDownStringItem),
            );
          }).toList(),
          onChanged: (String newValueSelected) {
            setState(() {
              this._currentItemSelected = newValueSelected;
            });
          },
          value: _currentItemSelected,
        )
      ],
    );
  }

  Widget _buildToTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'To',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        DropdownButton<String>(
          items: _currencies1.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(dropDownStringItem),
            );
          }).toList(),
          onChanged: (String newValueSelected) {
            setState(() {
              this._currentItemSelected1 = newValueSelected;
            });
          },
          value: _currentItemSelected1,
        )
      ],
    );
  }

  Widget _buildFindTF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FindPage()));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'FIND',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
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
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 100.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'MY TRAIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  _buildFromTF(),
                  SizedBox(
                    height: 30.0,
                  ),
                  _buildToTF(),
                  SizedBox(
                    height: 40.0,
                  ),
                  _buildFindTF(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
