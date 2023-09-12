import 'package:code/Binding/ManagementDashboardBinding/AlertPageBinding.dart';
import 'package:code/Binding/ManagementDashboardBinding/AnnualreportBinding.dart';
import 'package:code/Binding/ManagementDashboardBinding/DashboardScreenBinding.dart';
import 'package:code/Binding/ManagementDashboardBinding/MenupageBinding.dart';
import 'package:code/Binding/ManagementDashboardBinding/MonthlyreportBinding.dart';
import 'package:code/UI/ManagementDashboard/Alertpage.dart';
import 'package:code/UI/ManagementDashboard/Dashboard.dart';
import 'package:code/UI/ManagementDashboard/Salesreport.dart';
import 'package:get/get.dart';
import '../Binding/ManagementDashboardBinding/ManagementPlanvsActualBinding.dart';
import '../UI/ManagementDashboard/OrderBooking.dart';
import '../UI/ManagementDashboard/ManagementPlanvsActualScreen.dart';
import '../UI/ManagementDashboard/Menupage.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
        name: AppRoutes.managementplanvsactualscreen.toName,
        page: () => ManagementPlanvsActualScreen(),
        binding: ManagementPlanvsActualBinding()),
    GetPage(
        name: AppRoutes.Monthlyreport.toName,
        page: () => Salesreport(),
        binding: MonthlyreportBinding()),
    GetPage(
        name: AppRoutes.Annualreport.toName,
        page: () => OrderBooking(),
        binding: AnnualreportBinding()),
    GetPage(
        name: AppRoutes.DashBoard.toName,
        page: () => DashBoard(),
        binding: DashboardScreenBinding()),
    GetPage(
        name: AppRoutes.Alertpage.toName,
        page: () => Alertpage(),
        binding: AlertPageBinding()),
    GetPage(
        name: AppRoutes.menupage.toName,
        page: () => Menupage(),
        binding: MenuPageBinding()),
  ];
}
