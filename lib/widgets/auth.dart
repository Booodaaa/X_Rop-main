// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Auth extends StatelessWidget {
  final String label;
  bool showText = false;
  final IconData? iconData;
  final TextEditingController? controller;
  final String? Function(String?) valid;
  final bool isNumber;
  final void Function()? onTapIcon;
  Auth({
    Key? key,
    this.onTapIcon,
    required this.label,
    required this.showText,
    required this.iconData,
    required this.controller,
    required this.valid,
    required this.isNumber,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            keyboardType: isNumber
                ? TextInputType.numberWithOptions(decimal: true)
                : TextInputType.text,
            validator: valid,
            obscureText: showText,
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: onTapIcon,
                child: Icon(iconData),
              ),
              border: InputBorder.none,
              label: Text(label),
            ),
          ),
        ),
      ),
    );
  }
}
