import 'package:code/Controller/ManagementDashboardController/SalesreportController.dart';
import 'package:get/get.dart';

class MonthlyreportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesReportController>(() => SalesReportController());
  }
}
