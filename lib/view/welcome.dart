import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  startTime() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {

    Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const HomePage(),
      ),
          (Route<dynamic> route) => false,
    );


  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/welcome.png",
            height: h,
            width: w,
            fit: BoxFit.cover,
          ),
          Positioned(
              left: 20.0,
              right: 20.0,
              bottom: 40.0,
              child:
                  LoadingAnimationWidget.inkDrop(size: 40, color: Colors.black))
        ],
      ),
    );
  }
}
