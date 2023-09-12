import 'package:code/Controller/ManagementDashboardController/AlertPageController.dart';
import 'package:get/get.dart';

class MenuPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuPageController>(() => MenuPageController());
  }
}
