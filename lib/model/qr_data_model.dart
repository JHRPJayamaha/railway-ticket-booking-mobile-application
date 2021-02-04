import 'package:flutter/cupertino.dart';

class QRDataSet {
  final String nicNumber;
  final String ticketQuantity;
  final String date;
  final String time;
  final String trainClass;
  final String totalPrice;
  final String startLocation;
  final String endLocation;

  QRDataSet(
      {@required this.nicNumber,
      @required this.ticketQuantity,
      @required this.date,
      @required this.time,
      @required this.trainClass,
      @required this.totalPrice,
      @required this.startLocation,
      @required this.endLocation});

  Map toJson() => {
        'nicNumber': nicNumber,
        'ticket_q': ticketQuantity,
        'date': date,
        'time': time,
        'train_class': trainClass,
        'total_price': totalPrice,
        'start_location': startLocation,
        'end_location': endLocation,
      };
}
