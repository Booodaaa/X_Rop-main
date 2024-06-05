// ignore_for_file: camel_case_types, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controller/home_controller.dart';

// import '../widgets/app_colors.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Get.put(HomeController());
    // Get.lazyPut(() => HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<HomeController>(
      builder: (controller) => controller.thingsModel != null
          ? ListView.builder(
              itemCount: controller.thingsModel!.data!.length,
              itemBuilder: (context, nm) {
                return Container(
                  margin: const EdgeInsets.only(
                      top: 0, left: 0, right: 0, bottom: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 180,
                        width: double.infinity,
                        child: Stack(alignment: Alignment.topCenter, children: [
                          Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey[200],
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        bottomRight: Radius.circular(50))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${controller.thingsModel!.data![nm].title}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            x = controller
                                                .thingsModel!.data![nm].gps;
                                            _launchUrl();
                                          });
                                        },
                                        child:
                                            Icon(Icons.location_on_outlined)),
                                  ],
                                ),
                              )),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 50),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.brown[100]!, blurRadius: 15)
                                ],
                                borderRadius: BorderRadius.circular(250),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(250),
                                child: Image.network(
                                  "${controller.thingsModel!.data![nm].imagePath}",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                );
              })
          : const Center(
              child: CircularProgressIndicator(),
            ),
    ));
  }
}

var x;
final Uri _url = Uri.parse(x);
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
