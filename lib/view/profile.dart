// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../widgets/acount_widget.dart';
import '../widgets/app_colors.dart';
import '../widgets/app_icon.dart';
import '../widgets/big_text.dart';

class Profilepage extends StatelessWidget {
  late TextEditingController stutes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.color2,
                        AppColors.color1,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(100)),
                child: AppIcon(
                  icon: Icons.person,
                  backgroundColor: Colors.transparent,
                  iconColor: Colors.white,
                  iconSize: 75,
                  size: 150,
                ),
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
                          text: "XroBot",
                        )),
                   
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
