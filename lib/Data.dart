import 'package:sqflite/sqflite.dart';
import 'Utils.dart';

class Data {
  List<Map> azkar = [];
  List<String> typedzekr = [];
  String zekr='';
  Database? azkarDb;
  Future<Database?> initDatabase() async {
    azkarDb = await dbFromAssets("azkar-db.db");
    return azkarDb;
  }
  Future<List<Map>> getData(azkarDb) async {
    azkar = await azkarDb.rawQuery('SELECT * FROM azkar');
    return azkar;
  }
  Future<List<String>> getZekrData(azkarDb,String zekr) async {
    List<Map> m = await azkarDb.query('azkar', columns: ['zekr'],
        where: 'type = ?',
        whereArgs: ['$zekr']);
    List<String> typedzekr = [];
    m.forEach((mapi) {
      typedzekr.add(mapi['zekr']);
    });
    return typedzekr;
  }
  Future<List<String>> getZekrInfoData(azkarDb,String zekr) async {
    List<Map> m = await azkarDb.query('azkar', columns: ['zekr_info'],
        where: 'type = ?',
        whereArgs: ['$zekr']);
    List<String> typedzekrinfo = [];
    m.forEach((mapi) {
      typedzekrinfo.add(mapi['zekr_info']);
    });
    return typedzekrinfo;
  }
  Future<List<int>> getZekrCount(azkarDb,String zekr) async {
    List<Map> m = await azkarDb.query('azkar', columns: ['num_zekr'],
        where: 'type = ?',
        whereArgs: ['$zekr']);
    List<int> typedzekrcount = [];
    m.forEach((mapi) {
      typedzekrcount.add(int.parse(mapi['num_zekr']));
    });
    return typedzekrcount;
  }
}

