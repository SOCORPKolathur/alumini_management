import 'package:flutter/material.dart';

import 'constant.dart';

class PhotoPage2 extends StatefulWidget {
  const PhotoPage2({super.key});

  @override
  State<PhotoPage2> createState() => _PhotoPage2State();
}

class _PhotoPage2State extends State<PhotoPage2> {
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
                Container(width: 340, child: Image.asset("assets/image 27.png")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
