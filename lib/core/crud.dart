// import 'dart:convert';

// import 'package:dartz/dartz.dart';
// import 'package:weather_app/function/check_internet.dart';
// import 'status_request.dart';
// import 'package:http/http.dart' as http;

// class Crud {
//   Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
//     try {
//       if (await checkInternet()) {
//         var response = await http.post(Uri.parse(linkurl), body: data);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map responsebody = jsonDecode(response.body);
//           print(responsebody);
//           return Right(responsebody);
//         } else {
//           return Left(StatusRequest.serverfailur);
//         }
//       } else {
//         return Left(StatusRequest.offlinefailur);
//       }
//     } catch (_) {
//       return Left(StatusRequest.serverfailur);
//     }
//   }
// }
