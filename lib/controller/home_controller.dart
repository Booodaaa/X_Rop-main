// ignore_for_file: camel_case_types, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../model/home_model.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getdate();
  }

  things_model? thingsModel;
  String url = "https://api-x-robot.future-developers.cloud/api/things/all";
  getdate() async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    thingsModel = things_model.fromJson(data);

    print(thingsModel!.data![0].title);
    update();
  }
}
