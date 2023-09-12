import 'package:code/Controller/ManagementDashboardController/AlertPageController.dart';
import 'package:get/get.dart';

class AlertPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuPageController>(() => MenuPageController());
  }
}
