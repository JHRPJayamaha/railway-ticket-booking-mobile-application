import 'package:flutter/material.dart';
import 'package:railway_app_final/app_screens/buy_ticket.dart';
import 'dart:ui' as ui;

import 'package:railway_app_final/app_screens/view_train.dart';

class FindPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<FindPage> {
  final double _borderRadius = 24;

  var items = [
    PlaceInfo(
        name: 'Yal Devi',
        startColor: Color(0xfFF7A7E92),
        endColor: Color(0xFF7A7E92),
        start_location: 'kurunegala:',
        start_time: '9.30AM',
        end_time: '11.00AM',
        end_location: 'Colombo:',
        arrival: 'Arrival: 9.30AM',
        departure: "Departure: 9.35AM"),
    PlaceInfo(
        name: 'Ragarata Ragina',
        startColor: Color(0xfFF7A7E92),
        endColor: Color(0xFF7A7E92),
        start_location: 'kurunegala:',
        start_time: '9.30AM',
        end_time: '11.00AM',
        end_location: 'Colombo:',
        arrival: 'Arrival: 9.30AM',
        departure: "Departure: 9.35AM"),
    PlaceInfo(
        name: 'Ragarata Ragina',
        startColor: Color(0xfFF7A7E92),
        endColor: Color(0xFF7A7E92),
        start_location: 'kurunegala:',
        start_time: '9.30AM',
        end_time: '11.00AM',
        end_location: 'Colombo:',
        arrival: 'Arrival: 9.30AM',
        departure: "Departure: 9.35AM"),

    // PlaceInfo('Hamriyah Food Court', Color(0xffFFB157), Color(0xffFFA057), 3.7,
    //     'Sharjah', 'All you can eat · Casual · Groups'),
    // PlaceInfo('Gate of Food Court', Color(0xffFF5B95), Color(0xffF8556D), 4.5,
    //     'Dubai · Near Dubai Aquarium', 'Casual · Groups'),
    // PlaceInfo('Express Food Court', Color(0xffD76EF5), Color(0xff8F7AFE), 4.1,
    //     'Dubai', 'Casual · Good for kids · Delivery'),
    // PlaceInfo('BurJuman Food Court', Color(0xff42E695), Color(0xff3BB2B8), 4.2,
    //     'Dubai · In BurJuman', '...'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TRAIN LIST'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => SelectClass(
                            name: items[index].name,
                            arrival: items[index].arrival,
                            departure: items[index].departure,
                            start_location: items[index].start_location,
                            end_location: items[index].end_location,
                            startColor: items[index].startColor,
                            endColor: items[index].endColor,
                        start_time: items[index].start_time,
                        end_time: items[index].end_time,
                          )));
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(_borderRadius),
                        gradient: LinearGradient(
                            colors: [
                              items[index].startColor,
                              items[index].endColor
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: items[index].endColor,
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
                                  items[index].name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  items[index].arrival,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Avenir',
                                  ),
                                ),
                                Text(
                                  items[index].departure,
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
                                              "${items[index].start_location} ${items[index].start_time}",
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
                                              "${items[index].end_location} ${items[index].end_time}",
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
          );
        },
      ),
    );
  }
}

class PlaceInfo {
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

  PlaceInfo(
      {this.name,
      this.start_time,
      this.end_time,
      this.startColor,
      this.endColor,
      this.start_location,
      this.arrival,
      this.departure,
      this.end_location});
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
