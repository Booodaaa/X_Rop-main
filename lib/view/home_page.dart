// ignore_for_file: camel_case_types, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
// import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GetBuilder<HomeController>(
          builder: (controller) =>
          controller.thingsModel != null ?
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 1.5,
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            itemCount: controller.thingsModel!.data!.length,
            itemBuilder: (context, nm) => InkWell(
              child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(250),
                            child: Image.network(
                              "${controller.thingsModel!.data![nm].imagePath}",
                              fit: BoxFit.cover,
                              height: 100,
                            )),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Text(
                              "${controller.thingsModel!.data![nm].title}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          )
              :const Center(child: CircularProgressIndicator(),),

        ));
  }
}
