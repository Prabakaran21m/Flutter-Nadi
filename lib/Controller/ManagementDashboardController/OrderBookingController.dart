import 'dart:convert';
import 'dart:io';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import '../../Pojo/OrderBookingResponse.dart';
import '../../Pojo/OrderBookingexcelResponse.dart';
import '../../api/api_connect.dart';

class OrderBookingController extends GetxController {
  final ApiConnect connect = Get.put(ApiConnect());
  Data Orderdata= Data();
  Dataexcel Orderexceldata=Dataexcel();
  TextEditingController FromDateController = TextEditingController();
  TextEditingController ToDateController = TextEditingController();
  RxBool isLoading =RxBool(true);


  Future<void> createExcel() async {
    final Workbook workbook = Workbook();
    int i;
    late Worksheet sheet;
    sheet = workbook.worksheets.addWithName("Domestic");
    if (Orderexceldata.domestic != null &&
        Orderexceldata.domestic!.isNotEmpty) {
      for (i = 0; i < Orderexceldata.domestic!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order_Number");
          sheet.getRangeByName('B1').setText("Order_Date");
          sheet.getRangeByName('C1').setText("Customer_Number");
          sheet.getRangeByName('D1').setText("Release_Date");
          sheet.getRangeByName('E1').setText("Territory_id");
          sheet.getRangeByName('F1').setText("Sales_rep_code");
          sheet.getRangeByName('G1').setText("sales_rep_name");
          sheet.getRangeByName('H1').setText("Billing_group");
          sheet.getRangeByName('I1').setText("Customer_name");
          sheet.getRangeByName('J1').setText("Need_by_date");
          sheet.getRangeByName('K1').setText("Request_date");
          sheet.getRangeByName('L1').setText("Order_line");
          sheet.getRangeByName('M1').setText("Part_number");
          sheet.getRangeByName('N1').setText("Line_desc");
          sheet.getRangeByName('O1').setText("Document_unit_price");
          sheet.getRangeByName('P1').setText("Order_quantity");
          sheet.getRangeByName('Q1').setText("Product_code");
          sheet.getRangeByName('R1').setText("Doc_ext_price_dtl");
          sheet.getRangeByName('S1').setText("Doc_total_charges");
          sheet.getRangeByName('T1').setText("Doc_total_misc");
          sheet.getRangeByName('U1').setText("Doc_total_discount");
          sheet.getRangeByName('V1').setText("Exchange_rate");
          sheet.getRangeByName('W1').setText("Total_order_value");
          sheet.getRangeByName('X1').setText("sales_category");


        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].orderNum);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].orderQty.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].releaseDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].salesRepCode);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].prodCode);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].lineDesc);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].docUnitPrice);

      }
    }

    sheet = workbook.worksheets.addWithName("Alstom");
    if (Orderexceldata.alstom != null &&
        Orderexceldata.alstom!.isNotEmpty) {
      for (i = 0; i < Orderexceldata.alstom!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Order Quantity");
          sheet.getRangeByName('D1').setText("Release_Date");
          sheet.getRangeByName('E1').setText("Sales_Rep_Code");
          sheet.getRangeByName('F1').setText("Customer Name");
          sheet.getRangeByName('G1').setText("Prod_Code");
          sheet.getRangeByName('H1').setText("Line_Desc");
          sheet.getRangeByName('I1').setText("Doc_Unit_Price");

        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Orderexceldata.alstom![i].orderNum);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Orderexceldata.alstom![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Orderexceldata.alstom![i].orderQty.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Orderexceldata.alstom![i].releaseDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Orderexceldata.alstom![i].salesRepCode);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Orderexceldata.alstom![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Orderexceldata.alstom![i].prodCode);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Orderexceldata.alstom![i].lineDesc);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Orderexceldata.alstom![i].docUnitPrice);

      }
    }
    sheet = workbook.worksheets.addWithName("WabtecIndia");
    if (Orderexceldata.wabtecIndia != null &&
        Orderexceldata.wabtecIndia!.isNotEmpty) {
      for (i = 0; i < Orderexceldata.wabtecIndia!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Order Quantity");
          sheet.getRangeByName('D1').setText("Release_Date");
          sheet.getRangeByName('E1').setText("Sales_Rep_Code");
          sheet.getRangeByName('F1').setText("Customer Name");
          sheet.getRangeByName('G1').setText("Prod_Code");
          sheet.getRangeByName('H1').setText("Line_Desc");
          sheet.getRangeByName('I1').setText("Doc_Unit_Price");

        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Orderexceldata.wabtecIndia![i].orderNum);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Orderexceldata.wabtecIndia![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Orderexceldata.wabtecIndia![i].orderQty.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Orderexceldata.wabtecIndia![i].releaseDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Orderexceldata.wabtecIndia![i].salesRepCode);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Orderexceldata.wabtecIndia![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Orderexceldata.wabtecIndia![i].prodCode);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Orderexceldata.wabtecIndia![i].lineDesc);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Orderexceldata.wabtecIndia![i].docUnitPrice);

      }
    }
    sheet = workbook.worksheets.addWithName("WabtecUSA");
    if (Orderexceldata.wabtecUSA != null &&
        Orderexceldata.wabtecUSA!.isNotEmpty) {
      for (i = 0; i < Orderexceldata.domestic!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Order Quantity");
          sheet.getRangeByName('D1').setText("Release_Date");
          sheet.getRangeByName('E1').setText("Sales_Rep_Code");
          sheet.getRangeByName('F1').setText("Customer Name");
          sheet.getRangeByName('G1').setText("Prod_Code");
          sheet.getRangeByName('H1').setText("Line_Desc");
          sheet.getRangeByName('I1').setText("Doc_Unit_Price");

        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].orderNum);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].orderQty.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].releaseDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].salesRepCode);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].prodCode);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].lineDesc);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].docUnitPrice);

      }
    }
    sheet = workbook.worksheets.addWithName("Export");
    if (Orderexceldata.wabtecUSA != null &&
        Orderexceldata.wabtecUSA!.isNotEmpty) {
      for (i = 0; i < Orderexceldata.domestic!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Order Quantity");
          sheet.getRangeByName('D1').setText("Release_Date");
          sheet.getRangeByName('E1').setText("Sales_Rep_Code");
          sheet.getRangeByName('F1').setText("Customer Name");
          sheet.getRangeByName('G1').setText("Prod_Code");
          sheet.getRangeByName('H1').setText("Line_Desc");
          sheet.getRangeByName('I1').setText("Doc_Unit_Price");

        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Orderexceldata.wabtecUSA![i].orderNum);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Orderexceldata.wabtecUSA![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Orderexceldata.wabtecUSA![i].orderQty.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Orderexceldata.wabtecUSA![i].releaseDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Orderexceldata.wabtecUSA![i].salesRepCode);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Orderexceldata.wabtecUSA![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Orderexceldata.wabtecUSA![i].prodCode);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Orderexceldata.wabtecUSA![i].lineDesc);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Orderexceldata.wabtecUSA![i].docUnitPrice);

      }
    }
    //

    sheet = workbook.worksheets.addWithName("Domestic_Sale");
    if (Orderexceldata.export != null &&
        Orderexceldata.export!.isNotEmpty) {
      for (i = 0; i < Orderexceldata.export!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Order Quantity");
          sheet.getRangeByName('D1').setText("Release_Date");
          sheet.getRangeByName('E1').setText("Sales_Rep_Code");
          sheet.getRangeByName('F1').setText("Customer Name");
          sheet.getRangeByName('G1').setText("Prod_Code");
          sheet.getRangeByName('H1').setText("Line_Desc");
          sheet.getRangeByName('I1').setText("Doc_Unit_Price");

        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Orderexceldata.export![i].orderNum);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Orderexceldata.export![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Orderexceldata.export![i].orderQty.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Orderexceldata.export![i].releaseDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Orderexceldata.export![i].salesRepCode);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Orderexceldata.export![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Orderexceldata.export![i].prodCode);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Orderexceldata.export![i].lineDesc);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Orderexceldata.export![i].docUnitPrice);

      }
    }
    sheet = workbook.worksheets.addWithName("Alstom_Sale");
    if (Orderexceldata.export != null &&
        Orderexceldata.export!.isNotEmpty) {
      for (i = 0; i < Orderexceldata.domestic!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Order Quantity");
          sheet.getRangeByName('D1').setText("Release_Date");
          sheet.getRangeByName('E1').setText("Sales_Rep_Code");
          sheet.getRangeByName('F1').setText("Customer Name");
          sheet.getRangeByName('G1').setText("Prod_Code");
          sheet.getRangeByName('H1').setText("Line_Desc");
          sheet.getRangeByName('I1').setText("Doc_Unit_Price");

        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].orderNum);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].orderQty.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].releaseDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].salesRepCode);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].prodCode);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].lineDesc);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].docUnitPrice);

      }
    }
    sheet = workbook.worksheets.addWithName("WabtecIndia_Sale");
    if (Orderexceldata.export != null &&
        Orderexceldata.export!.isNotEmpty) {
      for (i = 0; i < Orderexceldata.domestic!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Order Quantity");
          sheet.getRangeByName('D1').setText("Release_Date");
          sheet.getRangeByName('E1').setText("Sales_Rep_Code");
          sheet.getRangeByName('F1').setText("Customer Name");
          sheet.getRangeByName('G1').setText("Prod_Code");
          sheet.getRangeByName('H1').setText("Line_Desc");
          sheet.getRangeByName('I1').setText("Doc_Unit_Price");

        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].orderNum);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].orderQty.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].releaseDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].salesRepCode);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].prodCode);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].lineDesc);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].docUnitPrice);

      }
    }

    sheet = workbook.worksheets.addWithName("WabtecUSA_Sale");
    if (Orderexceldata.domestic != null &&
        Orderexceldata.domestic!.isNotEmpty) {
      for (i = 0; i < Orderexceldata.domestic!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Order Quantity");
          sheet.getRangeByName('D1').setText("Release_Date");
          sheet.getRangeByName('E1').setText("Sales_Rep_Code");
          sheet.getRangeByName('F1').setText("Customer Name");
          sheet.getRangeByName('G1').setText("Prod_Code");
          sheet.getRangeByName('H1').setText("Line_Desc");
          sheet.getRangeByName('I1').setText("Doc_Unit_Price");

        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].orderNum);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].orderQty.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].releaseDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].salesRepCode);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].prodCode);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].lineDesc);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].docUnitPrice);

      }
    }

    sheet = workbook.worksheets.addWithName("Export_Sale");
    if (Orderexceldata.domestic != null &&
        Orderexceldata.domestic!.isNotEmpty) {
      for (i = 0; i < Orderexceldata.domestic!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Order Quantity");
          sheet.getRangeByName('D1').setText("Release_Date");
          sheet.getRangeByName('E1').setText("Sales_Rep_Code");
          sheet.getRangeByName('F1').setText("Customer Name");
          sheet.getRangeByName('G1').setText("Prod_Code");
          sheet.getRangeByName('H1').setText("Line_Desc");
          sheet.getRangeByName('I1').setText("Doc_Unit_Price");

        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].orderNum);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].orderQty.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].releaseDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].salesRepCode);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].prodCode);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].lineDesc);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Orderexceldata.domestic![i].docUnitPrice);

      }
    }


    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    if (kIsWeb) {
      AnchorElement(
          href:
          'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
        ..setAttribute('download', 'Output.xlsx')
        ..click();
    } else {
      final String path = (await getApplicationSupportDirectory()).path;
      final String fileName =
      Platform.isWindows ? '$path\\Output.xlsx' : '$path/Output.xlsx';
      final File file = File(fileName);
      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open(fileName);
    }
  }
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void dispose() {
    FromDateController.dispose();
    ToDateController.dispose();

    super.dispose();
  }



 OrderBookingCall() async {
    Map<String, dynamic> payload = {
      'fromDate':FromDateController.value.text,
      'toDate': ToDateController.value.text,
    };
    print('step1');
    print(payload);
    var response = await connect.Orderconnect(payload);
    print('step2');

    if (!response.error!) {
      print('step3');

      Orderdata = response.data!;
      print(response.data);

      isLoading.value = false;
    }
  }


  OrderBookingexcelCall() async {
    Map<String, dynamic> payload = {
      'fromDate':FromDateController.value.text,
      'toDate': ToDateController.value.text,
    };
    print(payload);
    var response = await connect.Orderexcelconnect(payload);
print('exl 1');
    if (!response.error!) {

      Orderexceldata = response.data!;
      print(response.data);

      isLoading.value = false;
    }
    // else {
    //   AppSnackBar.error(message: response.message!);
    // }
  }

}
