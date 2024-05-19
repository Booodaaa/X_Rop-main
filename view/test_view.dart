// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:weather_app/controller/test_controller.dart';
// import 'package:weather_app/core/status_request.dart';

// class TestView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Get.put(TestController());
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("data"),
//         ),
//         body: GetBuilder<TestController>(
//           builder: ((controller) {
//             if (controller.statusRequest == StatusRequest.loading) {
//               return Center(child: Text("Loading"));
//             } else if (controller.statusRequest ==
//                 StatusRequest.offlinefailur) {
//               return Center(child: Text("Offline Failur"));
//             } else if (controller.statusRequest == StatusRequest.serverfailur) {
//               return Center(child: Text("Server Failur"));
//             } else {
//               return ListView.builder(
//                   itemCount: controller.data.length,
//                   itemBuilder: ((context, index) {
//                     return Text("${controller.data}");
//                   }));
//             }
//           }),
//         ));
//   }
// }
