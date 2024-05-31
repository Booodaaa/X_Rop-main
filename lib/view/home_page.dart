// ignore_for_file: camel_case_types, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/home_controller.dart';
import '../widgets/app_colors.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Get.put(HomeController());

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
                      top: 10, left: 20, right: 20, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.tabBarViewColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          offset: const Offset(0, 0),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            width: 90,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.network(
                                "${controller.thingsModel!.data![nm].imagePath}"),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              Text(
                                "${controller.thingsModel!.data![nm].id}",
                              ),
                              InkWell(
                                onTap:() {
                                  setState(() {
                                    x =controller.thingsModel!.data![nm].gps;
                                    _launchUrl();
                                  });
                                }, 
                                child:Icon(Icons.location_on_outlined)
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
          : const Center(
              child: CircularProgressIndicator(),
            ),
    ));
  }
}
 var  x;
final Uri  _url = Uri.parse(x);
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}