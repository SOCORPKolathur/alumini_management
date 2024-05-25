import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_job_post.dart';
import 'constant.dart';

class JobPost extends StatefulWidget {
  String  uid;
  JobPost(this.uid);

  @override
  State<JobPost> createState() => _JobPostState();
}

class _JobPostState extends State<JobPost> {
  @override
  void initState() {
    getdocid();
   // getdocId();
    super.initState();
  }

  String title = '';
  String company = '';
  String location = '';
  String minmum = '';
  String description = '';

  String? userId;
  getdocid() async {
    var document = await FirebaseFirestore.instance.collection("Users").get();
    for (int i = 0; i < document.docs.length; i++) {
      if (document.docs[i]["userDocId"] ==
          FirebaseAuth.instance.currentUser!.uid) {
        setState(() {
          userId = document.docs[i].id;
        });

      }
    }
  }

  // getdocId() async {
  //   var user = await FirebaseFirestore.instance
  //       .collection("Users")
  //       .doc(widget.uid)
  //       .collection('AddJobPost')
  //       .get();
  //   for (int i = 0; i < user.docs.length; i++) {
  //     if (user.docs[i]["userDocId"] == FirebaseAuth.instance.currentUser!.uid) {
  //       setState(() {
  //         company = user.docs[i]["company"] ?? "";
  //         description = user.docs[i]["description"] ?? "";
  //         location = user.docs[i]["location"] ?? "";
  //         minmum = user.docs[i]["minimumExp"] ?? "";
  //       });
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
          "Your Job Posts",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: userId != null
          ? StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(userId) // Remove the quotation marks
            .collection('AddJobPost')
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
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var subCollectionDoc = snapshot.data!.docs[index];
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: width / 3, top: height / 37.7),
                      child: Text(
                        "Your Recent Job Posts",
                        style: GoogleFonts.sofiaSans(
                          color: Color(0xff262626),
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 155,
                      ),
                      child: Text(
                        "Flutter Developer",
                        style: GoogleFonts.sofiaSans(
                          color: Color(0xff262626),
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
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
                              color: TextColor.withOpacity(.6),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: width / 7.2,
                        ),
                        Text(
                          ":",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.6),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: width / 18,
                        ),
                        Text(subCollectionDoc["company"])
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
                              color: TextColor.withOpacity(.6),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: width / 6.54,
                        ),
                        Text(
                          ":",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.6),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: width / 18,
                        ),
                        Text(
                          subCollectionDoc["location"],
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.6),
                              fontWeight: FontWeight.w800),
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
                              color: TextColor.withOpacity(.6),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: width / 16.36,
                        ),
                        Text(
                          ":",
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.6),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: width / 18,
                        ),
                        Text(
                          subCollectionDoc["minimumExp"],
                          style: GoogleFonts.sofiaSans(
                              fontSize: 16,
                              color: TextColor.withOpacity(.6),
                              fontWeight: FontWeight.w800),
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
                    Container(
                      child: Image.asset("assets/post.png"),
                    ),
                    SizedBox(
                      height: height / 37.7,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 170,
                          child: ElevatedButton(
                            onPressed: () {},
                            // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                elevation: 12.0,
                                textStyle:
                                TextStyle(color: Colors.white)),
                            child: Text('Delete',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              elevation: 12.0,
                              textStyle: TextStyle(color: Colors.white)),
                          child: Text('View & Candidates',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width / 1.02,
                      child: Divider(
                        color: TextColor.withOpacity(.1),
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      )
          : Center(child: CircularProgressIndicator()),
      bottomNavigationBar: Container(
        height: height / 9.42,
        child: Column(
          children: [
            SizedBox(
              height: height / 75.4,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddJobPost()));
              },
              child: Container(
                height: height / 16.75,
                width: width / 1.2,
                decoration: BoxDecoration(
                    color: Color(0xff006BA6),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.only(top: height / 94.25),
                  child: Text(
                    "Add Job Post",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sofiaSans(
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
