// import 'package:get/get.dart';
// import 'package:weather_app/core/status_request.dart';
// import 'package:weather_app/data/test_data.dart';

// import '../function/handling_data.dart';

// class TestController extends GetxController {
//   TestData testData = TestData(Get.find());

//   List data = [];

//   late StatusRequest statusRequest;

//   getData() async {
//     statusRequest = StatusRequest.loading;
//     var response = await testData.getData();
//     print(response);
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       data.addAll(response['data']);
//     }
//     update();
//   }

//   @override
//   void onInit() {
//     getData();
//     super.onInit();
//   }
// }
