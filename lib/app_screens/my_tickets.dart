import 'package:flutter/material.dart';
import 'package:railway_app_final/app_screens/qr_dialog.dart';

class MyTickets extends StatefulWidget {
  final String trainName;
  final String date;
  final String time;

  MyTickets(
      {@required this.trainName, @required this.date, @required this.time});

  @override
  _MyTicketsState createState() => _MyTicketsState();
}

class _MyTicketsState extends State<MyTickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Ticket"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Container(
              height: 110,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      child: Column(
                        children: [
                          Container(
                            height: 55,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 10),
                              child: Text(
                                "${widget.trainName}",
                                style: TextStyle(fontSize: 35),
                              ),
                            ),
                          ),
                          Container(
                            height: 45,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 10),
                              child: Text(
                                "${widget.date} - ${widget.time}",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 120,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => QRDialog(
                                          isDownloadEnabled: true,
                                          nicNumber: "987456321v",
                                          ticketQuantity: "5",
                                          time: widget.time,
                                          date: widget.date,
                                          startLocation: "kuru",
                                          endLocation: "col",
                                          totalPrice: "1000",
                                          trainClass:"First Class",
                                        )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black)),
                            child: Center(child: Text("View QR")),
                            height: 50,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15)),
            ),
          )
        ],
      ),
    );
  }
}
