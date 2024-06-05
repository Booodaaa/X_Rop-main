import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/view/home_page.dart';

import 'car_controll.dart';
import 'image_picker.dart';
import 'profile.dart';

class ChoosePage extends StatefulWidget {
  @override
  State<ChoosePage> createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
  int _currentIndex = 0;
  List<Widget> body = [
    HomePage(),
    CarControllPage(),
    UploadImage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              // color: Colors.black,
            ),
            backgroundColor: Colors.black87,
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.car_detailed),
            label: "Car Controll",
            // backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
