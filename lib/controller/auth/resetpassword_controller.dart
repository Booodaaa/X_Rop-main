import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/login.dart';
abstract class ResetPasswordController extends GetxController {
  ressetPassword();
  gotoLogInPage();  
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;

  @override
  ressetPassword() {}

  @override
  gotoLogInPage() {
    Get.off(LogInPage());
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
