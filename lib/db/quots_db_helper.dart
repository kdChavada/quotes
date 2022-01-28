import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  late Database db;
  List category = [];
  List quotes = [];
  //
  Future databaseGet() async {
    var databasePath = await getDatabasesPath();

    var path = join(databasePath, "quotes.db");
    print(path);
    // Check if the database exists
    var exists = await databaseExists(path);
    print(exists);
    if (!exists) {
      // Should happen only the first time you launch your application
      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        ByteData data = await rootBundle.load(join("assets", "quotes.db"));
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        // Write and flush the bytes written
        await File(path).writeAsBytes(bytes, flush: true);
      }
    } else {
      var db = await openDatabase(path);

      category = await db.query('category');
      print(category);
    }
  }
//
// Future databaseGet() async{
//   var databasesPath = await getDatabasesPath();
//   String path = join(databasesPath,'assets/quotes.db');
// }

}
