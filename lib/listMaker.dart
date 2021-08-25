import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iti_project/Azkar.dart';
import 'package:iti_project/cardClass.dart';
import 'package:iti_project/Data.dart';
import 'package:sqflite/sqflite.dart';

class ListMaker extends StatefulWidget {
  @override
  _ListMakerState createState() => _ListMakerState();
}

class _ListMakerState extends State<ListMaker> {
  @override
  int counter = 0;
  List<String> categories = [];
  bool loading = true;
  List<Map> azkar = [];
  List<String> typedzekr = [];
  List<String> typedzekrinfo = [];
  List<int> typedzekrcount = [];
  Database? azkarDb;
  void get() async {
    azkarDb = await Data().initDatabase();
    azkar = await Data().getData(azkarDb);
    for (int i = 0; i < azkar.length; i++) {
      if (!categories.contains(azkar[i]['type'])) {
        categories.add('${azkar[i]['type'].toString()}');
      }
      increment();
    }
    loading = false;
    setState(() {});
  }

  void initState() {
    super.initState();
    get();
  }

  void increment() {
    counter++;
  }

  String appBarText = " قائمة اﻷذكار";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        //foregroundColor: Colors.black,
        title: Center(
            child: Text(
          appBarText,
          style: TextStyle(fontSize: 25),
        )),
      ),
      body: loading
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                      onTap: () async {
                        pushPage(
                            context,
                            Azkar(
                              azkar: typedzekr = await Data()
                                  .getZekrData(azkarDb, categories[index]),
                              azkarinfo: typedzekrinfo = await Data()
                                  .getZekrInfoData(azkarDb, categories[index]),
                              count: typedzekrcount = await Data()
                                  .getZekrCount(azkarDb, categories[index]),
                              zekr: categories[index],
                            ));
                      },
                      child: MyCard(content: "${categories[index]}")),
                );
              }),
    );
  }
}

pushPage(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

popPage(BuildContext context) {
  Navigator.pop(context);
}
