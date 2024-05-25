import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
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
          "Location",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Padding(
              padding: EdgeInsets.only(top: height / 37.7, left: width / 18),
              child: Icon(
                Icons.location_on,
                size: 30,
                color: primaryColor,
              ),
            ),
            title: Padding(
              padding: EdgeInsets.only(left: width / 12, top: height / 37.7),
              child: Text(
                "Chennai",
                style: GoogleFonts.sofiaSans(
                    fontSize: 16,
                    color: primaryColor,
                    fontWeight: FontWeight.w800),
              ),
            ),
            trailing: Padding(
              padding: EdgeInsets.only(top: height / 37.7, right: width / 18),
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => CompanyDetails()));
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: primaryColor,
                  size: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Padding(
              padding: EdgeInsets.only(top: height / 37.7, left: width / 18),
              child: Icon(
                Icons.location_on,
                size: 30,
                color: primaryColor,
              ),
            ),
            title: Padding(
              padding: EdgeInsets.only(left: width / 12, top: height / 37.7),
              child: Text(
                "Banglore",
                style: GoogleFonts.sofiaSans(
                    fontSize: 16,
                    color: primaryColor,
                    fontWeight: FontWeight.w800),
              ),
            ),
            trailing: Padding(
              padding: EdgeInsets.only(top: height / 37.7, right: width / 18),
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => CompanyDetails()));
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: primaryColor,
                  size: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Padding(
              padding: EdgeInsets.only(top: height / 37.7, left: width / 18),
              child: Icon(
                Icons.location_on,
                size: 30,
                color: primaryColor,
              ),
            ),
            title: Padding(
              padding: EdgeInsets.only(left: width / 12, top: height / 37.7),
              child: Text(
                "Trichy",
                style: GoogleFonts.sofiaSans(
                    fontSize: 16,
                    color: primaryColor,
                    fontWeight: FontWeight.w800),
              ),
            ),
            trailing: Padding(
              padding: EdgeInsets.only(top: height / 37.7, right: width / 18),
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => CompanyDetails()));
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: primaryColor,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
