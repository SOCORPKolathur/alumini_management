import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:google_fonts/google_fonts.dart';
import 'package:open_app_file/open_app_file.dart';
import 'package:open_file/open_file.dart';
import 'package:randomstring_dart/randomstring_dart.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constant.dart';

class ApplyJob extends StatefulWidget {
  String docid;
  ApplyJob(this.docid);

  @override
  State<ApplyJob> createState() => _ApplyJobState();
}

class _ApplyJobState extends State<ApplyJob> {
  TextEditingController name = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController description = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdocid();
  }

  File? selectedfeile;


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
          "Apply For Job",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: width / 18),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: width / 36),
            child: Column(
              children: [
                SizedBox(
                  height: height / 37.7,
                ),
                SizedBox(
                  height: height / 75.4,
                ),
                Padding(
                  padding: EdgeInsets.only(right: width / 2.25),
                  child: Text(
                    "Personal Details :",
                    style: GoogleFonts.sofiaSans(
                      color: Color(0xff262626),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: width / 1.53),
                  child: Text(
                    "First Name",
                    style: GoogleFonts.sofiaSans(
                      color: TextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: width / 18, top: height / 75.4),
                  child: Container(
                    width: width / 1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all()),
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your name',
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.contact_mail_rounded,
                              color: TextColor.withOpacity(.3),
                            ),
                          ),
                          hintStyle: GoogleFonts.sofiaSans(
                              color: Color(0xff262626).withOpacity(.3))),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 75.4,
                ),
                Padding(
                  padding: EdgeInsets.only(right: width / 1.8),
                  child: Text(
                    "Phone Number",
                    style: GoogleFonts.sofiaSans(
                      color: TextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: width / 18, top: height / 75.4),
                  child: Container(
                    width: width / 1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all()),
                    child: TextField(
                      controller: phonenumber,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your phone number',
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.phone,
                              color: TextColor.withOpacity(.3),
                            ),
                          ),
                          hintStyle: GoogleFonts.sofiaSans(
                              color: Color(0xff262626).withOpacity(.3))),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 75.4,
                ),
                Padding(
                  padding: EdgeInsets.only(right: width / 1.63),
                  child: Text(
                    "Qualification ",
                    style: GoogleFonts.sofiaSans(
                      color: TextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: width / 18, top: height / 75.4),
                  child: Container(
                    width: width / 1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all()),
                    child: TextField(
                      controller: qualification,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your qualification',
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.badge,
                              color: TextColor.withOpacity(.3),
                            ),
                          ),
                          hintStyle: GoogleFonts.sofiaSans(
                              color: Color(0xff262626).withOpacity(.3))),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 75.4,
                ),
                Padding(
                  padding: EdgeInsets.only(right: width / 1.53),
                  child: Text(
                    "Description",
                    style: GoogleFonts.sofiaSans(
                      color: TextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: width / 18, top: height / 75.4),
                  child: Container(
                    width: width / 1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all()),
                    child: TextField(
                      controller: description,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your description',
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.description_outlined,
                              color: TextColor.withOpacity(.3),
                            ),
                          ),
                          hintStyle: GoogleFonts.sofiaSans(
                              color: Color(0xff262626).withOpacity(.3))),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 75.4,
                ),
                Padding(
                  padding: EdgeInsets.only(right: width / 2.25),
                  child: Text(
                    "Documents / Resume",
                    style: GoogleFonts.sofiaSans(
                      color: TextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: width / 18, top: height / 75.4),
                  child: InkWell(
                    onTap: () async{
                      final result = await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['jpg', 'pdf', 'doc'],
                      );

                      final file = result?.files.first;
                      selectedfeile = File("${file?.path}");
                      setState(() {
                      });
                    },
                    child: Container(
                      width: width / 1.2,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(30),
                      //   color: _pickimage() == null
                      //       ? primaryColor.withOpacity(.3)
                      //       : Colors.transparent,
                      //   border: Border.all(
                      //     color: _pickimage() == null
                      //         ? primaryColor
                      //         : Colors.transparent,
                      //   ),
                      // ),
                      child: Padding(
                        padding: EdgeInsets.only(left: width / 36),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () async{
                                final result = await FilePicker.platform.pickFiles(
                                  type: FileType.any,
                                  allowedExtensions: ['jpg', 'pdf', 'doc'],
                                );

                                final file = result?.files.first;
                                selectedfeile = File("${file?.path}");
                                setState(() {
                                });
                              },
                              icon: Icon(
                                Icons.cloud_download,
                                color: TextColor,
                              ),
                            ),
                            Container(
                              height: height / 7.54,
                              width: width / 2,
                              child:Text(selectedfeile== null?"Selecte a file":"${selectedfeile?.path}"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 37.7,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: width / 18, top: height / 75.4),
                  child: InkWell(
                    onTap: () {
                      _addToCart(context);
                    },
                    child: Container(
                      height: height / 16.75,
                      width: width / 1.2,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: EdgeInsets.only(top: height / 94.25),
                        child: Text(
                          "Submit",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sofiaSans(
                              fontSize: 20,
                              color: textColor,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String docid = "  ";

  getdocid() async {
    var user = await FirebaseFirestore.instance.collection("Users").get();
    for (int i = 0; i < user.docs.length; i++) {
      if (user.docs[i]["userDocId"] == FirebaseAuth.instance.currentUser!.uid) {
        setState(() {
          docid = user.docs[i].id;
        });
      }
    }
  }

  Future<String?> _uploadFileToFirebaseStorage(File? file) async {
    if (file == null) {
      print('File is null.');
      return null;
    }

    try {
      final firebase_storage.Reference ref = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('files/${DateTime.now().toString()}');
      final firebase_storage.UploadTask uploadTask = ref.putFile(file);
      final firebase_storage.TaskSnapshot downloadTask = await uploadTask;
      final String fileUrl = await downloadTask.ref.getDownloadURL();
      print('File uploaded to Firebase Storage: $fileUrl');
      return fileUrl;
    } catch (error) {
      print('Error uploading file: $error');
      return null;
    }
  }

  Future<void> _addToCart(BuildContext context) async {
    try {
      String? fileUrl = await _uploadFileToFirebaseStorage(selectedfeile);
      final rs = RandomString();
      String documentid = rs.getRandomString();

      // Add document to "JobPosts" collection
      await FirebaseFirestore.instance
          .collection("JobPosts")
          .doc(widget.docid)
          .collection('ApplyforJob')
          .doc(documentid) // Use doc() to specify a document ID, or let Firestore generate one
          .set({
        'name': name.text,
        'phone': phonenumber.text,
        'qualification': qualification.text,
        'description': description.text,
        'fileUrl': fileUrl,
        'timestamp': Timestamp.now().millisecondsSinceEpoch,
      });

      // Add document to "Post" collection
      await FirebaseFirestore.instance
          .collection("Post")
          .doc(widget.docid)
          .collection('ApplyforJob')
          .doc(documentid) // Use doc() to specify a document ID, or let Firestore generate one
          .set({
        'name': name.text,
        'phone': phonenumber.text,
        'qualification': qualification.text,
        'description': description.text,
        'fileUrl': fileUrl,
        'timestamp': Timestamp.now().millisecondsSinceEpoch,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Job application submitted successfully')),
      );

      Navigator.of(context).pop();// Go back to the previous screen after submitting application

      // Open the document if a file URL is provided
      if (fileUrl != null) {
        launch(fileUrl);
      }
    } catch (error) {
      print('Error adding product to cart: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding product to cart: $error')),
      );
    }
  }

// generateDocument() {
  //   CollectionReference collection = _firestore.collection('Post');
  //   DocumentReference docRef = collection.doc();
  //   String docId = docRef.id;
  //   // Use the generated document ID as needed
  //   print('Generated Firestore Document ID: $docId');
  // }
}
