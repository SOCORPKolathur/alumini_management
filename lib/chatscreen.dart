import 'dart:convert';

import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class ChatScreen extends StatefulWidget {
  //String Picture;
  String Name;
  ChatScreen(this.Name);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<Message> msgs = [];
  bool isTyping = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: textColor,
            )),
        title: Text(
          widget.Name,
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: Stack(
        children: [
          Container(
            // height: double.infinity,
            // width: double.infinity,

            child: Image.asset(
              "assets/chat.png",
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height / 18.85,
                ),
                BubbleNormal(
                  text: 'hai...',
                  isSender: true,
                  color: Color(0xFFDCEFFB),
                  tail: true,
                  //sent: true,
                ),
                SizedBox(
                  height: height / 75.4,
                ),
                BubbleNormal(
                  text: 'hai',
                  color: Color(0xFFE8E8EE),
                  tail: false,
                  sent: false,
                  isSender: false,
                  //  seen: true,
                  delivered: false,
                ),
                SizedBox(
                  height: height / 75.4,
                ),
                BubbleNormal(
                  text: 'bye',
                  isSender: false,
                  color: TextColor.withOpacity(.1),
                  tail: true,
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: TextColor,
                  ),
                ),
                SizedBox(
                  height: height / 37.7,
                ),
                BubbleNormal(
                  text: 'how was going your work?',
                  isSender: false,
                  color: TextColor.withOpacity(.1),
                  tail: true,
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: TextColor,
                  ),
                ),
                SizedBox(
                  height: height / 75.4,
                ),
                BubbleNormal(
                  text: 'good',
                  isSender: true,
                  color: Color(0xFFDCEFFB),
                  tail: true,
                  //sent: true,
                ),
                SizedBox(
                  height: height / 75.4,
                ),
                BubbleNormal(
                  text: 'hai',
                  color: Color(0xFFE8E8EE),
                  tail: false,
                  sent: false,
                  isSender: false,
                  //  seen: true,
                  delivered: false,
                ),
                SizedBox(
                  height: height / 75.4,
                ),
                BubbleNormal(
                  text: 'will u meet tomorrow',
                  isSender: false,
                  color: TextColor.withOpacity(.1),
                  tail: true,
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: TextColor,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
      bottomNavigationBar: Container(
        height: 65,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          controller: controller,
                          textCapitalization: TextCapitalization.sentences,
                          onSubmitted: (value) {
                            //sendMsg();
                          },
                          textInputAction: TextInputAction.send,
                          showCursor: true,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Enter text"),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // sendMsg();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  bool isSender;
  String msg;
  Message(this.isSender, this.msg);
}
