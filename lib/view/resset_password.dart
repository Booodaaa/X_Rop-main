import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth/resetpassword_controller.dart';
import '../function/valed_input.dart';
import '../widgets/auth.dart';
import '../widgets/auth_button.dart';

class RessetPasswordPage extends StatelessWidget {
  RessetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Form(
        // key: controller.formState,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Resset Password",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Auth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 8, 30, "password");
                    },
                    label: "New Password",
                    showText: true,
                    controller: controller.password,
                    iconData: Icons.lock_outline,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Auth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 8, 30, "password");
                    },
                    label: "Confirm New Password",
                    showText: true,
                    controller: controller.rePassword,
                    iconData: Icons.lock_outline,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthButton(
                    ButtonText: "Confirme",
                    onTap: () {
                      controller.gotoLogInPage();
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
