import 'package:code/Controller/ManagementDashboardController/OrderBookingController.dart';
import 'package:get/get.dart';

class AnnualreportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderBookingController>(() => OrderBookingController());
  }
}
