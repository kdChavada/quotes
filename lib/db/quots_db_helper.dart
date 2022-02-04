import 'dart:io';


import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';



class DBHelper{
  late Database db;
  List category = [];
  List quotes = [];
  ValueNotifier<List<Map>> bookmarkList=ValueNotifier([]);
  List likesQuotes = [];


  Future databaseGet()async{
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "quotes.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "quotes.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

    } else {
    }
      // open the database
    var db = await openDatabase(path);

    category =await db.query('category');
    quotes =await db.query('quotes');
    likesQuotes =  await db.query('like');

    print(likesQuotes.length);





  }
  void  insertDataIntoDB(int id,String quote)async{
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "quotes.db");
    var db = await openDatabase(path);


    Map<String,dynamic> value={
      '_id':id,
      'quote':quote,

    };
    await db.insert("like",value);
    bookmarkList.value=await db.query("like");

    print(bookmarkList.value);
  }





}











