import 'package:flutter/material.dart';

import 'constant.dart';

class PhotoPage3 extends StatefulWidget {
  const PhotoPage3({super.key});

  @override
  State<PhotoPage3> createState() => _PhotoPage3State();
}

class _PhotoPage3State extends State<PhotoPage3> {
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
                Container(width: 340, child: Image.asset("assets/post.png")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
