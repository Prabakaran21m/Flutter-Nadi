import 'package:get/get.dart';

import '../../Controller/ProductionDashboardController/ProductionPlanvsActualController.dart';

class ProductionPlanvsActualBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductionPlanvsActualController>(
        () => ProductionPlanvsActualController());
  }
}
