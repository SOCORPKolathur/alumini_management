import 'package:alumini_management/chatscreen.dart';
import 'package:alumini_management/company.dart';
import 'package:alumini_management/location.dart';
import 'package:alumini_management/nearby.dart';
import 'package:alumini_management/profession.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant.dart';

class BatchScreen extends StatefulWidget {
  String title;
  BatchScreen(this.title);

  @override
  State<BatchScreen> createState() => _BatchScreenState();
}

class _BatchScreenState extends State<BatchScreen> {
  List Picture = [
    "assets/girl1.png",
    "assets/girl2.png",
    "assets/girl3.png",
    "assets/girl4.png",
  ];
  List Name = [
    "Ella Simmons",
    "Dayana Atkinson",
    "Felipe Potter",
    "Falguni Nayar",
  ];
  List Batch = [
    "Bsc,cs",
    "Bsc,phy",
    "Bsc,tamil",
    "Bsc,english",
  ];
  List Time = [
    "2:14 PM ",
    "2:14 PM ",
    "2:14 PM ",
    "2:14 PM ",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        leading: Padding(
          padding: EdgeInsets.only(left: width / 14.4),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: textColor,
              )),
        ),
        title: Text(
          widget.title,
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height / 37.7,
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffF5F5F5),
            child: Container(
              width: width / 1.09,
              height: height / 15.08,
              decoration: BoxDecoration(),
              child: TextField(
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        top: height / 37.7,
                        bottom: height / 75.4,
                        left: width / 18),
                    hintText: 'Search by name',
                    counter: SizedBox(),
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: TextColor.withOpacity(.3),
                      ),
                    ),
                    hintStyle: GoogleFonts.sofiaSans(
                        color: Color(0xff262626).withOpacity(.3))),
              ),
            ),
          ),
          SizedBox(
            height: height / 37.7,
          ),
          Row(
            children: [
              SizedBox(
                width: width / 12,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CompanyPage()));
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.location_city,
                      size: 40,
                      color: primaryColor,
                    ),
                    Text(
                      "Company",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width / 12,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Location()));
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.pin_drop_rounded,
                      size: 40,
                      color: primaryColor,
                    ),
                    Text(
                      "Location",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width / 12,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ConnectPage()));
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.track_changes_sharp,
                      size: 40,
                      color: primaryColor,
                    ),
                    Text(
                      "Near me",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width / 12,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProfessionPage()));
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.badge,
                      size: 40,
                      color: primaryColor,
                    ),
                    Text(
                      "Profession",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: height / 25.13,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: Picture.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChatScreen(
                            Name[index],
                          )));
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: width / 24,
                        ),
                        Container(
                          child: Image.asset(Picture[index]),
                          width: width / 7.2,
                        ),
                        SizedBox(
                          width: width / 18,
                        ),
                        Column(
                          children: [
                            Container(
                              width: width / 1.8,
                              child: Text(
                                Name[index],
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                              width: width / 1.8,
                              child: Text(
                                Batch[index],
                                style: GoogleFonts.lato(
                                  color: TextColor.withOpacity(.8),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Badge(
                              label: Text('2'),
                              backgroundColor: primaryColor,
                            ),
                            Text(
                              Time[index],
                              style: GoogleFonts.lato(
                                color: TextColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 37.7,
                      width: double.infinity,
                      child: Divider(
                        color: TextColor.withOpacity(.1),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
