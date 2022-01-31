import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LikeQuotes extends StatefulWidget {
  const LikeQuotes({Key? key}) : super(key: key);

  @override
  _LikeQuotesState createState() => _LikeQuotesState();
}

class _LikeQuotesState extends State<LikeQuotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffF6CED5),
        centerTitle: true,
        title: Text(
          "Likes Quotes",
          style: GoogleFonts.satisfy(
              color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
