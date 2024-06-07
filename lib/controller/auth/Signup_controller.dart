// import 'dart:convert';
// import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/controller/auth/server_get.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/model/signupmodel.dart';
import 'package:weather_app/view/chose_page.dart';
import 'package:weather_app/view/login.dart';
// import 'package:weather_app/view/verify_code_homepage.dart';
// import '../../utils/api_endpoints.dart';
// import '../../view/home_page.dart';
// import 'package:http/http.dart' as http;

class SignUpControllerImp extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController name;
  bool isShowPassword = true;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  signUp() {
    if (formState.currentState!.validate()) {
      //  Get.off(chosepage());
      registerWithEmail();
    } else {
      print("Not Valid");
    }

    // var formData = formState.currentState;
    // if (formData!.validate()) {
    //   print("valid");
    // } else {
    //   print("Not Valid");
    // }
  }

  goToLogInPage() {
    Get.off(LogInPage());
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    name = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    name.dispose();
    super.dispose();
  }

  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try {
      ServerGate serverGeat = ServerGate();
      CustomResponse response =
          await serverGeat.sendToServer(url: "auth/register", body: {
        'name': name.text,
        'email': email.text.trim(),
        'password': password.text,
        'phone': phone.text,
      });

      if (response.statusCode == 200) {
        Signupmodel model = Signupmodel.fromJson(response.response!.data);

        Get.off(ChoosePage());
        preferences.setString("token", model.authorisation!.token!);
      } else {
        throw (response.response!.data)["Message"] ?? "Unknown Error ";
        // ignore: dead_code
        // log(response.body);
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Alert'),
              alignment: Alignment.center,
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
    // Get.off(HomePage());
  }
}
