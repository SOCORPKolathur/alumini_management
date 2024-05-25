import 'package:alumini_management/constant.dart';
import 'package:alumini_management/home_page.dart';
import 'package:alumini_management/message.dart';
import 'package:alumini_management/nearby.dart';
import 'package:alumini_management/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   HomePage(),
  //   ConnectPage(),
  //   MessageScreen(),
  //   ProfilePage(),
  // ];
  late final PageController pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: _selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 20,
      //   title: const Text('GoogleNavBar'),
      // ),
      body: PageView(
        controller: pageController,
        onPageChanged: (val) {
          setState(() {
            _selectedIndex = val;
          });
        },
        children: [
          // Center(
          //   child: _widgetOptions.elementAt(_selectedIndex),
          // ),
          HomePage(),
          ConnectPage(),
          MessageScreen(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              // rippleColor:primaryColor,
              // hoverColor: primaryColor,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 20,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: primaryColor,
              color: Colors.black,

              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.location_on,
                  text: 'Near by',
                ),
                GButton(
                  icon: Icons.message_rounded,
                  text: 'Message',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,

              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                  pageController.animateToPage(_selectedIndex,
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeIn);
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
