import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Pojo/LoginResponse.dart';
import '../Routes/app_routes.dart';
import '../Utils/App_Preference.dart';
import '../api/api_connect.dart';
import '../api/forms.dart';

class LoginPageController extends GetxController {
  final usercontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  RxBool isLoading = RxBool(false);
  final ApiConnect connect = Get.put(ApiConnect());
  LoginResponse loginstatus = LoginResponse();

  RxBool pass = RxBool(true);

  @override
  void onInit() async {
    super.onInit();
  }

  logincall() async {
    isLoading.value = true;
    Map<String, dynamic> payload = {
      'username': usercontroller.value.text.toString(),
      'pass': passwordcontroller.value.text.toString()
    };
    usercontroller.clear();
    passwordcontroller.clear();
    print(payload);
    var Response = await connect.loginconnect(payload);
    isLoading.value = false;
    debugPrint("JobUpdateResponse: ${Response.toJson()}");

    if (!Response.error!) {
      AppSnackBar.success(message: Response.message!);
      AppPreference().updateUserId(Response.data!.employeeId!.toString());
      Get.toNamed(AppRoutes.menupage.toName);
      update();
    } else {
      AppSnackBar.error(message: Response.message!);
    }
  }
}
