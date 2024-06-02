import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/function/valed_input.dart';
import 'package:weather_app/view/chose_page.dart';
import '../controller/auth/Signup_controller.dart';
import '../widgets/auth.dart';
import '../widgets/auth_button.dart';
import 'home_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControllerImp());
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: GetBuilder<SignUpControllerImp>(
          builder: (controller) => Form(
            key: controller.formState,
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      //title
                      const Text(
                        "SignUp",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(
                        height: 50,
                      ),

                      // Name Text field
                      Auth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 5, 20, "username");
                        },
                        label: "Name",
                        showText: false,
                        iconData: Icons.person_2_outlined,
                        controller: controller.name,
                      ),
                      const SizedBox(
                        height: 10,
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
                        height: 10,
                      ),

                      //PassWord
                      Auth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 8, 20, "password");
                        },
                        label: "Password",
                        showText: controller.isShowPassword,
                        iconData: Icons.remove_red_eye,
                        controller: controller.password,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      // Phone Number
                      Auth(
                        isNumber: true,
                        valid: (val) {
                          return validInput(val!, 5, 20, "phone");
                        },
                        label: "Phone",
                        showText: false,
                        iconData: Icons.phone_outlined,
                        controller: controller.phone,
                      ),

                      const SizedBox(
                        height: 25,
                      ),

                      AuthButton(
                        ButtonText: "Sign Up",
                        onTap: () {
                          controller.signUp();
                          // controller.registerWithEmail();
                        },
                        onDoubleTap: () => Get.off(ChoosePage()),
                      ),

                      const SizedBox(
                        height: 25,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already Have An Acc..? "),
                          GestureDetector(
                            onTap: () {
                              controller.goToLogInPage();
                            },
                            child: const Text(
                              "LogIn",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
