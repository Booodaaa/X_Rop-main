// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'app_colors.dart';

// ignore: must_be_immutable
class AuthButton extends StatelessWidget {
  String ButtonText;
  final void Function()? onTap;
  final void Function()? onDoubleTap;
  AuthButton({
    Key? key,
    required this.ButtonText,
    this.onTap, this.onDoubleTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GestureDetector(
        onDoubleTap: onDoubleTap,
        onTap: onTap,
        child: Container(
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
              borderRadius: BorderRadius.circular(12)),
          child: Center(
              child: Text(
            ButtonText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          )),
        ),
      ),
    );
  }
}
