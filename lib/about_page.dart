import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

import '../constant.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: textColor,
        ),
        title: Text(
          "About Us",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      backgroundColor: Color(0xffFFFFFF),
      body: Container(
        alignment: Alignment.center,
        child: EmptyWidget(
          image: null,
          packageImage: PackageImage.Image_2,
          title: 'No Data',
          subTitle: 'No  Data available yet',
          titleTextStyle: TextStyle(
            fontSize: 22,
            color: primaryColor,
            fontWeight: FontWeight.w500,
          ),
          subtitleTextStyle: TextStyle(
            fontSize: 14,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
