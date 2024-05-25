import 'package:alumini_management/bottom_nav_bar.dart';
import 'package:alumini_management/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterotpfield/flutterotpfield.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyOtp extends StatefulWidget {
  String phonenumber;
  String Str;
  String name;
  VerifyOtp(this.phonenumber, this.name, this.Str);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  String? docid;
  sendOTP() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91${widget.phonenumber}",
      verificationCompleted: (PhoneAuthCredential credential) {
        print("Verification Complete");
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          verificationid = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }

  String otp = "";
  var verificationid;

  @override
  void initState() {
    sendOTP();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
              padding: EdgeInsets.only(left: width / 2.4, top: height / 25.13),
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
              padding: EdgeInsets.only(left: width / 3.78, top: height / 15.08),
              child: SizedBox(
                width: width / 2.25,
                child: Image.asset("assets/Group 3 (1).png"),
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
              padding: EdgeInsets.only(left: width / 10.28, top: height / 4.43),
              child: CircleAvatar(
                radius: 13,
                backgroundColor: Color(0xff65A4DA),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 1.41, top: height / 3.14),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Color(0xffB9DEF3),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 2.15, right: width / 36),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Text(
                      "Verifiy Mobile Number",
                      style: GoogleFonts.openSans(
                          color: Color(0xff006BA6),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width / 36),
                    child: Text(
                      "We have you sent to SMS with 6 digit\nverification code (OTP) on",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          color: Color(0xff262626).withOpacity(.3),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "${widget.phonenumber}",
                    style: GoogleFonts.openSans(
                        color: Color(0xff262626),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height / 15.08,
                  ),
                  FlutterOtpField(
                    inputFieldLength: 6,
                    spaceBetweenFields: 5,
                    inputDecoration: InputDecoration(
                        constraints: const BoxConstraints(maxHeight: 20),
                        fillColor: Colors.transparent,
                        filled: true,
                        hintText: " ",
                        counterText: "",
                        hintStyle: GoogleFonts.openSans(
                            color: Color(0xff656565),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xff006BA6), width: 2.0),
                            borderRadius: BorderRadius.circular(30)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xff006BA6), width: 2.0),
                            borderRadius: BorderRadius.circular(30))),
                    onValueChange: (String value) {
                      print("otp changed $value");
                    },
                    onCompleted: (String value) {
                      setState(() {
                        otp = value;
                      });
                      print("otp  $value");
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width / 18, top: height / 37.7),
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //     builder: (context) => HomePage()));
                        veryotp();
                      },
                      child: Container(
                        height: height / 18.85,
                        width: width / 1.2,
                        decoration: BoxDecoration(
                            color: Color(0xff006BA6),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.only(top: height / 94.25),
                          child: Text(
                            "Verify Code",
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
                  SizedBox(
                    height: height / 37.7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t receive code?",
                        style: GoogleFonts.sofiaSans(
                          fontSize: 12,
                          color: Color(0xff000000),
                        ),
                      ),
                      Text(
                        " Resend OTP",
                        style: GoogleFonts.sofiaSans(
                          fontSize: 12,
                          color: Color(0xff006BA6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  veryotp() {
    FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
            verificationId: verificationid, smsCode: otp))
        .then((value) {
      if (value.user != null) {
        print(FirebaseAuth.instance.currentUser!.uid);
        FirebaseFirestore.instance
            .collection("Users")
            .doc(widget.Str)
            .update({
          "userDocId": FirebaseAuth.instance.currentUser!.uid,
        });
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => Example()));
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Example()),
          (Route<dynamic> route) => false,
        );
      }
    });
  }
}
