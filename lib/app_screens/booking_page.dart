import 'package:flutter/material.dart';
import 'package:railway_app_final/app_screens/my_tickets.dart';

class BookingPage extends StatefulWidget {
  final String trainName;
  final String trainFrom;
  final String trainTo;
  final String trainStartTime;
  final String trainEndTime;
  final String trainClass;
  final String ticketPrice;

  BookingPage(
      {@required this.trainName,
      @required this.trainFrom,
      @required this.trainTo,
      @required this.trainStartTime,
      @required this.trainEndTime,
      @required this.trainClass,
      @required this.ticketPrice});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  TextEditingController qnt = TextEditingController();
  String count = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket Booth'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20, top: 10),
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 110),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            image: DecorationImage(
                                image: AssetImage('assets/1.jpg'),
                                fit: BoxFit.cover)),
                        height: 120,
                        // child: Image.asset('assets/1.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        widget.trainName,
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10,
                    ),
                    child: Container(
                      height: 30,
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Text(
                              "Start :",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Text(
                              widget.trainFrom,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          )),
                          Container(
                            width: 70,
                            child: Text(
                              widget.trainStartTime,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10,
                    ),
                    child: Container(
                      height: 30,
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Text(
                              "End :",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Text(
                              widget.trainTo,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          )),
                          Container(
                            width: 70,
                            child: Text(
                              widget.trainEndTime,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10,
                    ),
                    child: Container(
                      height: 30,
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Text(
                              "Class :",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Text(
                              widget.trainClass,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          )),
                          SizedBox(
                            width: 70,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10,
                    ),
                    child: Container(
                      height: 30,
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Text(
                              "Per 1 :",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Text(
                              widget.ticketPrice,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          )),
                          SizedBox(
                            width: 70,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                  border: Border.all(color: Colors.black)),
              height: 120,
              child: Column(
                children: [
                  Container(
                    height: 45,
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Select Your Qnt. ",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "${widget.ticketPrice}    x  ",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20)),
                            width: 60,
                            child: Center(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  getTotal(value);
                                },
                                controller: qnt,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "   Qnt.",
                                    hintStyle: TextStyle()),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 45,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        height: 30,
                        child: Row(
                          children: [
                            Container(
                                width: 120,
                                child: Center(
                                    child: Text(
                                  "Price : ",
                                  style: TextStyle(fontSize: 25),
                                ))),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Rs. $count",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyTickets(time: widget.trainStartTime, date: "05/03/2021", trainName: widget.trainName,)));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              // elevation: 0.0,
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [Colors.black26, Colors.black26]),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Book Train",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  getTotal(String val) {
    int ticket = int.parse(val);
    int ticketPrice = int.parse(widget.ticketPrice);
    int total = ticketPrice * ticket;
    count = total.toString();
    setState(() {});
  }
}
