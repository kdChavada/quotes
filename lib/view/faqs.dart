import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqS extends StatefulWidget {
  const FaqS({Key? key}) : super(key: key);

  @override
  _FaqSState createState() => _FaqSState();
}

class _FaqSState extends State<FaqS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffF6CED5),
        centerTitle: true,
        title: Text(
          "FAQs",
          style: GoogleFonts.satisfy(
              color: Colors.black, fontWeight: FontWeight.w700),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 30,
            )),
      ),
    );
  }
}
