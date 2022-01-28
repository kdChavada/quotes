import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes/db/quots_db_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DBHelper  dbHelper =  DBHelper();


  Future<void>  getData() async {
    await dbHelper.databaseGet();

  }

  @override
  void initState() {
    getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffF6CED5),
        centerTitle: true,
        title: Text("Quotes & Status",style: GoogleFonts.satisfy(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.w700
        ),),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            getData();

          }, child: Text("DATA"),),

          // GridView.builder(
          //   physics: const BouncingScrollPhysics(),
          //   shrinkWrap: true,
          //   scrollDirection: Axis.vertical,
          //   itemCount: 20,
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 3,
          //   ),
          //     itemBuilder: (context, i){
          //     return  Card(
          //       elevation: 5.0,
          //       shadowColor: Colors.red,
          //       child: Column(
          //         children: [
          //
          //         ],
          //       ),
          //     );
          //     }
          // ),
        ],
      ),
    );
  }
}
