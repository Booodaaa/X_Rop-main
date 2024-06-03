import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/view/chose_page.dart';
import 'package:weather_app/view/login.dart';
import '../../utils/api_endpoints.dart';
// import '../../view/home_page.dart';
import 'package:http/http.dart' as http;

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
      // Get.off(VerfiyCodeHomePage());
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

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.registerEmail);
      Map body = {
        'name': name.text,
        'email': email.text.trim(),
        'password': password.text,
        'phone': phone.text,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          print(token);
          final SharedPreferences? prefs = await _prefs;

          await prefs?.setString('token', token);
          name.clear();
          email.clear();
          password.clear();
          phone.clear();
          Get.off(ChoosePage());
        } else {
          throw jsonDecode(response.body)["message"] ??
              "Unknown Error Occurred";
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error ";
        // ignore: dead_code
        log(response.body);
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
