import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

import 'Widget/kText.dart';
import 'constant.dart';

class ConnectPage extends StatefulWidget {
  const ConnectPage({super.key});

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdocId();
  }
  String image= '';
  String? uid;

  getdocId() async {
    var user = await FirebaseFirestore.instance.collection("Users").get();
    for (int i = 0; i < user.docs.length; i++) {
      if (user.docs[i]["userDocId"] == FirebaseAuth.instance.currentUser!.uid) {
        setState(() {
          image = user.docs[i]["UserImg"];

          uid = user.docs[i].id;

        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: KText(

          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800), text:  "Near By",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 7.54,
            ),
            RippleAnimation(
              child: CircleAvatar(
                minRadius: 75,
                maxRadius: 75,
                backgroundImage: NetworkImage(image),
              ),
              color: primaryColor,
              delay: const Duration(milliseconds: 300),
              repeat: true,
              minRadius: 75,
              ripplesCount: 8,
              duration: const Duration(milliseconds: 6 * 300),
            ),
            SizedBox(
              height: height / 9.42,
            ),
            // Container(
            //   width: width / 1.2,
            //   height: height / 15.08,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     color: Color(0xffF5F5F5),
            //   ),
            //   child: TextField(
            //     keyboardType: TextInputType.phone,
            //     maxLength: 10,
            //     decoration: InputDecoration(
            //         border: InputBorder.none,
            //         contentPadding: EdgeInsets.only(
            //             top: height / 37.7,
            //             bottom: height / 75.4,
            //             left: width / 18),
            //         hintText: 'Search by location or name',
            //         counter: SizedBox(),
            //         suffixIcon: IconButton(
            //           onPressed: () {},
            //           icon: Icon(
            //             Icons.search,
            //             color: TextColor.withOpacity(.3),
            //           ),
            //         ),
            //         hintStyle: GoogleFonts.sofiaSans(
            //             color: Color(0xff262626).withOpacity(.3))),
            //   ),
            // ),
            SizedBox(
              height: height / 75.4,
            ),
            Padding(
              padding: EdgeInsets.only(right: width / 2.25),
              child: KText(

                style: GoogleFonts.sofiaSans(
                  color: Color(0xff262626),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ), text:  "Near by Alumni",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: width / 3),
              child: KText(

                style: GoogleFonts.sofiaSans(
                  color: TextColor.withOpacity(.4),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ), text:  "08 alumnies near by you",
              ),
            ),
            SizedBox(
              height: height / 75.4,
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 18,
                ),
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: height / 3.42,
                    width: width / 2.4,
                    decoration: BoxDecoration(
                      color: textColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: width / 4,
                          child: Image.asset("assets/person1.png"),
                        ),
                        KText(

                          style: GoogleFonts.sofiaSans(
                              fontSize: 14,
                              color: TextColor,
                              fontWeight: FontWeight.w800), text:   "Daniel Atkins",
                        ),
                        KText(

                          style: GoogleFonts.sofiaSans(
                              fontSize: 14,
                              color: TextColor,
                              fontWeight: FontWeight.w800), text:  "27836434",
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: width / 72,
                            ),
                            Icon(
                              Icons.location_on,
                              color: TextColor.withOpacity(.7),
                            ),
                            SizedBox(
                              width: width / 72,
                            ),
                            KText(

                              style: GoogleFonts.sofiaSans(
                                  fontSize: 14,
                                  color: TextColor.withOpacity(.3),
                                  fontWeight: FontWeight.w800), text: "Koratur, Chennai",
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height / 37.7,
                        ),
                        Container(
                          height: height / 25.13,
                          width: width / 3.6,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: height / 150.8),
                            child: KText(

                              textAlign: TextAlign.center,
                              style: GoogleFonts.sofiaSans(
                                  fontSize: 14,
                                  color: textColor,
                                  fontWeight: FontWeight.w800), text:  "Connect",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 24,
                ),
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: height / 3.42,
                    width: width / 2.4,
                    decoration: BoxDecoration(
                      color: textColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: width / 4,
                          child: Image.asset("assets/person1.png"),
                        ),
                        KText(

                          style: GoogleFonts.sofiaSans(
                              fontSize: 14,
                              color: TextColor,
                              fontWeight: FontWeight.w800), text:  "Daniel Atkins",
                        ),
                        KText(

                          style: GoogleFonts.sofiaSans(
                              fontSize: 14,
                              color: TextColor,
                              fontWeight: FontWeight.w800), text:  "27836434",
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: width / 72,
                            ),
                            Icon(
                              Icons.location_on,
                              color: TextColor.withOpacity(.7),
                            ),
                            SizedBox(
                              width: width / 72,
                            ),
                            KText(

                              style: GoogleFonts.sofiaSans(
                                  fontSize: 14,
                                  color: TextColor.withOpacity(.3),
                                  fontWeight: FontWeight.w800), text: "Koratur, Chennai",
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height / 37.7,
                        ),
                        Container(
                          height: height / 25.13,
                          width: width / 3.6,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: height / 150.8),
                            child: KText(

                              textAlign: TextAlign.center,
                              style: GoogleFonts.sofiaSans(
                                  fontSize: 14,
                                  color: textColor,
                                  fontWeight: FontWeight.w800), text:  "Connect",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 37.7,
            ),
          ],
        ),
      ),
    );
  }
}
