import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/home_page.dart';

// import 'bindings/initial_binding.dart';
import 'view/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialBinding: InitialBingings(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
