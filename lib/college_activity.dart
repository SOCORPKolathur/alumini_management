import 'package:alumini_management/photo.dart';
import 'package:alumini_management/photo2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:share_plus/share_plus.dart';

import 'Widget/kText.dart';
import 'constant.dart';

class CollegeActivity extends StatefulWidget {
  const CollegeActivity({super.key});

  @override
  State<CollegeActivity> createState() => _CollegeActivityState();
}

class _CollegeActivityState extends State<CollegeActivity>
    with TickerProviderStateMixin {
  //bool isFavorite = false;
  List<bool> isFavorite = List.generate(100, (index) => false);
  late final List<AnimationController> _controller = List.generate(
      100,
      (index) => AnimationController(
          duration: const Duration(milliseconds: 200),
          vsync: this,
          value: 1.0));
  late final List<AnimationController> _controller1 = List.generate(
      100,
      (index) => AnimationController(
          duration: const Duration(milliseconds: 200),
          vsync: this,
          value: 1.0));
  late final List<AnimationController> _controller2 = List.generate(
      100,
      (index) => AnimationController(
          duration: const Duration(milliseconds: 200),
          vsync: this,
          value: 1.0));

  late final List<AnimationController> _controller3 = List.generate(
      100,
      (index) => AnimationController(
          duration: const Duration(milliseconds: 200),
          vsync: this,
          value: 1.0));

  // _submitData(docid) {
  //   FirebaseFirestore.instance.collection('Post').doc(docid).update({
  //     'Likes': FieldValue.increment(count),
  //   });
  // }

  String? uid;
  String docid = "";
  int count = 0;
  @override
  void dispose() {
    super.dispose();
    for (int i = 0; i < 100; i++) {
      _controller[i].dispose();
    }
    for (int i = 0; i < 100; i++) {
      _controller1[i].dispose();
    }
    for (int i = 0; i < 100; i++) {
      _controller2[i].dispose();
    }

    count;
  }

  String con1 = "Groups";
  String con2 = "";
  String con3 = "";
  String con4 = "";
  final imageList = [
    'assets/pageview.png',
  ];

  @override
  void initState() {
    getdocId();

    super.initState();
  }

  String firstName = '';
  getdocId() async {
    var user = await FirebaseFirestore.instance.collection("Users").get();
    for (int i = 0; i < user.docs.length; i++) {
      if (user.docs[i]["userDocId"] == FirebaseAuth.instance.currentUser!.uid) {
        setState(() {
          firstName = user.docs[i]["Name"];
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Post')
            .orderBy("timestamp", descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            return ListView.builder(
              shrinkWrap: true,
              //  physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var document = snapshot.data!.docs[index];
                return "collegeactivity" == document["types"]
                    ? Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: height / 75.4, left: width / 14),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: KText(
                          style: GoogleFonts.lato(
                            color: Color(0xff262626),
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                          text: document["catitle"],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(left: width / 14),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: KText(
                          style: GoogleFonts.lato(
                            color: Color(0xff262626)
                                .withOpacity(.2),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          text: "post by ${document["catime"]}",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 37.7,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: width / 14,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: width / 1.12,
                          child: KText(
                            text: document["cadescription"],
                            style: GoogleFonts.lato(
                              color: Color(0xff262626),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 37.7,
                    ),
                    document["caimageurl"] != ""
                        ? InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    PhotoPage()));
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: height / 37.7,
                            vertical: width / 18),
                        child: ClipRRect(
                          borderRadius:
                          BorderRadius.circular(25),
                          child: Container(
                            height: height / 4.71,
                            width: width / 1.12,
                            child: Image.network(
                              document["caimageurl"],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    )
                        : SizedBox(),
                    SizedBox(height: height / 75.4),
                    Row(
                      children: [
                        SizedBox(
                          width: width / 12,
                        ),
                        Icon(
                          Icons.thumb_up,
                          size: 20,
                        ),
                        KText(
                          text: document["likes"].contains(uid)
                              ? " You and ${document["likes"].length - 1} others liked"
                              : " ${document["likes"].length} others liked",
                          style: GoogleFonts.lato(
                            color: Color(0xff262626)
                                .withOpacity(.2),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 37.7,
                      width: width / 1.12,
                      child: Divider(
                        color: TextColor.withOpacity(.1),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width / 12,
                        ),
                        GestureDetector(
                          onTap: () async {
                            //Increment like count in Firestore

                            if (document["likes"]
                                .contains(uid)) {
                              FirebaseFirestore.instance
                                  .collection("Post")
                                  .doc(document.id)
                                  .update({
                                "likes": FieldValue.arrayRemove(
                                    [uid])
                              });
                            } else {
                              FirebaseFirestore.instance
                                  .collection("Post")
                                  .doc(document.id)
                                  .update({
                                "likes":
                                FieldValue.arrayUnion([uid])
                              });
                            }
                            _controller1[index].reverse().then(
                                    (value) => _controller1[index]
                                    .forward());
                          },
                          child: Row(
                            children: [
                              ScaleTransition(
                                scale: Tween(
                                    begin: 0.7, end: 1.0)
                                    .animate(CurvedAnimation(
                                  parent: _controller1[index],
                                  curve: Curves.easeOut,
                                )),
                                child: document["likes"]
                                    .contains(uid)
                                    ? Icon(
                                  Icons.thumb_up,
                                  size: 20,
                                  color: Colors.blue,
                                )
                                    : Icon(
                                  Icons
                                      .thumb_up_alt_outlined,
                                  size: 20,
                                ),
                              ),
                              KText(
                                style: GoogleFonts.lato(
                                  color: Color(0xff262626),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                text:
                                " Like (${document["likes"].length})", // Display the like count
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width / 2,
                        ),
                        InkWell(
                          onTap: () {
                            Share.share(document["catitle"],
                                subject:
                                document["cadescription"]);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.share,
                                size: 20,
                                color: primaryColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              KText(
                                style: GoogleFonts.lato(
                                  color: Color(0xff262626),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                text: "Share",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 37.7,
                      width: width / 1.12,
                      child: Divider(
                        color: TextColor.withOpacity(.1),
                      ),
                    ),
                  ],
                )
                    : SizedBox();
              },
            );
          } else {
            return Center(
                child: KText(
              text: 'No data available',
              style: GoogleFonts.lato(
                color: Color(0xff262626),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ));
          }
        },
      ),
    );
  }
}
