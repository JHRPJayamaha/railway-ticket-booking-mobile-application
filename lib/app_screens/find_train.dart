import 'package:flutter/material.dart';

class FindPage extends StatelessWidget {

  final List<String> tripsList = [
    "Kurunegala", "Colombo"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: tripsList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Card(
                child: Column(
                  children: <Widget>[
                    Text(index.toString()),
                    Text(tripsList[index]),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}