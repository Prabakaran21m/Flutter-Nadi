import 'package:code/Pojo/ExportResponse.dart';
import 'package:code/Provider/Dataprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../api/api_connect.dart';
import '../../Pojo/JobUpdatesResponse.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';

class ManagementPlanvsActualController extends GetxController {
  late DataProvider userdataprovider;

  RxString Department = RxString('');
  RxString Actual = RxString('');
  RxString Planed = RxString('');
  RxString Delyed = RxString('');
  //late RxList<Planned> planned = RxList();

  TextEditingController WeekController = TextEditingController();
  TextEditingController YearController = TextEditingController();
  RxBool isLoading = RxBool(false);

  List<Data> data = [];

  List<Planned> plannedvalues = [];

  List<PlannedProduction> plannedProduction = [];

  int findTrueIndex(List<RxBool> checkboxValues) {
    int index = checkboxValues.indexWhere((rxBool) => rxBool.value == true);
    return index;
  }

  final ApiConnect connect = Get.put(ApiConnect());

  JobUpdatesResponse JobUpdatestatus = JobUpdatesResponse();

  CommonExportResponse ExportExcel = CommonExportResponse();

  final checkboxValues =
      <RxBool>[RxBool(true), RxBool(false), RxBool(false)].obs;

  void handleCheckboxClicked(int index) {
    for (int i = 0; i < checkboxValues.length; i++) {
      if (i == index) {
        checkboxValues[i].value = true; // Set selected checkbox as true
      } else {
        checkboxValues[i].value = false; // Set other checkboxes as false
      }
    }
  }

  Future<void> createExcel() async {
    final Workbook workbook = Workbook();
    int i;
    late Worksheet sheet;
    sheet = workbook.worksheets.addWithName("PlannedProduction");
    if (ExportExcel.plannedProduction != null &&
        ExportExcel.plannedProduction!.isNotEmpty) {
      for (i = 0; i < ExportExcel.plannedProduction!.length; i++) {
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
            .setText(ExportExcel.plannedProduction![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.plannedProduction![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.plannedProduction![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.plannedProduction![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.plannedProduction![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.plannedProduction![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.plannedProduction![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.plannedProduction![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.plannedProduction![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.plannedProduction![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("ActualProduction");
    if (ExportExcel.actualProduction != null &&
        ExportExcel.actualProduction!.isNotEmpty) {
      for (i = 0; i < ExportExcel.actualProduction!.length; i++) {
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
            .setText(ExportExcel.actualProduction![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.actualProduction![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.actualProduction![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.actualProduction![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.actualProduction![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.actualProduction![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.actualProduction![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.actualProduction![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.actualProduction![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.actualProduction![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("DelayedProduction");
    if (ExportExcel.delayedProduction != null &&
        ExportExcel.delayedProduction!.isNotEmpty) {
      for (i = 0; i < ExportExcel.delayedProduction!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Job Number");
          sheet.getRangeByName('B1').setText("Fan model");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Order Quantity");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(ExportExcel.delayedProduction![i].jobNumber);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.delayedProduction![i].fanModel);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.delayedProduction![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.delayedProduction![i].orderQty.toString());
      }
    }

    sheet = workbook.worksheets.addWithName("PlannedMoM");
    if (ExportExcel.plannedMom != null && ExportExcel.plannedMom!.isNotEmpty) {
      for (i = 0; i < ExportExcel.plannedMom!.length; i++) {
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
            .setText(ExportExcel.plannedMom![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.plannedMom![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.plannedMom![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.plannedMom![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.plannedMom![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.plannedMom![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.plannedMom![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.plannedMom![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.plannedMom![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.plannedMom![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("ActualMoM");
    if (ExportExcel.actualMom != null && ExportExcel.actualMom!.isNotEmpty) {
      for (i = 0; i < ExportExcel.actualMom!.length; i++) {
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
            .setText(ExportExcel.actualMom![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.actualMom![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.actualMom![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.actualMom![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.actualMom![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.actualMom![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.actualMom![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.actualMom![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.actualMom![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.actualMom![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("DelayedMoM");
    if (ExportExcel.delayedMom != null && ExportExcel.delayedMom!.isNotEmpty) {
      for (i = 0; i < ExportExcel.delayedMom!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Job Number");
          sheet.getRangeByName('B1').setText("Fan model");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Order Quantity");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(ExportExcel.delayedMom![i].jobNumber);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.delayedMom![i].fanModel);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.delayedMom![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.delayedMom![i].orderQty.toString());
      }
    }
    //

    sheet = workbook.worksheets.addWithName("PlannedCNC");
    if (ExportExcel.plannedCnc != null && ExportExcel.plannedCnc!.isNotEmpty) {
      for (i = 0; i < ExportExcel.plannedCnc!.length; i++) {
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
            .setText(ExportExcel.plannedCnc![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.plannedCnc![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.plannedCnc![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.plannedCnc![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.plannedCnc![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.plannedCnc![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.plannedCnc![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.plannedCnc![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.plannedCnc![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.plannedCnc![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("ActualCNC");
    if (ExportExcel.actualCnc != null && ExportExcel.actualCnc!.isNotEmpty) {
      for (i = 0; i < ExportExcel.actualCnc!.length; i++) {
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
            .setText(ExportExcel.actualCnc![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.actualCnc![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.actualCnc![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.actualCnc![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.actualCnc![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.actualCnc![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.actualCnc![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.actualCnc![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.actualCnc![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.actualCnc![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("DelayedCNC");
    if (ExportExcel.delayedCnc != null && ExportExcel.delayedCnc!.isNotEmpty) {
      for (i = 0; i < ExportExcel.delayedCnc!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Job Number");
          sheet.getRangeByName('B1').setText("Fan model");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Order Quantity");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(ExportExcel.delayedCnc![i].jobNumber);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.delayedCnc![i].fanModel);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.delayedCnc![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.delayedCnc![i].orderQty.toString());
      }
    }

    sheet = workbook.worksheets.addWithName("PlannedHUB");
    if (ExportExcel.plannedHub != null && ExportExcel.plannedHub!.isNotEmpty) {
      for (i = 0; i < ExportExcel.plannedHub!.length; i++) {
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
            .setText(ExportExcel.plannedHub![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.plannedHub![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.plannedHub![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.plannedHub![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.plannedHub![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.plannedHub![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.plannedHub![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.plannedHub![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.plannedHub![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.plannedHub![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("ActualHUB");
    if (ExportExcel.actualHub != null && ExportExcel.actualHub!.isNotEmpty) {
      for (i = 0; i < ExportExcel.actualHub!.length; i++) {
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
            .setText(ExportExcel.actualHub![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.actualHub![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.actualHub![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.actualHub![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.actualHub![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.actualHub![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.actualHub![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.actualHub![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.actualHub![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.actualHub![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("DelayedHUB");
    if (ExportExcel.delayedHub != null && ExportExcel.delayedHub!.isNotEmpty) {
      for (i = 0; i < ExportExcel.delayedHub!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Job Number");
          sheet.getRangeByName('B1').setText("Fan model");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Order Quantity");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(ExportExcel.delayedHub![i].jobNumber);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.delayedHub![i].fanModel);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.delayedHub![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.delayedHub![i].orderQty.toString());
      }
    }

    //

    sheet = workbook.worksheets.addWithName("PlannedMachining");
    if (ExportExcel.plannedMachining != null &&
        ExportExcel.plannedMachining!.isNotEmpty) {
      for (i = 0; i < ExportExcel.plannedMachining!.length; i++) {
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
            .setText(ExportExcel.plannedMachining![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.plannedMachining![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.plannedMachining![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.plannedMachining![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.plannedMachining![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.plannedMachining![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.plannedMachining![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.plannedMachining![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.plannedMachining![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.plannedMachining![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("ActualMachining");
    if (ExportExcel.actualMachining != null &&
        ExportExcel.actualMachining!.isNotEmpty) {
      for (i = 0; i < ExportExcel.actualMachining!.length; i++) {
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
            .setText(ExportExcel.actualMachining![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.actualMachining![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.actualMachining![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.actualMachining![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.actualMachining![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.actualMachining![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.actualMachining![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.actualMachining![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.actualMachining![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.actualMachining![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("DelayedMachining");
    if (ExportExcel.delayedMachining != null &&
        ExportExcel.delayedMachining!.isNotEmpty) {
      for (i = 0; i < ExportExcel.delayedMachining!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Job Number");
          sheet.getRangeByName('B1').setText("Fan model");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Order Quantity");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(ExportExcel.delayedMachining![i].jobNumber);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.delayedMachining![i].fanModel);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.delayedMachining![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.delayedMachining![i].orderQty.toString());
      }
    }

    sheet = workbook.worksheets.addWithName("PlanneImpeller");
    if (ExportExcel.plannedImpeller != null &&
        ExportExcel.plannedImpeller!.isNotEmpty) {
      for (i = 0; i < ExportExcel.plannedImpeller!.length; i++) {
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
            .setText(ExportExcel.plannedImpeller![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.plannedImpeller![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.plannedImpeller![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.plannedImpeller![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.plannedImpeller![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.plannedImpeller![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.plannedImpeller![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.plannedImpeller![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.plannedImpeller![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.plannedImpeller![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("ActualImpeller");
    if (ExportExcel.actualImpeller != null &&
        ExportExcel.actualImpeller!.isNotEmpty) {
      for (i = 0; i < ExportExcel.actualImpeller!.length; i++) {
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
            .setText(ExportExcel.actualImpeller![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.actualImpeller![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.actualImpeller![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.actualImpeller![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.actualImpeller![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.actualImpeller![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.actualImpeller![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.actualImpeller![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.actualImpeller![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.actualImpeller![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("DelayedImpeller");
    if (ExportExcel.delayedImpeller != null &&
        ExportExcel.delayedImpeller!.isNotEmpty) {
      for (i = 0; i < ExportExcel.delayedImpeller!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Job Number");
          sheet.getRangeByName('B1').setText("Fan model");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Order Quantity");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(ExportExcel.delayedImpeller![i].jobNumber);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.delayedImpeller![i].fanModel);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.delayedImpeller![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.delayedImpeller![i].orderQty.toString());
      }
    }
    //

    sheet = workbook.worksheets.addWithName("PlannedCasing");
    if (ExportExcel.plannedCasing != null &&
        ExportExcel.plannedCasing!.isNotEmpty) {
      for (i = 0; i < ExportExcel.plannedCasing!.length; i++) {
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
            .setText(ExportExcel.plannedCasing![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.plannedCasing![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.plannedCasing![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.plannedCasing![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.plannedCasing![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.plannedCasing![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.plannedCasing![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.plannedCasing![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.plannedCasing![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.plannedCasing![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("ActualCasing");
    if (ExportExcel.actualCasing != null &&
        ExportExcel.actualCasing!.isNotEmpty) {
      for (i = 0; i < ExportExcel.actualCasing!.length; i++) {
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
            .setText(ExportExcel.actualCasing![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.actualCasing![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.actualCasing![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.actualCasing![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.actualCasing![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.actualCasing![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.actualCasing![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.actualCasing![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.actualCasing![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.actualCasing![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("DelayedCasing");
    if (ExportExcel.delayedCasing != null &&
        ExportExcel.delayedCasing!.isNotEmpty) {
      for (i = 0; i < ExportExcel.delayedCasing!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Job Number");
          sheet.getRangeByName('B1').setText("Fan model");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Order Quantity");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(ExportExcel.delayedCasing![i].jobNumber);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.delayedCasing![i].fanModel);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.delayedCasing![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.delayedCasing![i].orderQty.toString());
      }
    }
    sheet = workbook.worksheets.addWithName("PlannedAccessories");
    if (ExportExcel.plannedAccessories != null &&
        ExportExcel.plannedAccessories!.isNotEmpty) {
      for (i = 0; i < ExportExcel.plannedAccessories!.length; i++) {
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
            .setText(ExportExcel.plannedAccessories![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.plannedAccessories![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.plannedAccessories![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.plannedAccessories![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.plannedAccessories![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.plannedAccessories![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.plannedAccessories![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.plannedAccessories![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.plannedAccessories![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.plannedAccessories![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("ActualAccessories");
    if (ExportExcel.actualAccessories != null &&
        ExportExcel.actualAccessories!.isNotEmpty) {
      for (i = 0; i < ExportExcel.actualAccessories!.length; i++) {
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
            .setText(ExportExcel.actualAccessories![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.actualAccessories![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.actualAccessories![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.actualAccessories![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.actualAccessories![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.actualAccessories![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.actualAccessories![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.actualAccessories![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.actualAccessories![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.actualAccessories![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("DelayedAccessories");
    if (ExportExcel.delayedAccessories != null &&
        ExportExcel.delayedAccessories!.isNotEmpty) {
      for (i = 0; i < ExportExcel.delayedAccessories!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Job Number");
          sheet.getRangeByName('B1').setText("Fan model");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Order Quantity");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(ExportExcel.delayedAccessories![i].jobNumber);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.delayedAccessories![i].fanModel);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.delayedAccessories![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.delayedAccessories![i].orderQty.toString());
      }
    }
    //

    sheet = workbook.worksheets.addWithName("PlannedFirstCoatPaint");
    if (ExportExcel.plannedFcp != null && ExportExcel.plannedFcp!.isNotEmpty) {
      for (i = 0; i < ExportExcel.plannedFcp!.length; i++) {
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
            .setText(ExportExcel.plannedFcp![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.plannedFcp![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.plannedFcp![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.plannedFcp![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.plannedFcp![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.plannedFcp![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.plannedFcp![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.plannedFcp![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.plannedFcp![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.plannedFcp![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("ActualFirstCoatPaint");
    if (ExportExcel.actualFcp != null && ExportExcel.actualFcp!.isNotEmpty) {
      for (i = 0; i < ExportExcel.actualFcp!.length; i++) {
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
            .setText(ExportExcel.actualFcp![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.actualFcp![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.actualFcp![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.actualFcp![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.actualFcp![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.actualFcp![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.actualFcp![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.actualFcp![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.actualFcp![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.actualFcp![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("DelayedFirstCoatPaint");
    if (ExportExcel.delayedFcp != null && ExportExcel.delayedFcp!.isNotEmpty) {
      for (i = 0; i < ExportExcel.delayedFcp!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Job Number");
          sheet.getRangeByName('B1').setText("Fan model");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Order Quantity");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(ExportExcel.delayedFcp![i].jobNumber);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.delayedFcp![i].fanModel);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.delayedFcp![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.delayedFcp![i].orderQty.toString());
      }
    }

    sheet = workbook.worksheets.addWithName("PlannedAssembly");
    if (ExportExcel.plannedAssembly != null &&
        ExportExcel.plannedAssembly!.isNotEmpty) {
      for (i = 0; i < ExportExcel.plannedAssembly!.length; i++) {
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
            .setText(ExportExcel.plannedAssembly![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.plannedAssembly![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.plannedAssembly![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.plannedAssembly![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.plannedAssembly![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.plannedAssembly![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.plannedAssembly![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.plannedAssembly![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.plannedAssembly![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.plannedAssembly![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("ActualAssembly");
    if (ExportExcel.actualAssembly != null &&
        ExportExcel.actualAssembly!.isNotEmpty) {
      for (i = 0; i < ExportExcel.actualAssembly!.length; i++) {
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
            .setText(ExportExcel.actualAssembly![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.actualAssembly![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.actualAssembly![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.actualAssembly![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.actualAssembly![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.actualAssembly![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.actualAssembly![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.actualAssembly![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.actualAssembly![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.actualAssembly![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("DelayedAssembly");
    if (ExportExcel.delayedAssembly != null &&
        ExportExcel.delayedAssembly!.isNotEmpty) {
      for (i = 0; i < ExportExcel.delayedAssembly!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Job Number");
          sheet.getRangeByName('B1').setText("Fan model");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Order Quantity");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(ExportExcel.delayedAssembly![i].jobNumber);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.delayedAssembly![i].fanModel);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.delayedAssembly![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.delayedAssembly![i].orderQty.toString());
      }
    }
    //

    sheet = workbook.worksheets.addWithName("PlannedTesting");
    if (ExportExcel.plannedTesting != null &&
        ExportExcel.plannedTesting!.isNotEmpty) {
      for (i = 0; i < ExportExcel.plannedTesting!.length; i++) {
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
            .setText(ExportExcel.plannedTesting![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.plannedTesting![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.plannedTesting![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.plannedTesting![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.plannedTesting![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.plannedTesting![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.plannedTesting![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.plannedTesting![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.plannedTesting![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.plannedTesting![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("ActualTesting");
    if (ExportExcel.actualTesting != null &&
        ExportExcel.actualTesting!.isNotEmpty) {
      for (i = 0; i < ExportExcel.actualTesting!.length; i++) {
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
            .setText(ExportExcel.actualTesting![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.actualTesting![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.actualTesting![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.actualTesting![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.actualTesting![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.actualTesting![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.actualTesting![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.actualTesting![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.actualTesting![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.actualTesting![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("DelayedTesting");
    if (ExportExcel.delayedTesting != null &&
        ExportExcel.delayedTesting!.isNotEmpty) {
      for (i = 0; i < ExportExcel.delayedTesting!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Job Number");
          sheet.getRangeByName('B1').setText("Fan model");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Order Quantity");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(ExportExcel.delayedTesting![i].jobNumber);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.delayedTesting![i].fanModel);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.delayedTesting![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.delayedTesting![i].orderQty.toString());
      }
    }

    sheet = workbook.worksheets.addWithName("PlannedFinalPaint");
    if (ExportExcel.plannedFinalPaint != null &&
        ExportExcel.plannedFinalPaint!.isNotEmpty) {
      for (i = 0; i < ExportExcel.plannedFinalPaint!.length; i++) {
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
            .setText(ExportExcel.plannedFinalPaint![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.plannedFinalPaint![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.plannedFinalPaint![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.plannedFinalPaint![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.plannedFinalPaint![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.plannedFinalPaint![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.plannedFinalPaint![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.plannedFinalPaint![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.plannedFinalPaint![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.plannedFinalPaint![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("ActualFinalPaint");
    if (ExportExcel.actualFinalPaint != null &&
        ExportExcel.actualFinalPaint!.isNotEmpty) {
      for (i = 0; i < ExportExcel.actualFinalPaint!.length; i++) {
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
            .setText(ExportExcel.actualFinalPaint![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.actualFinalPaint![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.actualFinalPaint![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.actualFinalPaint![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.actualFinalPaint![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.actualFinalPaint![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.actualFinalPaint![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.actualFinalPaint![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.actualFinalPaint![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.actualFinalPaint![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("DelayedFinalPaint");
    if (ExportExcel.delayedFinalPaint != null &&
        ExportExcel.delayedFinalPaint!.isNotEmpty) {
      for (i = 0; i < ExportExcel.delayedFinalPaint!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Job Number");
          sheet.getRangeByName('B1').setText("Fan model");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Order Quantity");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(ExportExcel.delayedFinalPaint![i].jobNumber);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.delayedFinalPaint![i].fanModel);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.delayedFinalPaint![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.delayedFinalPaint![i].orderQty.toString());
      }
    }
    //

    sheet = workbook.worksheets.addWithName("PlannedPacking");
    if (ExportExcel.plannedPacking != null &&
        ExportExcel.plannedPacking!.isNotEmpty) {
      for (i = 0; i < ExportExcel.plannedPacking!.length; i++) {
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
            .setText(ExportExcel.plannedPacking![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.plannedPacking![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.plannedPacking![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.plannedPacking![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.plannedPacking![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.plannedPacking![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.plannedPacking![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.plannedPacking![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.plannedPacking![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.plannedPacking![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("ActualPacking");
    if (ExportExcel.actualTesting != null &&
        ExportExcel.actualTesting!.isNotEmpty) {
      for (i = 0; i < ExportExcel.actualTesting!.length; i++) {
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
            .setText(ExportExcel.actualTesting![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.actualTesting![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.actualTesting![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.actualTesting![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.actualTesting![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.actualTesting![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.actualTesting![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.actualTesting![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.actualTesting![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.actualTesting![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("DelayedPacking");
    if (ExportExcel.delayedTesting != null &&
        ExportExcel.delayedTesting!.isNotEmpty) {
      for (i = 0; i < ExportExcel.delayedTesting!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Job Number");
          sheet.getRangeByName('B1').setText("Fan model");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Order Quantity");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(ExportExcel.delayedTesting![i].jobNumber);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.delayedTesting![i].fanModel);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.delayedTesting![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.delayedTesting![i].orderQty.toString());
      }
    }

    sheet = workbook.worksheets.addWithName("PlannedDispatch");
    if (ExportExcel.plannedDispatch != null &&
        ExportExcel.plannedDispatch!.isNotEmpty) {
      for (i = 0; i < ExportExcel.plannedDispatch!.length; i++) {
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
            .setText(ExportExcel.plannedDispatch![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.plannedDispatch![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.plannedDispatch![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.plannedDispatch![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.plannedDispatch![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.plannedDispatch![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.plannedDispatch![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.plannedDispatch![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.plannedDispatch![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.plannedDispatch![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("ActualDispatch");
    if (ExportExcel.actualDispatch != null &&
        ExportExcel.actualDispatch!.isNotEmpty) {
      for (i = 0; i < ExportExcel.actualDispatch!.length; i++) {
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
            .setText(ExportExcel.actualDispatch![i].orderNumber);

        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.actualDispatch![i].jobNumber);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.actualDispatch![i].fanModel);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.actualDispatch![i].orderDate);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ExportExcel.actualDispatch![i].jobReleaseDate);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ExportExcel.actualDispatch![i].customerName);
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ExportExcel.actualDispatch![i].orderQty.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ExportExcel.actualDispatch![i].unitPrice);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ExportExcel.actualDispatch![i].totalValue);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ExportExcel.actualDispatch![i].plannedDate);
      }
    }

    sheet = workbook.worksheets.addWithName("DelayedDispatch");
    if (ExportExcel.delayedDispatch != null &&
        ExportExcel.delayedDispatch!.isNotEmpty) {
      for (i = 0; i < ExportExcel.delayedDispatch!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Job Number");
          sheet.getRangeByName('B1').setText("Fan model");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Order Quantity");
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(ExportExcel.delayedDispatch![i].jobNumber);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(ExportExcel.delayedDispatch![i].fanModel);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(ExportExcel.delayedDispatch![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ExportExcel.delayedDispatch![i].orderQty.toString());
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

  Future<List<dynamic>> JobUpdateCall() async {
    isLoading.value = true;
    print(findTrueIndex(checkboxValues) == 0);
    print(findTrueIndex(checkboxValues) == 1);
    print(findTrueIndex(checkboxValues) == 2);
    //try {
    Map<String, dynamic> payload = {
      'Department': "",
      'checkbox': findTrueIndex(checkboxValues) == 0
          ? "Yesterday"
          : findTrueIndex(checkboxValues) == 1
              ? "Weekly"
              : findTrueIndex(checkboxValues) == 2
                  ? YearController.value.text
                  : '',
      'weekNumber':  WeekController.value.text.length == 1 ? "0"+WeekController.value.text : WeekController.value.text,
    };
    data = [];
    var Response = await connect.commonconnect(payload);
    isLoading.value = false;
    debugPrint("JobUpdateResponse: ${Response.toJson()}");

    if (!Response.error!) {

      for(int i =0; i< Response.data!.length;i++){

        print(""+i.toString()+"planned"+Response.data![i].planned!.length.toString());
        print(""+i.toString()+"actual"+Response.data![i].actual!.length.toString());
        print(""+i.toString()+"delayed"+Response.data![i].delayed!.length.toString());



      }

      JobUpdatestatus = Response;
      isLoading.value = false;
      data = Response.data!;
      update();
      return Response.data!;
    } else {
      return data;
    }
  }

  Future<List<dynamic>> exportexcelcall() async {
    isLoading.value = true;
    print(findTrueIndex(checkboxValues) == 0);
    print(findTrueIndex(checkboxValues) == 1);
    print(findTrueIndex(checkboxValues) == 2);
    //try {
    Map<String, dynamic> payload = {
      'Department': "",
      'checkbox': findTrueIndex(checkboxValues) == 0
          ? "Yesterday"
          : findTrueIndex(checkboxValues) == 1
              ? "Weekly"
              : findTrueIndex(checkboxValues) == 2
                  ? YearController.value.text
                  : '',
      'weekNumber': WeekController.value.text,
    };
    var Response = await connect.commonexportexcelconnect(payload);
    isLoading.value = false;
    debugPrint("ExportResponse: ${Response.toJson()}");
    if (!Response.error!) {
      ExportExcel = Response;
      isLoading.value = false;
      plannedProduction = Response.plannedProduction!;
      update();
      return Response.plannedProduction!;
    } else {
      return plannedProduction;
    }
  }
}
