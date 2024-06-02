import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth/forget_password_controller.dart';
import '../function/valed_input.dart';
import '../widgets/auth.dart';
import '../widgets/auth_button.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  // final _firstNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // image
                // Image.asset(
                //   "images/logo.png",
                //   height: 150,
                // ),
                const SizedBox(
                  height: 20,
                ),
                //title
                const Text(
                  "Forget Password",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(
                  height: 50,
                ),
                // // Email Text Field
                Auth(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 5, 100, "email");
                  },
                  label: "Email",
                  showText: false,
                  iconData: Icons.email_outlined,
                  controller: controller.email,
                ),

                const SizedBox(
                  height: 25,
                ),

                AuthButton(
                  ButtonText: "Check",
                  onTap: () {
                    controller.goToVerfiyCode();
                  },
                ),

                const SizedBox(
                  height: 25,
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text("Already Have An Acc..? "),
                //     GestureDetector(
                //       onTap: () {
                //         // controller.goToLogInPage();
                //       },
                //       child: const Text(
                //         "LogIn",
                //         style: TextStyle(
                //             color: Colors.black, fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
