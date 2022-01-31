import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffF6CED5),
        centerTitle: true,
        title: Text(
          "Privacy Policy",
          style: GoogleFonts.satisfy(
              color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
