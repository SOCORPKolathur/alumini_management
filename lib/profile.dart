import 'package:alumini_management/about_page.dart';
import 'package:alumini_management/constant.dart';
import 'package:alumini_management/job_post.dart';
import 'package:alumini_management/language_screen.dart';
import 'package:alumini_management/notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Widget/kText.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdocId();
  }

  String firstName = '';
  String city = "";
  String? uid;
  String batch = "";
  String image = "";
  String group = "";
  String workingAt = "";
  String phone = "";
  getdocId() async {
    var user = await FirebaseFirestore.instance.collection("Users").get();
    for (int i = 0; i < user.docs.length; i++) {
      if (user.docs[i]["userDocId"] == FirebaseAuth.instance.currentUser!.uid) {
        setState(() {
          firstName = user.docs[i]["Name"];
          city = user.docs[i]["city"];
          batch = user.docs[i]["yearofpassed"];
          image = user.docs[i]["UserImg"];
          uid = user.docs[i].id;
          group = user.docs[i]["educationquvalification"];
          workingAt = user.docs[i]["company_concern"];
          phone = user.docs[i]["Phone"];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height / 2.09,
            width: double.infinity,
            color: primaryColor,
          ),
          Container(
            child: Image.asset("assets/profile1.png"),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 1.12, top: height / 10.77),
            child: Container(
              height: height / 5.02,
              child: Image.asset("assets/Ellipse 13.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 1.56, top: height / 8.87),
            child: Container(
              child: Image.asset("assets/Vector_profile3.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 1.12, top: height / 3.77),
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Color(0xff4DC591),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 1.05, top: height / 2.76),
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Color(0xffEE516D),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 36, top: height / 8.37),
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Color(0xffEE516D),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 36, top: height / 5.8),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Color(0xff65A4DA),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 3.42),
            child: Container(
              child: Image.asset("assets/Ellipse 15 (1).png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 121, top:107),
            child: Container(
              width: width / 3.6,
              child: Image.network(image),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 3.6, top: height / 7.54),
            child: Container(
              child: Image.asset("assets/Vector_profile.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 2.05, top: height / 7.54),
            child: Container(
              child: Image.asset("assets/Vector_profile1.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 3.27, top: height / 15.08),
            child: KText(

              style: GoogleFonts.sofiaSans(
                  fontSize: 24, color: textColor, fontWeight: FontWeight.w800), text:  "User Profile",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 2.88, top: height / 3.14),
            child: Text(
              firstName,
              style: GoogleFonts.sofiaSans(
                  fontSize: 24, color: textColor, fontWeight: FontWeight.w800),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 133, top: height / 2.79),
            child: Text(
              phone,
              style: GoogleFonts.sofiaSans(
                  fontSize: 14,
                  color: textColor.withOpacity(.6),
                  fontWeight: FontWeight.w800),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 6.54, top: height / 2.51),
            child: Container(
              height: height / 6.85,
              width: width / 1.44,
              decoration: BoxDecoration(
                  color: textColor, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  SizedBox(
                    height: height / 75.4,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width / 12,
                      ),
                      KText(

                        style: GoogleFonts.sofiaSans(
                            fontSize: 16,
                            color: TextColor.withOpacity(.6),
                            fontWeight: FontWeight.w800), text:  "Batch                 :",
                      ),
                      SizedBox(
                        width: width / 18,
                      ),
                      Text(batch),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width / 12,
                      ),
                      KText(

                        style: GoogleFonts.sofiaSans(
                            fontSize: 16,
                            color: TextColor.withOpacity(.6),
                            fontWeight: FontWeight.w800), text:   "Group                 :",
                      ),
                      SizedBox(
                        width: width / 18,
                      ),
                      Text(group,
                          style: GoogleFonts.sofiaSans(
                            fontSize: 16,
                            color: TextColor,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width / 12,
                      ),
                      KText(

                        style: GoogleFonts.sofiaSans(
                            fontSize: 16,
                            color: TextColor.withOpacity(.6),
                            fontWeight: FontWeight.w800), text:   "Living In            :",
                      ),
                      SizedBox(
                        width: width / 18,
                      ),
                      Text(city)
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width / 12,
                      ),
                      KText(

                        style: GoogleFonts.sofiaSans(
                            fontSize: 16,
                            color: TextColor.withOpacity(.6),
                            fontWeight: FontWeight.w800), text:  "Working At      :",
                      ),
                      SizedBox(
                        width: width / 18,
                      ),
                      Text(workingAt),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 18, top: height / 1.79),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => JobPost( FirebaseAuth.instance.currentUser!.uid)));
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.badge,
                      color: primaryColor,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(left: width / 12),
                      child: KText(

                        style: GoogleFonts.sofiaSans(
                            fontSize: 14,
                            color: TextColor.withOpacity(.4),
                            fontWeight: FontWeight.w800), text: "Your Job Posts",
                      ),
                    ),
                    trailing: Padding(
                      padding: EdgeInsets.only(right: width / 36),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => JobPost( FirebaseAuth.instance.currentUser!.uid )));
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: TextColor.withOpacity(.4),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LanguageScreen()));
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.translate,
                      color: primaryColor,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(left: width / 12),
                      child: KText(

                        style: GoogleFonts.sofiaSans(
                            fontSize: 14,
                            color: TextColor.withOpacity(.4),
                            fontWeight: FontWeight.w800), text: "Languages",
                      ),
                    ),
                    trailing: Padding(
                      padding: EdgeInsets.only(right: width / 36),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LanguageScreen()));
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: TextColor.withOpacity(.4),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AboutPage()));
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: primaryColor,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(left: width / 12),
                      child: KText(

                        style: GoogleFonts.sofiaSans(
                            fontSize: 14,
                            color: TextColor.withOpacity(.4),
                            fontWeight: FontWeight.w800), text:   "About Us",
                      ),
                    ),
                    trailing: Padding(
                      padding: EdgeInsets.only(right: width / 36),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AboutPage()));
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: TextColor.withOpacity(.4),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Notifications()));
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.notifications,
                      color: primaryColor,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(left: width / 12),
                      child: KText(

                        style: GoogleFonts.sofiaSans(
                            fontSize: 14,
                            color: TextColor.withOpacity(.4),
                            fontWeight: FontWeight.w800), text: "Notifications",
                      ),
                    ),
                    trailing: Padding(
                      padding: EdgeInsets.only(right: width / 36),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Notifications()));
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: TextColor.withOpacity(.4),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
