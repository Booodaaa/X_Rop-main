import 'package:get/get.dart';
import 'package:weather_app/view/home_page.dart';
import '../../view/resset_password.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToRessetPassword();
  goToHomePage();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  late String verifyCode;
  @override
  checkCode() {}

  @override
  goToRessetPassword() {
    Get.off(RessetPasswordPage());
  }

  @override
  goToHomePage() {
    Get.off(HomePage());
  }

  @override
  void onInit() {
    super.onInit();
  }
}
