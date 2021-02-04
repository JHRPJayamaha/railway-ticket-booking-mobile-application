import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  DateTime selectedDate;
  String fromDate = "-----Select-----";

  Widget _buildFromTF() {
    return Container(
      width: 260,

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 10, height: 10.0),
          Expanded(
            child: Text(
              'From',
              style: kLabelStyle,
            ),
          ),
          SizedBox(width: 40, height: 10.0),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.white),
            width: 170,
            child: Center(
              child: DropdownButton<String>(underline: SizedBox(),
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
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildToTF() {
    return Container(
      width: 260,

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 10, height: 10.0),
          Expanded(
            child: Text(
              'To',
              style: kLabelStyle,
            ),
          ),
          SizedBox(width: 40, height: 10.0),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.white),
            width: 170,
            child: Center(
              child: DropdownButton<String>(underline: SizedBox(),
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
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFindTF() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FindPage()));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.blue,
        child: Text(
          'FIND',
          style: TextStyle(
            color: Colors.white,
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
                //stops: [0.1, 0.4, 0.7, 0.9],
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
                  _buildDateTime(),
                  SizedBox(
                    height: 30.0,
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
  Widget _buildDateTime(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date',
          style: kLabelStyle,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: InkWell(
            child: Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0) ,color: Colors.white,
                  border:
                  Border.all(color: Colors.blueAccent),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Center(child: Text(fromDate))),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            onTap: () {
              _settingModalBottomSheet(context,
                  selected: (value) {
                    print("Selected value is $value");
                    setState(() {
                      fromDate = value.toString();
                    });
                  });
            },
          ),
        ),
      ],
    );
  }
  _settingModalBottomSheet(context, {Function selected}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 200,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: InkWell(
                                child: Text('Cancel'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ))),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () {
                          final DateFormat formatter = DateFormat('dd-MM-yyyy');

                          final String formatted = (selectedDate != null)
                              ? formatter.format(selectedDate)
                              : formatter.format(DateTime.now());

                          selected(formatted);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text(
                            'Done',
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (value) {
                      print(value);
                      selectedDate = value;
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
