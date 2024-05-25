import 'package:alumini_management/constant.dart';
import 'package:flutter/material.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TextColor,
      body: SafeArea(
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 340, child: Image.asset("assets/slide.png")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
