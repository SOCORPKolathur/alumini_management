import 'package:alumini_management/apply_job.dart';
import 'package:alumini_management/bottom_nav_bar.dart';
import 'package:alumini_management/college_activity.dart';
import 'package:alumini_management/events.dart';
import 'package:alumini_management/nearby.dart';
import 'package:alumini_management/message.dart';
import 'package:alumini_management/photo.dart';
import 'package:alumini_management/photo2.dart';
import 'package:alumini_management/photo3.dart';
import 'package:alumini_management/post.dart';
import 'package:alumini_management/profile.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import 'package:share_plus/share_plus.dart';

import 'Widget/kText.dart';
import 'constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //late final AnimationController _controller = AnimationController(duration: const Duration(milliseconds: 200), vsync: this, value: 1.0);

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

  String con1 = "All";
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

  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              Container(
                  width: 200,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EventScreen()));
                    },
                    child: Text(
                      "Event",
                      style: GoogleFonts.lato(
                        color: Color(0xff262626),
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  )),
              SizedBox(
                width: double.infinity,
                child: Divider(
                  color: TextColor,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CollegeActivity()));
                },
                child: Container(
                    width: 200,
                    child: Text(
                      "College Activity",
                      style: GoogleFonts.lato(
                        color: Color(0xff262626),
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    )),
              ),
              SizedBox(
                width: double.infinity,
                child: Divider(
                  color: TextColor,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Post()));
                },
                child: Container(
                    width: 200,
                    child: Text(
                      "Job Post",
                      style: GoogleFonts.lato(
                        color: Color(0xff262626),
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    )),
              ),
            ],
          ),
        );
      },
    );
  }

  String events = "";
  String collegeactivity = "";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(
            statusBarColor: Color(0xff006BA6),
            statusBarIconBrightness: Brightness.light,
          ),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: height / 37.7,
                ),
                Padding(
                  padding: EdgeInsets.only(right: width / 1.87),
                  child: KText(
                    style: GoogleFonts.sofiaSans(
                      color: Color(0xff262626),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    text: "Hai ${firstName},",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: width / 18),
                  child: KText(
                    style: GoogleFonts.sofiaSans(
                      color: Color(0xff262626).withOpacity(.2),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    text: "Let’s Connect with your friends!",
                  ),
                ),
                SizedBox(
                  height: height / 37.7,
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('SliderImages')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }

                    List<Widget> images =
                        []; // List to hold the Image.network widgets

                    // Iterate through the documents in the snapshot and add Image.network widgets
                    snapshot.data!.docs.forEach((doc) {
                      String imageUrl = doc['imgUrl'];
                      images.add(
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: height / 37.7, vertical: width / 18),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: ClipRRect(
                              child: Container(
                                  height: height / 3.77,
                                  width: width / 1.2,
                                  child: Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                        ),
                      );
                    });

                    return ImageSlideshow(
                      indicatorRadius: 3,
                      onPageChanged: (value) {
                        debugPrint('Page changed: $value');
                      },
                      autoPlayInterval: 3000,
                      isLoop: true,
                      children:
                          images, // Set the children of the ImageSlideshow
                    );
                  },
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: height / 37.7, right: width / 1.53),
                  child: KText(
                    style: GoogleFonts.sofiaSans(
                      color: Color(0xff262626),
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                    text: "Filter by",
                  ),
                ),
                SizedBox(height: height / 75.4),
                Row(
                  children: [
                    SizedBox(
                      width: width / 18,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Example()));
                        setState(() {
                          con1 = "All";
                        });
                      },
                      child: Container(
                        height: height / 21.54,
                        width: width / 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              con1 == "All" ? primaryColor : Color(0xffF5F5F5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: height / 251.33, left: width / 36),
                          child: KText(
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sofiaSans(
                              color:
                                  con1 == "All" ? textColor : Color(0xff262626),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            text: "All",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width / 36,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          con1 = "Groups";
                        });
                      },
                      child: Container(
                        height: height / 21.54,
                        width: width / 4.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: con1 == "Groups"
                              ? primaryColor
                              : Color(0xffF5F5F5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: height / 251.33, left: width / 36),
                          child: KText(
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sofiaSans(
                              color: con1 == "Groups"
                                  ? textColor
                                  : Color(0xff262626),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            text: "Groups",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width / 36,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          con1 = "Post Type";
                          showAlertDialog(context);
                        });
                      },
                      child: Container(
                        height: height / 21.54,
                        width: width / 2.76,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: con1 == "Post Type"
                              ? primaryColor
                              : Color(0xffF5F5F5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: height / 150.8, left: width / 18),
                          child: KText(
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sofiaSans(
                              color: con1 == "Post Type"
                                  ? textColor
                                  : Color(0xff262626),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            text: "Post Type",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                StreamBuilder<QuerySnapshot>(
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
                        physics: NeverScrollableScrollPhysics(),
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
                              : "events" == document["types"]
                                  ? Column(
                                      children: [
                                        SizedBox(
                                          height: height / 37.7,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width / 16.36,
                                            ),
                                            Column(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(
                                                    width: 200,
                                                    child: KText(
                                                      style: GoogleFonts.lato(
                                                        color:
                                                            Color(0xff262626),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      text: document[
                                                          "eventtitle"],
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(
                                                    width: 200,
                                                    child: KText(
                                                      text:
                                                          "post by ${document["eventtime"]}",
                                                      style: GoogleFonts.lato(
                                                        color: Color(0xff262626)
                                                            .withOpacity(.2),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                //Increment like count in Firestore

                                                if (document["register"]
                                                    .contains(uid)) {
                                                  FirebaseFirestore.instance
                                                      .collection("Post")
                                                      .doc(document.id)
                                                      .update({
                                                    "register":
                                                        FieldValue.arrayRemove(
                                                            [uid])
                                                  });
                                                } else {
                                                  FirebaseFirestore.instance
                                                      .collection("Post")
                                                      .doc(document.id)
                                                      .update({
                                                    "register":
                                                        FieldValue.arrayUnion(
                                                            [uid])
                                                  });
                                                }
                                                QuickAlert.show(
                                                  context: context,
                                                  type: QuickAlertType.success,
                                                  text:
                                                      'Registered Successfully!',
                                                );
                                                _controller3[index]
                                                    .reverse()
                                                    .then((value) =>
                                                        _controller3[index]
                                                            .forward());
                                              },
                                              child: ScaleTransition(
                                                scale: Tween(
                                                        begin: 0.7, end: 1.0)
                                                    .animate(CurvedAnimation(
                                                  parent: _controller3[index],
                                                  curve: Curves.easeOut,
                                                )),
                                                child: document["register"]
                                                        .contains(uid)
                                                    ? Container(
                                                        height: height / 17.53,
                                                        width: width / 3,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: primaryColor
                                                              .withOpacity(.3),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: height /
                                                                      94.25,
                                                                  left: width /
                                                                      18),
                                                          child: KText(
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .lato(
                                                              color: textColor,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            text: "Registered",
                                                          ),
                                                        ),
                                                      )
                                                    : Container(
                                                        height: height / 17.53,
                                                        width: width / 3,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: height /
                                                                      94.25,
                                                                  left: width /
                                                                      12),
                                                          child: KText(
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .lato(
                                                              color: textColor,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            text: "Register",
                                                          ),
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height / 37.7,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: width / 14),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                              width: width / 1.12,
                                              child: KText(
                                                text: document[
                                                    "eventdescription"],
                                                style: GoogleFonts.lato(
                                                  color: TextColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height / 37.7,
                                        ),
                                        document["imageurl"] != ""
                                            ? InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              PhotoPage2()));
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: height / 37.7,
                                                      vertical: width / 18),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    child: Container(
                                                      height: height / 4.71,
                                                      width: width / 1.12,
                                                      child: Image.network(
                                                        document["imageurl"],
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
                                              text:
                                                  "You and ${document["likes"].length} others liked",
                                              style: GoogleFonts.lato(
                                                color: TextColor,
                                                fontSize: 16,
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
                                                    "likes":
                                                        FieldValue.arrayRemove(
                                                            [uid])
                                                  });
                                                } else {
                                                  FirebaseFirestore.instance
                                                      .collection("Post")
                                                      .doc(document.id)
                                                      .update({
                                                    "likes":
                                                        FieldValue.arrayUnion(
                                                            [uid])
                                                  });
                                                }
                                                _controller[index]
                                                    .reverse()
                                                    .then((value) =>
                                                        _controller[index]
                                                            .forward());
                                              },
                                              child: Row(
                                                children: [
                                                  ScaleTransition(
                                                    scale: Tween(
                                                            begin: 0.7,
                                                            end: 1.0)
                                                        .animate(
                                                            CurvedAnimation(
                                                      parent:
                                                          _controller[index],
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                Share.share(
                                                    document["eventtitle"],
                                                    subject: document[
                                                        "eventdescription"]);
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                  : "jobpost" == document["types"]
                                      ? Column(
                                          children: [
                                            SizedBox(
                                              height: height / 37.7,
                                            ),
                                            ListTile(
                                              leading: CircleAvatar(
                                                radius: 30,
                                                backgroundImage: NetworkImage(
                                                    document["userimage"]),
                                                //child: Image.network(image),
                                              ),
                                              title: KText(
                                                style: GoogleFonts.lato(
                                                  color: TextColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                text: document["name"],
                                              ),
                                              subtitle: KText(
                                                style: GoogleFonts.lato(
                                                  color: TextColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                text: document["jposttime"],
                                              ),
                                              trailing: InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ApplyJob(document
                                                                  .id)));
                                                },
                                                child: Container(
                                                  height: height / 17.53,
                                                  width: width / 3,
                                                  decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: height / 94.25,
                                                        left: width / 36),
                                                    child: KText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.lato(
                                                        color: textColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      text: "Apply for Job",
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width / 14),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  document["jposttitle"],
                                                  style: GoogleFonts.sofiaSans(
                                                    color: Color(0xff262626),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height / 75.4,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  "Company",
                                                  style: GoogleFonts.sofiaSans(
                                                      fontSize: 16,
                                                      color:
                                                          TextColor.withOpacity(
                                                              .6),
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                SizedBox(
                                                  width: width / 7.2,
                                                ),
                                                Text(
                                                  ":",
                                                  style: GoogleFonts.sofiaSans(
                                                      fontSize: 16,
                                                      color:
                                                          TextColor.withOpacity(
                                                              .6),
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                SizedBox(
                                                  width: width / 18,
                                                ),
                                                Text(document["company"])
                                              ],
                                            ),
                                            SizedBox(
                                              height: height / 75.4,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  "Location",
                                                  style: GoogleFonts.sofiaSans(
                                                      fontSize: 16,
                                                      color:
                                                          TextColor.withOpacity(
                                                              .6),
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                SizedBox(
                                                  width: width / 6.54,
                                                ),
                                                Text(
                                                  ":",
                                                  style: GoogleFonts.sofiaSans(
                                                      fontSize: 16,
                                                      color:
                                                          TextColor.withOpacity(
                                                              .6),
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                SizedBox(
                                                  width: width / 18,
                                                ),
                                                Text(
                                                  document["jpostlocation"],
                                                  style: GoogleFonts.sofiaSans(
                                                      fontSize: 16,
                                                      color:
                                                          TextColor.withOpacity(
                                                              .6),
                                                      fontWeight:
                                                          FontWeight.w800),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: height / 75.4,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  "Minimum Exp",
                                                  style: GoogleFonts.sofiaSans(
                                                      fontSize: 16,
                                                      color:
                                                          TextColor.withOpacity(
                                                              .6),
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                SizedBox(
                                                  width: width / 16.36,
                                                ),
                                                Text(
                                                  ":",
                                                  style: GoogleFonts.sofiaSans(
                                                      fontSize: 16,
                                                      color:
                                                          TextColor.withOpacity(
                                                              .6),
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                SizedBox(
                                                  width: width / 18,
                                                ),
                                                Text(
                                                  document["exp"],
                                                  style: GoogleFonts.sofiaSans(
                                                      fontSize: 16,
                                                      color:
                                                          TextColor.withOpacity(
                                                              .6),
                                                      fontWeight:
                                                          FontWeight.w800),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: height / 75.4,
                                            ),
                                            // Text(description),
                                            SizedBox(
                                              height: height / 75.4,
                                            ),
                                            document["jpostimageurl"] != ""
                                                ? InkWell(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PhotoPage3()));
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  height / 37.7,
                                                              vertical:
                                                                  width / 18),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        child: Container(
                                                          width: width / 1.12,
                                                          child: Image.network(
                                                            document[
                                                                "jpostimageurl"],
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : SizedBox(),
                                            SizedBox(
                                              height: height / 37.7,
                                            ),
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
                                                  text: document["likes"]
                                                          .contains(uid)
                                                      ? " You and ${document["likes"].length - 1} others liked"
                                                      : " ${document["likes"].length} others liked",
                                                  style: GoogleFonts.lato(
                                                    color: TextColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: height / 37.7,
                                              width: width / 1.12,
                                              child: Divider(
                                                color:
                                                    TextColor.withOpacity(.1),
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
                                                    print("data");
                                                    if (document["likes"]
                                                        .contains(uid)) {
                                                      FirebaseFirestore.instance
                                                          .collection("Post")
                                                          .doc(document.id)
                                                          .update({
                                                        "likes": FieldValue
                                                            .arrayRemove([uid])
                                                      });
                                                    } else {
                                                      FirebaseFirestore.instance
                                                          .collection("Post")
                                                          .doc(document.id)
                                                          .update({
                                                        "likes": FieldValue
                                                            .arrayUnion([uid])
                                                      });
                                                    }
                                                    _controller2[index]
                                                        .reverse()
                                                        .then((value) =>
                                                            _controller2[index]
                                                                .forward());
                                                  },
                                                  child: Row(
                                                    children: [
                                                      ScaleTransition(
                                                        scale: Tween(
                                                                begin: 0.7,
                                                                end: 1.0)
                                                            .animate(
                                                                CurvedAnimation(
                                                          parent: _controller2[
                                                              index],
                                                          curve: Curves.easeOut,
                                                        )),
                                                        child: document["likes"]
                                                                .contains(uid)
                                                            ? Icon(
                                                                Icons.thumb_up,
                                                                size: 20,
                                                                color:
                                                                    Colors.blue,
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .thumb_up_alt_outlined,
                                                                size: 20,
                                                              ),
                                                      ),
                                                      KText(
                                                        style: GoogleFonts.lato(
                                                          color:
                                                              Color(0xff262626),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                    Share.share(
                                                        document["jposttitle"],
                                                        subject: document[
                                                            "jposttitle"]);
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
                                                          color:
                                                              Color(0xff262626),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        text: "Share",
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),

                                            SizedBox(
                                              width: width / 1.02,
                                              child: Divider(
                                                color:
                                                    TextColor.withOpacity(.1),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
