import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/verfiy_code.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  goToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;

  @override
  checkEmail() {}

  @override
  goToVerfiyCode() {
    Get.off(VerfiyCodePage());
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
