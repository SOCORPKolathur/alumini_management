import 'package:alumini_management/job_post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'constant.dart';
import 'dart:io';

class AddJobPost extends StatefulWidget {
  const AddJobPost({super.key});

  @override
  State<AddJobPost> createState() => _AddJobPostState();
}

class _AddJobPostState extends State<AddJobPost> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdocId();
  }

  String? uid;
  getdocId() async {
    var user = await FirebaseFirestore.instance.collection("Users").get();
    for (int i = 0; i < user.docs.length; i++) {
      if (user.docs[i]["userDocId"] == FirebaseAuth.instance.currentUser!.uid) {
        setState(() {
          uid = user.docs[i].id;
        });
      }
    }
  }

  TextEditingController title = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController minimumExp = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController description = TextEditingController();

  File? _image;
  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

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
          "Add Job Posts",
          style: GoogleFonts.sofiaSans(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30),
                  child: Container(
                    width: 300,
                    height: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColor.withOpacity(.4)),
                    child: _image == null
                        ? Text('No image selected.')
                        : Image.file(_image!),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 300, top: 20),
                  child: InkWell(
                      onTap: () {
                        _getImage();
                      },
                      child: Icon(
                        Icons.add_a_photo,
                        color: primaryColor,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: height / 25.13,
            ),
            Padding(
              padding: EdgeInsets.only(right: 230),
              child: Text(
                "Title",
                style: GoogleFonts.sofiaSans(
                  color: TextColor.withOpacity(.6),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 12, top: height / 75.4),
              child: Container(
                width: width / 1.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all()),
                child: TextField(
                  controller: title,
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
                "Positions",
                style: GoogleFonts.sofiaSans(
                  color: TextColor.withOpacity(.6),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 12, top: height / 75.4),
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
            Padding(
              padding: EdgeInsets.only(right: width / 1.8),
              child: Text(
                "Company",
                style: GoogleFonts.sofiaSans(
                  color: TextColor.withOpacity(.6),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 12, top: height / 75.4),
              child: Container(
                width: width / 1.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all()),
                child: TextField(
                  controller: company,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter the Company',
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
            Padding(
              padding: EdgeInsets.only(right: 120, top: height / 75.4),
              child: Text(
                "Minimum Expirience",
                style: GoogleFonts.sofiaSans(
                  color: TextColor.withOpacity(.6),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 12, top: height / 75.4),
              child: Container(
                width: width / 1.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all()),
                child: TextField(
                  controller: minimumExp,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter the Minimum Expirience',
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
              padding: EdgeInsets.only(right: width / 2.11),
              child: Text(
                "Qualification ",
                style: GoogleFonts.sofiaSans(
                  color: TextColor.withOpacity(.6),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 12, top: height / 75.4),
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
              padding: EdgeInsets.only(right: width / 1.8),
              child: Text(
                "Location",
                style: GoogleFonts.sofiaSans(
                  color: TextColor.withOpacity(.6),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 12, top: height / 75.4),
              child: Container(
                width: width / 1.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all()),
                child: TextField(
                  controller: location,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter job location',
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.location_on,
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
              padding: EdgeInsets.only(right: width / 2),
              child: Text(
                "Description",
                style: GoogleFonts.sofiaSans(
                  color: TextColor.withOpacity(.6),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 12, top: height / 75.4),
              child: Container(
                width: width / 1.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all()),
                child: TextField(
                  maxLines: 4,
                  controller: description,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your description',
                      contentPadding: EdgeInsets.only(top: height / 37.7),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Padding(
                          padding: EdgeInsets.only(bottom: height / 15.08),
                          child: Icon(
                            Icons.description_outlined,
                            color: TextColor.withOpacity(.3),
                          ),
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
            Padding(
              padding: EdgeInsets.only(left: width / 14.4),
              child: InkWell(
                onTap: () {
                  _addToCart(context);
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
                      "Submit",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sofiaSans(
                          fontSize: 20,
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 25.13,
            ),
          ],
        ),
      ),
    );
  }

  Future<String> _uploadImageToFirebaseStorage(File imageFile) async {
    final firebase_storage.Reference ref = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().toString()}');
    final firebase_storage.UploadTask uploadTask = ref.putFile(imageFile);
    final firebase_storage.TaskSnapshot downloadTask = await uploadTask;
    final String imageUrl = await downloadTask.ref.getDownloadURL();
    print('Image uploaded to Firebase Storage: $imageUrl');
    return imageUrl; // Return the download URL of the uploaded image
  }

  void _addToCart(BuildContext context) async {
    try {
      // Upload the image to Firebase Storage and get the download URL
      String imageUrl = await _uploadImageToFirebaseStorage(_image!);

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .collection('AddJobPost')
          .add({
        'name': title.text,
        'phone': phonenumber.text,
        'qualification': qualification.text,
        'location': location.text,
        'description': description.text,
        "image": imageUrl,
        "company":company.text,
        "minimumExp":minimumExp.text,
        'timestamp': Timestamp.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Job post added successfully')),
      );
      Navigator.of(context).pop();
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding job post: $error')),
      );
    }
  }
}
