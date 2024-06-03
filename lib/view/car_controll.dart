
import 'package:flutter/material.dart';
// import 'package:control_pad_plus/control_pad_plus.dart';
class CarControllPage extends StatefulWidget {
  @override
  State<CarControllPage> createState() => _CarControllPageState();
}

class _CarControllPageState extends State<CarControllPage> {
  var leftDirectio = 0;
  var rightDirectio = 0;
  var forwardDirectio = 0;
  var backDirectio = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              color: Colors.grey[300],
              //child: JoystickView(),
              // Column(
              //   children: [
              //     const SizedBox(
              //       height: 50,
              //     ),
              //     Row(
              //       children: [
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         Container(
              //           width: 100,
              //           height: 100,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(100),
              //               gradient: const LinearGradient(
              //                   begin: Alignment.bottomRight,
              //                   end: Alignment.topLeft,
              //                   colors: [
              //                     AppColors.color1,
              //                     AppColors.color2,
              //                   ])),
              //           child: IconButton(
              //               onPressed: () {
              //                 rightDirectio = 1;
              //                 log(rightDirectio.toString());
              //               },
              //               icon: const Icon(
              //                 CupertinoIcons.arrow_up,
              //                 color: Colors.white,
              //               )),
              //         ),
              //       ],
              //     ),
              //     const SizedBox(
              //       height: 15,
              //     ),
              //     Row(
              //       children: [
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         Container(
              //           width: 100,
              //           height: 100,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(100),
              //               gradient: const LinearGradient(
              //                   begin: Alignment.bottomRight,
              //                   end: Alignment.topLeft,
              //                   colors: [
              //                     AppColors.color1,
              //                     AppColors.color2,
              //                   ])),
              //           child: IconButton(
              //               onPressed: () {
              //                 log(rightDirectio.toString());
              //               },
              //               icon: const Icon(
              //                 CupertinoIcons.arrow_down,
              //                 color: Colors.white,
              //               )),
              //         ),
              //       ],
              //     ),
              //     const Spacer(),
              //     Row(
              //       children: [
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         Container(
              //           width: 100,
              //           height: 100,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(100),
              //               gradient: const LinearGradient(
              //                   begin: Alignment.bottomRight,
              //                   end: Alignment.topLeft,
              //                   colors: [
              //                     AppColors.color1,
              //                     AppColors.color2,
              //                   ])),
              //           child: IconButton(
              //               onPressed: () {},
              //               icon: const Icon(
              //                 Icons.keyboard_arrow_right_outlined,
              //                 color: Colors.white,
              //               )),
              //         ),
              //       ],
              //     ),
              //     const SizedBox(
              //       height: 15,
              //     ),
              //     Row(
              //       children: [
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         Container(
              //           width: 100,
              //           height: 100,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(100),
              //               gradient: const LinearGradient(
              //                   begin: Alignment.bottomRight,
              //                   end: Alignment.topLeft,
              //                   colors: [
              //                     AppColors.color1,
              //                     AppColors.color2,
              //                   ])),
              //           child: IconButton(
              //               onPressed: () {},
              //               icon: const Icon(
              //                 Icons.keyboard_arrow_left_outlined,
              //                 color: Colors.white,
              //               )),
              //         ),
              //       ],
              //     ),
              //     const SizedBox(
              //       height: 50,
              //     )
              //   ],
              // ),
            ),
          )
        ],
      ),
    );
  }
}
