import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import '../../Pojo/SalesReportExcelResponse.dart';
import '../../Pojo/SalesReportResponse.dart';
import '../../api/api_connect.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
class SalesReportController extends GetxController {
  final ApiConnect connect = Get.put(ApiConnect());
  SalesData Salesdata = SalesData();
  SalesDataexcel Salesexceldata = SalesDataexcel();
  TextEditingController FromDateController = TextEditingController();
  TextEditingController ToDateController = TextEditingController();
  RxBool isLoading =RxBool(true);



  Future<void> createExcel() async {
    final Workbook workbook = Workbook();
    int i;
    late Worksheet sheet;
    sheet = workbook.worksheets.addWithName("Domestic");
    if (Salesexceldata.domestic != null &&
        Salesexceldata.domestic!.isNotEmpty) {
      for (i = 0; i < Salesexceldata.domestic!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Billing Group");
          sheet.getRangeByName('C1').setText("Job Number");
          sheet.getRangeByName('D1').setText("Order Quantity");
          sheet.getRangeByName('E1').setText("Release_Date");
          sheet.getRangeByName('F1').setText("Customer Name");
          sheet.getRangeByName('G1').setText("Prod_Code");
          sheet.getRangeByName('H1').setText("Line_Desc");
          sheet.getRangeByName('I1').setText("Doc_Unit_Price");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].legalNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderNum.toString());
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderLine.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderQty.toString());
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceNum.toString());
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceDate);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceLine.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].customerName);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].salesRepName);

      }
    }

    sheet = workbook.worksheets.addWithName("Alstom");
    if (Salesexceldata.domestic != null &&
        Salesexceldata.domestic!.isNotEmpty) {
      for (i = 0; i < Salesexceldata.domestic!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Fan model");
          sheet.getRangeByName('D1').setText("Order Date");
          sheet.getRangeByName('E1').setText("Job Release Date");
          sheet.getRangeByName('F1').setText("Customer Name");
          sheet.getRangeByName('G1').setText("Order Quantity");
          sheet.getRangeByName('H1').setText("Unit price");
          sheet.getRangeByName('I1').setText("Total value");
          sheet.getRangeByName('J1').setText("Planned Date");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].legalNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderNum.toString());
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderLine.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderQty.toString());
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceNum.toString());
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceDate);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceLine.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].customerName);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].salesRepName);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].billingGroup);
        sheet
            .getRangeByName("K" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].partNum);
        sheet
            .getRangeByName("L" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].lineDesc);
        sheet
            .getRangeByName("M" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].prodCode);
        sheet
            .getRangeByName("N" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].docUnitPrice);
        sheet
            .getRangeByName("O" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].saleOrderValue);
      }
    }

    sheet = workbook.worksheets.addWithName("WabtecIndia");
    if (Salesexceldata.domestic != null &&
        Salesexceldata.domestic!.isNotEmpty) {
      for (i = 0; i < Salesexceldata.domestic!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Fan model");
          sheet.getRangeByName('D1').setText("Order Date");
          sheet.getRangeByName('E1').setText("Job Release Date");
          sheet.getRangeByName('F1').setText("Customer Name");
          sheet.getRangeByName('G1').setText("Order Quantity");
          sheet.getRangeByName('H1').setText("Unit price");
          sheet.getRangeByName('I1').setText("Total value");
          sheet.getRangeByName('J1').setText("Planned Date");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].legalNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderNum.toString());
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderLine.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderQty.toString());
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceNum.toString());
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceDate);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceLine.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].customerName);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].salesRepName);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].billingGroup);
        sheet
            .getRangeByName("K" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].partNum);
        sheet
            .getRangeByName("L" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].lineDesc);
        sheet
            .getRangeByName("M" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].prodCode);
        sheet
            .getRangeByName("N" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].docUnitPrice);
        sheet
            .getRangeByName("O" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].saleOrderValue);
      }
    }

    sheet = workbook.worksheets.addWithName("WabtecUSA");
    if (Salesexceldata.domestic != null &&
        Salesexceldata.domestic!.isNotEmpty) {
      for (i = 0; i < Salesexceldata.domestic!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Fan model");
          sheet.getRangeByName('D1').setText("Order Date");
          sheet.getRangeByName('E1').setText("Job Release Date");
          sheet.getRangeByName('F1').setText("Customer Name");
          sheet.getRangeByName('G1').setText("Order Quantity");
          sheet.getRangeByName('H1').setText("Unit price");
          sheet.getRangeByName('I1').setText("Total value");
          sheet.getRangeByName('J1').setText("Planned Date");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].legalNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderNum.toString());
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderLine.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderQty.toString());
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceNum.toString());
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceDate);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceLine.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].customerName);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].salesRepName);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].billingGroup);
        sheet
            .getRangeByName("K" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].partNum);
        sheet
            .getRangeByName("L" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].lineDesc);
        sheet
            .getRangeByName("M" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].prodCode);
        sheet
            .getRangeByName("N" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].docUnitPrice);
        sheet
            .getRangeByName("O" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].saleOrderValue);
      }
    }

    sheet = workbook.worksheets.addWithName("Export");
    if (Salesexceldata.domestic != null &&
        Salesexceldata.domestic!.isNotEmpty) {
      for (i = 0; i < Salesexceldata.domestic!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Fan model");
          sheet.getRangeByName('D1').setText("Order Date");
          sheet.getRangeByName('E1').setText("Job Release Date");
          sheet.getRangeByName('F1').setText("Customer Name");
          sheet.getRangeByName('G1').setText("Order Quantity");
          sheet.getRangeByName('H1').setText("Unit price");
          sheet.getRangeByName('I1').setText("Total value");
          sheet.getRangeByName('J1').setText("Planned Date");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].legalNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderNum.toString());
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderLine.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderQty.toString());
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceNum.toString());
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceDate);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceLine.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].customerName);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].salesRepName);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].billingGroup);
        sheet
            .getRangeByName("K" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].partNum);
        sheet
            .getRangeByName("L" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].lineDesc);
        sheet
            .getRangeByName("M" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].prodCode);
        sheet
            .getRangeByName("N" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].docUnitPrice);
        sheet
            .getRangeByName("O" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].saleOrderValue);
      }
    }
    //

    sheet = workbook.worksheets.addWithName("Domestic_Sale");
    if (Salesexceldata.domestic != null &&
        Salesexceldata.domestic!.isNotEmpty) {
      for (i = 0; i < Salesexceldata.domestic!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Fan model");
          sheet.getRangeByName('D1').setText("Order Date");
          sheet.getRangeByName('E1').setText("Job Release Date");
          sheet.getRangeByName('F1').setText("Customer Name");
          sheet.getRangeByName('G1').setText("Order Quantity");
          sheet.getRangeByName('H1').setText("Unit price");
          sheet.getRangeByName('I1').setText("Total value");
          sheet.getRangeByName('J1').setText("Planned Date");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].legalNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderNum.toString());
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderLine.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderQty.toString());
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceNum.toString());
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceDate);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceLine.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].customerName);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].salesRepName);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].billingGroup);
        sheet
            .getRangeByName("K" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].partNum);
        sheet
            .getRangeByName("L" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].lineDesc);
        sheet
            .getRangeByName("M" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].prodCode);
        sheet
            .getRangeByName("N" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].docUnitPrice);
        sheet
            .getRangeByName("O" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].saleOrderValue);
      }
    }

    sheet = workbook.worksheets.addWithName("Alstom_Sale");
    if (Salesexceldata.domestic != null &&
        Salesexceldata.domestic!.isNotEmpty) {
      for (i = 0; i < Salesexceldata.domestic!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Fan model");
          sheet.getRangeByName('D1').setText("Order Date");
          sheet.getRangeByName('E1').setText("Job Release Date");
          sheet.getRangeByName('F1').setText("Customer Name");
          sheet.getRangeByName('G1').setText("Order Quantity");
          sheet.getRangeByName('H1').setText("Unit price");
          sheet.getRangeByName('I1').setText("Total value");
          sheet.getRangeByName('J1').setText("Planned Date");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].legalNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderNum.toString());
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderLine.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderQty.toString());
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceNum.toString());
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceDate);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceLine.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].customerName);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].salesRepName);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].billingGroup);
        sheet
            .getRangeByName("K" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].partNum);
        sheet
            .getRangeByName("L" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].lineDesc);
        sheet
            .getRangeByName("M" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].prodCode);
        sheet
            .getRangeByName("N" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].docUnitPrice);
        sheet
            .getRangeByName("O" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].saleOrderValue);
      }
    }

    sheet = workbook.worksheets.addWithName("WabtecIndia_Sale");
    if (Salesexceldata.domestic != null &&
        Salesexceldata.domestic!.isNotEmpty) {
      for (i = 0; i < Salesexceldata.domestic!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Fan model");
          sheet.getRangeByName('D1').setText("Order Date");
          sheet.getRangeByName('E1').setText("Job Release Date");
          sheet.getRangeByName('F1').setText("Customer Name");
          sheet.getRangeByName('G1').setText("Order Quantity");
          sheet.getRangeByName('H1').setText("Unit price");
          sheet.getRangeByName('I1').setText("Total value");
          sheet.getRangeByName('J1').setText("Planned Date");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].legalNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderNum.toString());
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderLine.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderQty.toString());
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceNum.toString());
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceDate);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceLine.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].customerName);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].salesRepName);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].billingGroup);
        sheet
            .getRangeByName("K" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].partNum);
        sheet
            .getRangeByName("L" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].lineDesc);
        sheet
            .getRangeByName("M" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].prodCode);
        sheet
            .getRangeByName("N" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].docUnitPrice);
        sheet
            .getRangeByName("O" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].saleOrderValue);
      }
    }

    sheet = workbook.worksheets.addWithName("WabtecUSA_Sale");
    if (Salesexceldata.domestic != null &&
        Salesexceldata.domestic!.isNotEmpty) {
      for (i = 0; i < Salesexceldata.domestic!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Fan model");
          sheet.getRangeByName('D1').setText("Order Date");
          sheet.getRangeByName('E1').setText("Job Release Date");
          sheet.getRangeByName('F1').setText("Customer Name");
          sheet.getRangeByName('G1').setText("Order Quantity");
          sheet.getRangeByName('H1').setText("Unit price");
          sheet.getRangeByName('I1').setText("Total value");
          sheet.getRangeByName('J1').setText("Planned Date");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].legalNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderNum.toString());
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderLine.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderQty.toString());
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceNum.toString());
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceDate);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceLine.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].customerName);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].salesRepName);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].billingGroup);
        sheet
            .getRangeByName("K" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].partNum);
        sheet
            .getRangeByName("L" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].lineDesc);
        sheet
            .getRangeByName("M" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].prodCode);
        sheet
            .getRangeByName("N" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].docUnitPrice);
        sheet
            .getRangeByName("O" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].saleOrderValue);
      }
    }


    sheet = workbook.worksheets.addWithName("Export_Sale");
    if (Salesexceldata.domestic != null &&
        Salesexceldata.domestic!.isNotEmpty) {
      for (i = 0; i < Salesexceldata.domestic!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Fan model");
          sheet.getRangeByName('D1').setText("Order Date");
          sheet.getRangeByName('E1').setText("Job Release Date");
          sheet.getRangeByName('F1').setText("Customer Name");
          sheet.getRangeByName('G1').setText("Order Quantity");
          sheet.getRangeByName('H1').setText("Unit price");
          sheet.getRangeByName('I1').setText("Total value");
          sheet.getRangeByName('J1').setText("Planned Date");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].legalNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderNum.toString());
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderLine.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].orderQty.toString());
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceNum.toString());
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceDate);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].invoiceLine.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].customerName);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].salesRepName);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].billingGroup);
        sheet
            .getRangeByName("K" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].partNum);
        sheet
            .getRangeByName("L" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].lineDesc);
        sheet
            .getRangeByName("M" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].prodCode);
        sheet
            .getRangeByName("N" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].docUnitPrice);
        sheet
            .getRangeByName("O" + (i + 2).toString())
            .setText(Salesexceldata.domestic![i].saleOrderValue);
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


  SalesReportCall() async {
    Map<String, dynamic> payload = {
      'fromDate':FromDateController.value.text,
      'toDate': ToDateController.value.text,
    };
    print(payload);
    var response = await connect.SalesReportconnect(payload);

    if (!response.error!) {

      Salesdata =response.data! ;
      print(response.data);

      isLoading.value = false;
    }
    // else {
    //   AppSnackBar.error(message: response.message!);
    // }
  }
  SalesReportexcelCall() async {
    Map<String, dynamic> payload = {
      'fromDate':FromDateController.value.text,
      'toDate': ToDateController.value.text,
    };
    print(payload);
    var response = await connect.SalesReportexcelconnect(payload);

    if (!response.error!) {

      Salesexceldata =response.data! ;
      print(response.data);

      isLoading.value = false;
    }
    // else {
    //   AppSnackBar.error(message: response.message!);
    // }
  }

}
