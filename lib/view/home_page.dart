import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quotes/view/about_app.dart';
import 'package:quotes/view/daily_quote.dart';
import 'package:quotes/view/faqs.dart';
import 'package:quotes/view/like_quotes.dart';
import 'package:quotes/view/privicy_policy.dart';

import 'package:quotes/view/quotes_view.dart';

import '../main.dart';
import 'notification_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<bool> isNotification = ValueNotifier(false);

  Future<void> getData() async {
    await dbHelper.databaseGet();

    setState(() {});
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffF6CED5),
        centerTitle: true,
        title: Text(
          "Quotes & Status",
          style: GoogleFonts.satisfy(
              color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
      body: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: dbHelper.category.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    duration: const Duration(seconds: 1),
                    curve: Curves.bounceIn,
                    type: PageTransitionType.rotate,
                    alignment: Alignment.topCenter,
                    child: ViewQuotes(
                      id: dbHelper.category[i]['_id'],
                      name: dbHelper.category[i]['name'],
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 2.0,
                child: Center(
                  child: SizedBox(
                    height: 110,
                    width: 110,
                    child: Stack(
                      children: [
                        Image.asset('assets/images/Asset 1.png'),
                        Positioned(
                          top: 50.0,
                          right: 10.0,
                          left: 10.0,
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                "${dbHelper.category[i]['name']}",
                                textScaleFactor: 0.85,
                                style: GoogleFonts.concertOne(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: h * 0.2,
              width: w,
              decoration: const BoxDecoration(
                color: Color(0xffF6CED5),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  Text(
                    "Quotes & Status",
                    style: GoogleFonts.satisfy(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            //Like Quote
            GestureDetector(
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(seconds: 2),
                      curve: Curves.bounceIn,
                      type: PageTransitionType.scale,
                      alignment: Alignment.topCenter,
                      child: const LikeQuotes()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                width: w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.pink,
                    )),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Icon(
                      CupertinoIcons.heart_fill,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "Liked Quotes",
                      style: GoogleFonts.concertOne(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                height: 50,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            //Quote Of The Day
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(seconds: 2),
                      curve: Curves.bounceIn,
                      type: PageTransitionType.scale,
                      alignment: Alignment.topCenter,
                      child: const DailyQuote()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                width: w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.pink,
                    )),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Icon(CupertinoIcons.circle_bottomthird_split),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "Quotes of The Day",
                      style: GoogleFonts.concertOne(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                height: 50,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Divider(
              height: 1.0,
              color: Colors.pink,
              thickness: 1.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            //Notification
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              width: w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.pink,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Icon(CupertinoIcons.bell)),
                  Text(
                    "Notification",
                    style: GoogleFonts.concertOne(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  ValueListenableBuilder(
                      valueListenable: isNotification,
                      builder: (context, v, c) {
                        return CupertinoSwitch(
                          value: isNotification.value,
                          onChanged: (v) {
                            isNotification.value = v;
                            NotificationService();
                          },
                        );
                      })
                ],
              ),
              height: 50,
            ),
            //FAQS
            const SizedBox(
              height: 15.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(seconds: 2),
                      curve: Curves.bounceIn,
                      type: PageTransitionType.scale,
                      alignment: Alignment.topCenter,
                      child: const FaqS()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                width: w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.pink,
                    )),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Icon(CupertinoIcons.square_favorites),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "FAQs",
                      style: GoogleFonts.concertOne(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                height: 50,
              ),
            ),
            //Privacy  Policy
            const SizedBox(
              height: 15.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(seconds: 2),
                      curve: Curves.bounceIn,
                      type: PageTransitionType.scale,
                      alignment: Alignment.topCenter,
                      child: const PrivacyPolicy()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                width: w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.pink,
                    )),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Icon(CupertinoIcons.doc),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "Privacy Policy",
                      style: GoogleFonts.concertOne(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                height: 50,
              ),
            ),
            //Contact us
            const SizedBox(
              height: 15.0,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);

                Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(seconds: 2),
                      curve: Curves.bounceIn,
                      type: PageTransitionType.scale,
                      alignment: Alignment.topCenter,
                      child: const AboutApp()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                width: w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.pink,
                    )),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Icon(Icons.info_outline),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "About App",
                      style: GoogleFonts.concertOne(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                height: 50,
              ),
            ),
            //Share App
            const SizedBox(
              height: 15.0,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              width: w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.pink,
                  )),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Icon(Icons.share),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    "Share",
                    style: GoogleFonts.concertOne(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
