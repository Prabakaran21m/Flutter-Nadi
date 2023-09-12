import 'package:code/Controller/ManagementDashboardController/DashboardScreenController.dart';
import 'package:get/get.dart';

class DashboardScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardScreenController>(() => DashboardScreenController());
  }
}
