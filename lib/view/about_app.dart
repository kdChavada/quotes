import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffF6CED5),
        centerTitle: true,
        title: Text(
          "About App",
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              Text(
                "Best Quotes and Status is an app that provides large collection of quotes for different categories. There are more than 85,000 quotes and more than 100 categories.",
                style: GoogleFonts.changa(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                "Everybody nowadays uploads photos/videos on social apps like Whatsapp, Facebook, Instagram & Tiktok where they need a nice caption to get attention from the viewers so this is app can help them easily find best captions for the social media posts. You can also use these quotes on your books, painting, wall, mobile application, website etc.",
                style: GoogleFonts.changa(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Browse categories and select one based on your need/mood.",
                style: GoogleFonts.changa(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                "There are number of quotes available for each category",
                style: GoogleFonts.changa(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                "You can COPY the quote and use it anywhere you want.",
                style: GoogleFonts.changa(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                "You can LIKE quotes and manage your liked quotes separately.",
                style: GoogleFonts.changa(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                "More importantly this app works offline!",
                style: GoogleFonts.changa(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
