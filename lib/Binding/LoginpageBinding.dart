import 'package:get/get.dart';
import '../Controller/Loginpagecontroller.dart';

class LoginpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(() => LoginPageController());
  }
}
