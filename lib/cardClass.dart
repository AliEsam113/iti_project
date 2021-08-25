import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  String content;
  MyCard({this.content = " - "});
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: Colors.black,
          width: 2.0
        ),
      ),
      child: Container(
        //height: 200,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(widget.content,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),)),
        ),
      ),
    );
  }
}
