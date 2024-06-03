// ignore_for_file: camel_case_types, avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';
// import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
// import 'package:http/http.dart';
import '../model/home_model.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // getdate();
    getData2();
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

  getData2() async {
    // var tempUrl = url;
    // Uri uri = Uri.parse(tempUrl);

    var res;
    try {
      http.Response response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 60));
      print(response.statusCode);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        thingsModel = things_model.fromJson(data);

        print(thingsModel!.data![0].title);
        update();
      }
      if (response.statusCode != 200) {
        res = {
          "success": false,
          "status": response.statusCode,
          "message": _returnResponse(response)
        };
      } else {
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException catch (e) {
      res = {
        "success": false,
        "status": res.statusCode,
        "message": "Connection timeout"
      };
    } on Error catch (e) {
      print('Error: $e');
    }

    return res;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
