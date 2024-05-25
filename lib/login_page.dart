import 'package:alumini_management/verify.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phonenumber = " ";
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: width / 5.53,
            ),
            child: SizedBox(
              width: width / 1.56,
              child: Image.asset("assets/Rectangle 4 (2).png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 12, top: height / 25.13),
            child: SizedBox(
              height: height / 8.37,
              child: Image.asset("assets/Group (18).png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 1.38, top: height / 7.54),
            child: SizedBox(
              height: height / 9.42,
              child: Image.asset("assets/Group (17).png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 3.6, top: height / 15.08),
            child: SizedBox(
              width: width / 2.4,
              child: Image.asset("assets/Group 3.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 3.27),
            child: SizedBox(
              height: height / 9.42,
              child: Image.asset("assets/Ellipse 15 (1).png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: width / 1.12,
            ),
            child: SizedBox(
              height: height / 4.18,
              child: Image.asset("assets/Ellipse 13.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 1.09, top: height / 3.14),
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Color(0xffEE516D),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 1.2, top: height / 4.43),
            child: CircleAvatar(
              radius: 13,
              backgroundColor: Color(0xff4DC591),
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
            padding: EdgeInsets.only(left: width / 18, top: height / 4.43),
            child: CircleAvatar(
              radius: 13,
              backgroundColor: Color(0xff65A4DA),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 1.44, top: height / 3.14),
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Color(0xffB9DEF3),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 2.69, left: width / 36),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height / 15.08,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width / 7.5),
                    child: Text(
                      "Log in to your account",
                      style: GoogleFonts.openSans(
                          color: Color(0xff006BA6),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width / 72),
                    child: Text(
                      "Kindly enter your login details",
                      style: GoogleFonts.openSans(
                          color: Color(0xff262626).withOpacity(.3),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width / 18),
                    child: SizedBox(
                      width: width / 1.2,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 25.13,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width / 1.8),
                    child: Text(
                      "Full Name",
                      style: GoogleFonts.sofiaSans(
                        color: Color(0xff262626),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width / 18, top: height / 75.4),
                    child: Container(
                      width: width / 1.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all()),
                      child: TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your name',
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.message_outlined,
                                color: Color(0xff262626).withOpacity(.3),
                              ),
                            ),
                            hintStyle: GoogleFonts.sofiaSans(
                                color: Color(0xff262626).withOpacity(.3))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width / 2.11),
                    child: Text(
                      "Phone Number",
                      style: GoogleFonts.sofiaSans(
                        color: Color(0xff262626),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width / 18, top: height / 75.4),
                    child: Container(
                      width: width / 1.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all()),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your phone number',
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.phone,
                                color: Color(0xff262626).withOpacity(.3),
                              ),
                            ),
                            hintStyle: GoogleFonts.sofiaSans(
                                color: Color(0xff262626).withOpacity(.3))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter  phone number';
                          }
                          return null;
                        },
                        onChanged: (phone) {
                          print(phone);
                          setState(() {
                            phonenumber = phone;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width / 18, top: height / 18.85),
                    child: InkWell(
                      onTap: () {
                        _getUser();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => VerifyOtp(phonenumber,Str,name.text)));
                      },
                      child: Container(
                        height: height / 18.85,
                        width: width / 1.2,
                        decoration: BoxDecoration(
                            color: Color(0xff006BA6),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            "Log in",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sofiaSans(
                              fontSize: 20,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String Str = "";
  bool isvalid = false;

  _getUser() async {
    var document = await FirebaseFirestore.instance.collection("Users").get();

    for (int i = 0; i < document.docs.length; i++) {
      print( document.docs[i]['Phone']);
      if (phonenumber == document.docs[i]['Phone']) {
        print( "success");
        isvalid = true;
        Str = document.docs[i].id;
      }
    }
    if (isvalid == false) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Invalid Users"),
      ));
    } else {
      print(Str);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => VerifyOtp(phonenumber, name.text, Str,)));
    }
  }
}
