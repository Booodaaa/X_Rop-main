import 'package:flutter/material.dart';

import '../widgets/acount_widget.dart';
import '../widgets/app_colors.dart';
import '../widgets/app_icon.dart';
import '../widgets/big_text.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        title: BigText(text: "Profile", size: 24, color: Colors.white),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: 75,
              size: 150,
            ),
            SizedBox(height: 30),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                      bigText: BigText(
                        text: "Abdelrahman Ashraf",
                      )),
                  SizedBox(height: 20),
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        backgroundColor: Colors.yellow,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                      bigText: BigText(
                        text: "01159443692",
                      )),
                  SizedBox(height: 20),
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.email,
                        backgroundColor: Colors.yellow,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                      bigText: BigText(
                        text: "Abdelrahman@gmail.com",
                      )),
                  // SizedBox(height: 20),
                  // AccountWidget(
                  //     appIcon: AppIcon(
                  //       icon: Icons.location_on,
                  //       backgroundColor: Colors.yellow,
                  //       iconColor: Colors.white,
                  //       iconSize: 25,
                  //       size: 50,
                  //     ),
                  //     bigText: BigText(
                  //       text: "Add Your Location",
                  //     )),
                  // SizedBox(height: 20),
                  // AccountWidget(
                  //     appIcon: AppIcon(
                  //       icon: Icons.favorite,
                  //       backgroundColor: Colors.redAccent,
                  //       iconColor: Colors.white,
                  //       iconSize: 25,
                  //       size: 50,
                  //     ),
                  //     bigText: BigText(
                  //       text: "Your Favorite Cars",
                  //     )),
                  // SizedBox(height: 20),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
