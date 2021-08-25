import 'package:flutter/material.dart';

import 'cardClass.dart';

class Azkar extends StatefulWidget {
  List<String> azkar = [];
  List<String> azkarinfo = [];
  String zekr = '';
  List<int> count = [];
  int index = 0;
  bool show = false;
  int mycount = 0;
  Azkar(
      {required this.azkar,
      required this.azkarinfo,
      required this.count,
      required this.zekr});
  @override
  _AzkarState createState() => _AzkarState();
}

class _AzkarState extends State<Azkar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        //foregroundColor: Colors.black,
        title: Center(
            child: Text(
          "${widget.zekr}",
          style: TextStyle(fontSize: 25),
        )),
      ),
      body: ListView(
        children: [
          if (widget.index < widget.azkar.length-1)
            MaterialButton(
                child: Text(
                  "الذكر التالي",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  next();
                }),
          SizedBox(height: 20,),
          InkWell(
            child: MyCard(content: "${widget.azkar[widget.index]}"),
            onTap: () {
              countReached();
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 3,
              ),
              TextButton(
                onPressed: () {
                  widget.show = true;
                  setState(() {});
                },
                child: Text("عرض المزيد    ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          if (widget.show)
            InkWell(
              child: MyCard(content: "${widget.azkarinfo[widget.index]}"),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (widget.show)
              TextButton(onPressed: (){
                widget.show = false;
                setState(() {});
              }, child: Text("عرض اقل",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(
                width: 25,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Center(
              child: Text(
            "عدد مرات قول الذكر:  ${widget.count[widget.index]}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          )),
          SizedBox(height: 10,),
          if (widget.index > 0)
            MaterialButton(
                child: Text(
                  "الذكر السابق",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  previous();
                }),
        ],
      ),
    );
  }

  void next() {
    if (widget.index < widget.azkar.length-1)
    widget.index++;
    widget.mycount=0;
    setState(() {});
  }

  void previous() {
    widget.index--;
    setState(() {});
  }
  void countReached(){
    widget.mycount++;
    if(widget.mycount==widget.count[widget.index])
      next();
    setState(() {});
  }
}
