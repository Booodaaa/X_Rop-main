import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Not Valid User Name";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not Valid Email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not Valid Phone Number";
    }
  }
  // if (type == "password") {
  //   if (!GetUtils.is(val)) {
  //     return "Not Valid password";
  //   }}

  if (val.length > max) {
    return "The Value Can Not Be Larger Than $max";
  }
  if (val.isEmpty) {
    return "Cannot Be Empty";
  }
}
