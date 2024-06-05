import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "Exit!",
      middleText: "Do You Want Close App ?",
      radius: 20,
      actions: [
        ElevatedButton(
          onPressed: () {
            exit(0);
          },
          child: Text("Confirm"),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Cancel"),
        ),
      ]);
  return Future.value(false);
}
