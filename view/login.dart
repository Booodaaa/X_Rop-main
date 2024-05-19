import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/home_page.dart';
import '../controller/auth/login_controller.dart';
import '../function/alert_exit.dart';
import '../function/valed_input.dart';
import '../widgets/auth.dart';
import '../widgets/auth_button.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LogInControllerImp controller = Get.put(LogInControllerImp());
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            alertExitApp();
          },
          child: Form(
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
                        "Login",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      // Email
                      Auth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                        label: "Email",
                        showText: false,
                        controller: controller.email,
                        iconData: Icons.email_outlined,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //PassWord
                      GetBuilder<LogInControllerImp>(
                          builder: ((controller) => Auth(
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
                              ))),
                      const SizedBox(
                        height: 15,
                      ),
                      AuthButton(
                        ButtonText: "LogIn",
                        onTap: () {
                          controller.login();
                        },
                        onDoubleTap: () => Get.off(HomePage()),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 30),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              controller.goToForgetPasswordPage();
                            },
                            child: Text(
                              "Forget Password!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Dont Have An Acc..? "),
                          GestureDetector(
                            onTap: () {
                              controller.goToSignUpPage();
                            },
                            child: const Text(
                              "SignUp",
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
