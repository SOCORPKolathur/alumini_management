import 'dart:async';

import 'package:alumini_management/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: width / 1.3, top: height / 7.54),
            child: SizedBox(
              width: width / 3.6,
              child: Image.asset("assets/Ellipse 118.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 1.12, top: height / 12.56),
            child: CircleAvatar(
              radius: 13,
              backgroundColor: Color(0xffEE516D),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: width / 1.8,
            ),
            child: SizedBox(
              width: width / 2.4,
              child: Image.asset("assets/Ellipse 122 (1).png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 2.25, top: height / 16.75),
            child: SizedBox(
              width: width / 2.4,
              child: Image.asset("assets/yellow_ring.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 5.14, top: height / 9.42),
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Color(0xff4DC591),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 3, top: height / 2.43),
            child: SizedBox(
              width: width / 2.4,
              child: Image.asset("assets/logo.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 2.7, top: height / 1.73),
            child: Text(
              "IKIA COLLEGE",
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 4, top: height / 1.60),
            child: Text(
              "ALUMNI CONNECTIONS",
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 1.32),
            child: SizedBox(
              width: width / 2.4,
              child: Image.asset("assets/Ellipse 117.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 1.47),
            child: SizedBox(
              height: height / 2.51,
              child: Image.asset("assets/right (2).png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 4.5, top: height / 1.25),
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Color(0xff4DC591),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 1.23),
            child: SizedBox(
              width: width / 4.5,
              child: Image.asset("assets/yellow_ring.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 1.14, left: width / 9),
            child: SizedBox(
              width: width / 4.5,
              child: Image.asset("assets/diamond.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 7.85, left: width / 1.33),
            child: SizedBox(
              width: width / 4.5,
              child: Image.asset("assets/diamond.png"),
            ),
          ),
        ],
      ),
    );
  }
}
