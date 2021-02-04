import 'package:flutter/material.dart';
import 'package:railway_app_final/app_screens/booking_page.dart';

class SelectClass extends StatefulWidget {
  final String name;
  final String arrival;
  final String departure;
  final String start_location;
  final String end_location;
  final String start_time;
  final String end_time;
  //final double rating;
  final Color startColor;
  final Color endColor;

  SelectClass(
      {this.name,
      this.arrival,
      this.departure,
      this.start_location,
      this.end_location,
      this.startColor,
      this.endColor, this.start_time, this.end_time});

  @override
  _SelectClassState createState() => _SelectClassState();
}

class _SelectClassState extends State<SelectClass> {
  final double _borderRadius = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Buy Ticket")),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_borderRadius),
                      gradient: LinearGradient(
                          colors: [widget.startColor, widget.endColor],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      boxShadow: [
                        BoxShadow(
                          color: widget.endColor,
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                  ),
                  // Positioned(
                  //   right: 0,
                  //   bottom: 0,
                  //   top: 0,
                  //   child: CustomPaint(
                  //     size: Size(100, 150),
                  //     painter: CustomCardShapePainter(_borderRadius,
                  //         items[index].startColor, items[index].endColor),
                  //   ),
                  // ),
                  Positioned.fill(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Image.asset(
                            'assets/1.jpg',
                            height: 64,
                            width: 64,
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: 6),
                              Text(
                                widget.arrival,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Avenir',
                                ),
                              ),
                              Text(
                                widget.departure,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Avenir',
                                ),
                              ),
                              SizedBox(height: 16),
                              Column(
                                children: [
                                  Container(
                                    height: 20,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Flexible(
                                          child: Text(
                                            widget.start_location,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Avenir',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Flexible(
                                          child: Text(
                                            widget.end_location,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Avenir',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Expanded(
                        //   flex: 2,
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     children: <Widget>[
                        //       Text(
                        //         items[index].rating.toString(),
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             fontFamily: 'Avenir',
                        //             fontSize: 18,
                        //             fontWeight: FontWeight.w700),
                        //       ),
                        //
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BookingPage(
                            trainStartTime: widget.start_time,
                            trainName: widget.name,
                            trainEndTime: widget.end_time,
                            ticketPrice: "200",
                            trainTo: widget.end_location,
                            trainClass: "First Class",
                            trainFrom: widget.start_location,
                          )));
            },
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Stack(
                children: [
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/ticket.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    child: Text(
                      '1st CLASS',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    left: 100,
                    top: 30,
                  ),
                  Positioned(
                    child: Text(
                      'RS200',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    left: 150,
                    top: 75,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BookingPage(
                        trainStartTime: widget.start_time,
                        trainName: widget.name,
                        trainEndTime: widget.end_time,
                        ticketPrice: "150",
                        trainTo: widget.end_location,
                        trainClass: "Second Class",
                        trainFrom: widget.start_location,
                      )));
            },

            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Stack(
                children: [
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/ticket.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    child: Text(
                      '2nd CLASS',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    left: 100,
                    top: 30,
                  ),
                  Positioned(
                    child: Text(
                      'RS150',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    left: 150,
                    top: 75,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BookingPage(
                        trainStartTime: widget.start_time,
                        trainName: widget.name,
                        trainEndTime: widget.end_time,
                        ticketPrice: "100",
                        trainTo: widget.end_location,
                        trainClass: "Third Class",
                        trainFrom: widget.start_location,
                      )));
            },
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Stack(
                children: [
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/ticket.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    child: Text(
                      '3rd CLASS',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    left: 100,
                    top: 30,
                  ),
                  Positioned(
                    child: Text(
                      'RS100',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    left: 150,
                    top: 75,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
