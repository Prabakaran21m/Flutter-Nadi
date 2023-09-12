import 'package:code/Pojo/ExportResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Pojo/LoginResponse.dart';
import '../Pojo/OrderBookingResponse.dart';
import '../Pojo/OrderBookingexcelResponse.dart';
import '../Pojo/Productiondashboardexcel.dart';
import '../Pojo/SalesReportExcelResponse.dart';
import '../Pojo/SalesReportResponse.dart';
import 'ApiUrl.dart';
import 'HttpService.dart';
import '../Pojo/JobUpdatesResponse.dart';
import 'app_utility.dart';

class ApiConnect extends GetConnect {
  HttpService httpService = HttpService();

  @override
  onInit() async {
    await httpService.init();
    super.onInit();
  }

  Future<JobUpdatesResponse> MonthlyJobUpdateConnect(
      Map<String, dynamic> payload) async {
    httpService.init();
    var JobUpdateresponse = await httpService.request(
        url: ApiUrl.jobupdates, method: Method.POST, params: payload);
    if (JobUpdateresponse == null) {
      throw Exception("Failed to fetch job updates");
    }
    if (JobUpdateresponse.data == null) {
      throw Exception(AppUtility.connectivityMessage);
    }
    return JobUpdatesResponse.fromJson(JobUpdateresponse.data);
  }

  Future<JobUpdatesResponse> JobUpdateConnect(
      Map<String, dynamic> payload) async {
    httpService.init();
    var JobUpdateresponse = await httpService.request(
        url: ApiUrl.jobupdates, method: Method.POST, params: payload);
    if (JobUpdateresponse == null) {
      throw Exception("Failed to fetch job updates");
    }
    if (JobUpdateresponse.data == null) {
      throw Exception(AppUtility.connectivityMessage);
    }
    return JobUpdatesResponse.fromJson(JobUpdateresponse.data);
  }

  Future<JobUpdatesResponse> commonconnect(Map<String, dynamic> payload) async {
    httpService.init();
    var JobUpdateresponse = await httpService.request(
        url: ApiUrl.jobupdates, method: Method.POST, params: payload);
    if (JobUpdateresponse == null) {
      throw Exception("Failed to fetch job updates");
    }
    if (JobUpdateresponse.data == null) {
      throw Exception(AppUtility.connectivityMessage);
    }
    var response = JobUpdatesResponse.fromJson(JobUpdateresponse.data);
    return response;
  }

  Future<CommonExportResponse> commonexportexcelconnect(
      Map<String, dynamic> payload) async {
    httpService.init();
    var Response = await httpService.request(
        url: ApiUrl.export, method: Method.POST, params: payload);
    if (Response == null) {
      throw Exception("Failed to fetch job updates");
    }
    if (Response.data == null) {
      throw Exception(AppUtility.connectivityMessage);
    }
    var response = CommonExportResponse.fromJson(Response.data);
    return response;
  }

  Future<Productiondashboardexcel> productionexcel(
      Map<String, dynamic> payload) async {
    httpService.init();
    var Response = await httpService.request(
        url: ApiUrl.productionexcel, method: Method.POST, params: payload);
    if (Response == null) {
      throw Exception("Failed to fetch job updates");
    }
    if (Response.data == null) {
      throw Exception(AppUtility.connectivityMessage);
    }
    var response = Productiondashboardexcel.fromJson(Response.data);
    return response;
  }

  Future<LoginResponse> loginconnect(Map<String, dynamic> payload) async {
    httpService.init();
    var Response = await httpService.request(
        url: ApiUrl.login, method: Method.POST, params: payload);
    if (Response == null) {
      throw Exception("Failed to fetch job updates");
    }
    if (Response.data == null) {
      throw Exception(AppUtility.connectivityMessage);
    }
    var response = LoginResponse.fromJson(Response.data);
    return response;
  }



  Future<OrderBookingResponse> Orderconnect(Map<String, dynamic> payload) async {
    httpService.init();
    var Response = await httpService.request(
        url: ApiUrl.orderbooking, method: Method.POST, params: payload);
    if (Response == null) {
      throw Exception("Failed to fetch job updates");
    }
    if (Response.data == null) {
      throw Exception(AppUtility.connectivityMessage);
    }
    var response = OrderBookingResponse.fromJson(Response.data);
    print(Response);
    return response;
  }

  Future<OrderBookingexcelResponse> Orderexcelconnect(Map<String, dynamic> payload) async {
    httpService.init();
    var Response = await httpService.request(
        url: ApiUrl.orderbookingexcel, method: Method.POST, params: payload);
    if (Response == null) {
      throw Exception("Failed to fetch job updates");
    }
    if (Response.data == null) {
      throw Exception(AppUtility.connectivityMessage);
    }
    var response = OrderBookingexcelResponse.fromJson(Response.data);
    print(Response);
    print("exl");
    return response;

  }



  Future<SalesReportResponse> SalesReportconnect(Map<String, dynamic> payload) async {
    httpService.init();
    var Response = await httpService.request(
        url: ApiUrl.salesreport, method: Method.POST, params: payload);
    if (Response == null) {
      throw Exception("Failed to fetch job updates");
    }
    if (Response.data == null) {
      throw Exception(AppUtility.connectivityMessage);
    }
    var response = SalesReportResponse.fromJson(Response.data);
    print(Response);
    return response;
  }


  Future<SalesReportExcelResponse> SalesReportexcelconnect(Map<String, dynamic> payload) async {
    httpService.init();
    var Response = await httpService.request(
        url: ApiUrl.salesreportexcel, method: Method.POST, params: payload);
    if (Response == null) {
      throw Exception("Failed to fetch job updates");
    }
    if (Response.data == null) {
      throw Exception(AppUtility.connectivityMessage);
    }
    var response = SalesReportExcelResponse.fromJson(Response.data);
    print(Response);
    return response;
  }


}
//
//

// ... (other code remains the same)

// Future<JobUpdatesResponse> JobUpdateconect1(
//     Map<String, dynamic> payload) async {
//   print('jobconect');
//   httpService.init();
//   print('httpscevice1');
//   var JobUpdateresponse = await httpService.request(
//       url: ApiUrl.jobupdates, method: Method.POST, params: payload);
//   print('httpsevice');
//
//   // Handle null or unexpected response data
//   if (JobUpdateresponse == null) {
//     throw Exception(
//         "Failed to fetch job updates"); // or any other appropriate error message
//   }
//
//   // Handle non-Response objects
//   if (JobUpdateresponse is! Response) {
//     throw Exception(
//         "Unexpected response from server"); // or any other appropriate error message
//   }
//   if (JobUpdateresponse.data == null) {
//     throw Exception(AppUtility.connectivityMessage);
//   }
//   return JobUpdatesResponse.fromJson(JobUpdateresponse.data);
// }
