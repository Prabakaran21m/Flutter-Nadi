import 'package:get/get.dart';

import '../../Controller/ProductionDashboardController/ProductionDashboardController.dart';

class ProductionDashoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductionDashboardController>(
        () => ProductionDashboardController());
  }
}
