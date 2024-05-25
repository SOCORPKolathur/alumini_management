import 'package:alumini_management/batch_screen.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Widget/kText.dart';
import 'chatscreen.dart';
import 'constant.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
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
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
          text: "Message",
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height / 75.4,
          ),
          InkWell(
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BatchScreen("Batch of 2022")));
              },
              leading: Padding(
                padding: EdgeInsets.only(left: 0),
                child: CircleAvatar(
                  radius: 38,
                  backgroundImage: AssetImage("assets/logo.png"),
                ),
              ),
              title: Container(
                width: 200,
                child: KText(
                  style: GoogleFonts.sofiaSans(
                    color: TextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                  text: "Batch of 2022",
                ),
              ),
              subtitle: Container(
                width: 200,
                child: KText(
                  style: GoogleFonts.sofiaSans(
                    color: TextColor.withOpacity(.4),
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                  text: "Hello !",
                ),
              ),
              trailing: Container(
                width: 70,
                child: KText(
                  style: GoogleFonts.sofiaSans(
                    color: TextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                  text: "02:15 Am",
                ),
              ),
            ),
          ),
          SizedBox(
            width: width / 1.02,
            child: Divider(
              color: Color(0xff262626).withOpacity(.1),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ChatScreen("Group")));
            },
            leading: Padding(
              padding: EdgeInsets.only(left: width / 36),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/flower.jpg"),
              ),
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 0),
              child: Container(
                width: 200,
                child: KText(
                  style: GoogleFonts.sofiaSans(
                    color: TextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                  text: "BCA 2022",
                ),
              ),
            ),
            subtitle: Container(
              width: 200,
              child: KText(
                style: GoogleFonts.sofiaSans(
                  color: TextColor.withOpacity(.4),
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
                text: "Hello !",
              ),
            ),
            trailing: Container(
              width: 70,
              child: KText(
                style: GoogleFonts.sofiaSans(
                  color: TextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
                text: "02:15 Am",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
