import 'package:get/get.dart';
import '../../Controller/ManagementDashboardController/ManagementPlanvsActualController.dart';

class ManagementPlanvsActualBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagementPlanvsActualController>(() => ManagementPlanvsActualController());
  }
}
