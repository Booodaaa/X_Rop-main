import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/chose_page.dart';
// import 'package:weather_app/view/signup.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialBinding: InitialBingings(),com      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChoosePage(), 
    );
  }
}
