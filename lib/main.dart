import 'package:flutter/material.dart';
import 'package:quotes/db/quots_db_helper.dart';
import 'package:quotes/view/welcome.dart';
DBHelper dbHelper = DBHelper();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const Welcome(),
    );
  }
}


