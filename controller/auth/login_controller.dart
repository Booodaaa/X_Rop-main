import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/forget_password.dart';
import 'package:weather_app/view/home_page.dart';
import 'package:weather_app/view/signup.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/api_endpoints.dart';

class LogInControllerImp extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late TextEditingController email;
  late TextEditingController password;
  bool isShowPassword = true;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  login() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      loginWithEmail();
      // Get.off(HomePage());
    } else {
      print("Not Valid");
    }
  }

  goToSignUpPage() {
    Get.off(SignUpPage());
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  goToForgetPasswordPage() {
    Get.to(ForgetPasswordPage());
  }

  Future<void> loginWithEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
      Map body = {'email': email.text.trim(), 'password': password.text};
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('token', token);
          email.clear();
          password.clear();
        } else if (json['code'] == 1) {
          throw jsonDecode(response.body)["Message"];
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }
}
