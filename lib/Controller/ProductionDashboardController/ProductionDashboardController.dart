import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import '../../Pojo/JobUpdatesResponse.dart';
import '../../Pojo/Productiondashboardexcel.dart';
import '../../Provider/Dataprovider.dart';
import '../../api/api_connect.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';

class ProductionDashboardController extends GetxController {
  late DataProvider userDataProvider;
  RxString Department = RxString('');
  RxString Actual = RxString('');
  RxString Planed = RxString('');
  RxString Delyed = RxString('');

  TextEditingController WeekController = TextEditingController();
  TextEditingController YearController = TextEditingController();
  TextEditingController FromController = TextEditingController();
  TextEditingController ToController = TextEditingController();

  RxBool isLoading = RxBool(false);

  List<Data> data = [];
  List<ProductionData> productiondata = [];

  RxInt chart = RxInt(0);

  RxString buttomclicked = RxString('Production and Drawing');

  int findTrueIndex(List<RxBool> checkboxValues) {
    int index = checkboxValues.indexWhere((rxBool) => rxBool.value == true);
    return index;
  }

  final ApiConnect connect = Get.put(ApiConnect());

  JobUpdatesResponse JobUpdatestatus = JobUpdatesResponse();
  Productiondashboardexcel productionresponse = Productiondashboardexcel();

  final checkboxValues =
      <RxBool>[RxBool(true), RxBool(false), RxBool(false), RxBool(false)].obs;

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
    print('${data[chart.value].department.toString()}_Release_Date');
    sheet = workbook.worksheets.addWithName("data");

    if (productionresponse.data != null &&
        productionresponse.data!.isNotEmpty) {
      for (i = 0; i < productionresponse.data!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Fan Type");
          sheet.getRangeByName('E1').setText("Fan model");
          sheet.getRangeByName('F1').setText("Order Quantity");
          sheet.getRangeByName('G1').setText("EDD");
          sheet.getRangeByName('H1').setText('Production Drawing EDD');
          sheet.getRangeByName('I1').setText('Production_DG_Committed_Date');
          sheet.getRangeByName('J1').setText('ProductionDelay');
          sheet.getRangeByName('K1').setText('Production Remarks');
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(productionresponse.data![i].orderNum);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(productionresponse.data![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(productionresponse.data![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(productionresponse.data![i].fanType);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(productionresponse.data![i].fanModel);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(productionresponse.data![i].orderQty.toString());
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(productionresponse.data![i].eDD);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(productionresponse.data![i].productionDrawingEdd);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(productionresponse.data![i].productionDgCommittedDate);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(productionresponse.data![i].productionDelay.toString());
        sheet
            .getRangeByName("K" + (i + 2).toString())
            .setText(productionresponse.data![i].productionRemarks);
      }
    }

    if (productionresponse.data != null &&
        productionresponse.data!.isNotEmpty) {
      for (i = 0; i < productionresponse.data!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Fan Type");
          sheet.getRangeByName('E1').setText("Fan model");
          sheet.getRangeByName('F1').setText("Order Quantity");
          sheet.getRangeByName('G1').setText("EDD");
          sheet.getRangeByName('H1').setText('MOM_Planning_EDD');
          sheet.getRangeByName('I1').setText('MOM_Released_Date');
          sheet.getRangeByName('J1').setText('MOM Delay');
          sheet.getRangeByName('K1').setText('MOM Remarks');
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(productionresponse.data![i].orderNum);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(productionresponse.data![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(productionresponse.data![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(productionresponse.data![i].fanType);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(productionresponse.data![i].fanModel);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(productionresponse.data![i].orderQty.toString());
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(productionresponse.data![i].eDD);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(productionresponse.data![i].momPlanningEdd);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(productionresponse.data![i].momReleasedDate);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(productionresponse.data![i].momDelay.toString());
        sheet
            .getRangeByName("K" + (i + 2).toString())
            .setText(productionresponse.data![i].momRemarks);
      }
    }

    if (productionresponse.data != null &&
        productionresponse.data!.isNotEmpty) {
      for (i = 0; i < productionresponse.data!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Fan Type");
          sheet.getRangeByName('E1').setText("Fan model");
          sheet.getRangeByName('F1').setText("Order Quantity");
          sheet.getRangeByName('G1').setText("EDD");
          sheet.getRangeByName('H1').setText('CNC_EDD');
          sheet.getRangeByName('I1').setText('Drawing_Received_Date');
          sheet.getRangeByName('J1').setText('CNC_Completed_Date');
          sheet.getRangeByName('K1').setText('CNC Delay');
          sheet.getRangeByName('L1').setText('CNC_Remarks');
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(productionresponse.data![i].orderNum);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(productionresponse.data![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(productionresponse.data![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(productionresponse.data![i].fanType);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(productionresponse.data![i].fanModel);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(productionresponse.data![i].orderQty.toString());
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(productionresponse.data![i].eDD);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(productionresponse.data![i].cncEdd);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(productionresponse.data![i].drawingReceivedDate);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(productionresponse.data![i].cncCompletedDate);
        sheet
            .getRangeByName("K" + (i + 2).toString())
            .setText(productionresponse.data![i].cncDelay.toString());
        sheet
            .getRangeByName("L" + (i + 2).toString())
            .setText(productionresponse.data![i].cncRemarks);
      }
    }

    if (productionresponse.data != null &&
        productionresponse.data!.isNotEmpty) {
      for (i = 0; i < productionresponse.data!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Fan Type");
          sheet.getRangeByName('E1').setText("Fan model");
          sheet.getRangeByName('F1').setText("Order Quantity");
          sheet.getRangeByName('G1').setText("EDD");
          sheet.getRangeByName('H1').setText('Hub_EDD');
          sheet.getRangeByName('I1').setText('Hub_Issued_Date');
          sheet.getRangeByName('J1').setText('Hub Completed Date');
          sheet.getRangeByName('K1').setText('Hub Delay');
          sheet.getRangeByName('L1').setText('Hub Remarks');
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(productionresponse.data![i].orderNum);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(productionresponse.data![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(productionresponse.data![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(productionresponse.data![i].fanType);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(productionresponse.data![i].fanModel);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(productionresponse.data![i].orderQty.toString());
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(productionresponse.data![i].eDD);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(productionresponse.data![i].hubEdd);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(productionresponse.data![i].hubIssuedDate);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(productionresponse.data![i].hubCompletedDate);
        sheet
            .getRangeByName("K" + (i + 2).toString())
            .setText(productionresponse.data![i].hubDelay.toString());
        sheet
            .getRangeByName("L" + (i + 2).toString())
            .setText(productionresponse.data![i].hubRemarks);
      }
    }

    if (productionresponse.data != null &&
        productionresponse.data!.isNotEmpty) {
      for (i = 0; i < productionresponse.data!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Fan Type");
          sheet.getRangeByName('E1').setText("Fan model");
          sheet.getRangeByName('F1').setText("Order Quantity");
          sheet.getRangeByName('G1').setText("EDD");
          sheet.getRangeByName('H1').setText('Machining_EDD');
          sheet.getRangeByName('I1').setText('Machining_Issued_Date');
          sheet.getRangeByName('J1').setText('Machining_Completed_Date');
          sheet.getRangeByName('K1').setText('Machining Delay');
          sheet.getRangeByName('L1').setText('Machining_Remarks');
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(productionresponse.data![i].orderNum);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(productionresponse.data![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(productionresponse.data![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(productionresponse.data![i].fanType);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(productionresponse.data![i].fanModel);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(productionresponse.data![i].orderQty.toString());
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(productionresponse.data![i].eDD);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(productionresponse.data![i].machiningEdd);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(productionresponse.data![i].machiningIssuedDate);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(productionresponse.data![i].machiningCompletedDate);
        sheet
            .getRangeByName("K" + (i + 2).toString())
            .setText(productionresponse.data![i].machiningDelay.toString());
        sheet
            .getRangeByName("L" + (i + 2).toString())
            .setText(productionresponse.data![i].machiningRemarks);
      }
    }

    if (productionresponse.data != null &&
        productionresponse.data!.isNotEmpty) {
      for (i = 0; i < productionresponse.data!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Fan Type");
          sheet.getRangeByName('E1').setText("Fan model");
          sheet.getRangeByName('F1').setText("Order Quantity");
          sheet.getRangeByName('G1').setText("EDD");
          sheet.getRangeByName('H1').setText('Impeller_EDD');
          sheet.getRangeByName('I1').setText('Impeller_Issued_Date');
          sheet.getRangeByName('J1').setText('Impeller_Completed_Date');
          sheet.getRangeByName('K1').setText('Impeller Delay');
          sheet.getRangeByName('L1').setText('Impeller_Remarks');
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(productionresponse.data![i].orderNum);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(productionresponse.data![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(productionresponse.data![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(productionresponse.data![i].fanType);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(productionresponse.data![i].fanModel);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(productionresponse.data![i].orderQty.toString());
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(productionresponse.data![i].eDD);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(productionresponse.data![i].impellerEdd);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(productionresponse.data![i].impellerIssuedDate);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(productionresponse.data![i].impellerCompletedDate);
        sheet
            .getRangeByName("K" + (i + 2).toString())
            .setText(productionresponse.data![i].impellerDelay.toString());
        sheet
            .getRangeByName("L" + (i + 2).toString())
            .setText(productionresponse.data![i].impellerRemarks);
      }
    }

    if (productionresponse.data != null &&
        productionresponse.data!.isNotEmpty) {
      for (i = 0; i < productionresponse.data!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Fan Type");
          sheet.getRangeByName('E1').setText("Fan model");
          sheet.getRangeByName('F1').setText("Order Quantity");
          sheet.getRangeByName('G1').setText("EDD");
          sheet.getRangeByName('H1').setText('Casing_EDD');
          sheet.getRangeByName('I1').setText('Casing_Issued_Date');
          sheet.getRangeByName('J1').setText('Casing_Completed_Date');
          sheet.getRangeByName('K1').setText('Casing Delay Delay');
          sheet.getRangeByName('L1').setText('Casing_Remarks');
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(productionresponse.data![i].orderNum);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(productionresponse.data![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(productionresponse.data![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(productionresponse.data![i].fanType);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(productionresponse.data![i].fanModel);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(productionresponse.data![i].orderQty.toString());
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(productionresponse.data![i].eDD);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(productionresponse.data![i].casingEdd);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(productionresponse.data![i].casingIssuedDate);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(productionresponse.data![i].casingCompletedDate);
        sheet
            .getRangeByName("K" + (i + 2).toString())
            .setText(productionresponse.data![i].casingDelay.toString());
        sheet
            .getRangeByName("L" + (i + 2).toString())
            .setText(productionresponse.data![i].casingRemarks);
      }
    }

    if (productionresponse.data != null &&
        productionresponse.data!.isNotEmpty) {
      for (i = 0; i < productionresponse.data!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Fan Type");
          sheet.getRangeByName('E1').setText("Fan model");
          sheet.getRangeByName('F1').setText("Order Quantity");
          sheet.getRangeByName('G1').setText("EDD");
          sheet.getRangeByName('H1').setText('Casing_EDD');
          sheet.getRangeByName('I1').setText('Casing_Issued_Date');
          sheet.getRangeByName('J1').setText('Casing_Completed_Date');
          sheet.getRangeByName('K1').setText('Casing Delay Delay');
          sheet.getRangeByName('L1').setText('Casing_Remarks');
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(productionresponse.data![i].orderNum);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(productionresponse.data![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(productionresponse.data![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(productionresponse.data![i].fanType);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(productionresponse.data![i].fanModel);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(productionresponse.data![i].orderQty.toString());
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(productionresponse.data![i].eDD);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(productionresponse.data![i].casingEdd);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(productionresponse.data![i].casingIssuedDate);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(productionresponse.data![i].casingCompletedDate);
        sheet
            .getRangeByName("K" + (i + 2).toString())
            .setText(productionresponse.data![i].casingDelay.toString());
        sheet
            .getRangeByName("L" + (i + 2).toString())
            .setText(productionresponse.data![i].casingRemarks);
      }
    }

    if (productionresponse.data != null &&
        productionresponse.data!.isNotEmpty) {
      for (i = 0; i < productionresponse.data!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Fan Type");
          sheet.getRangeByName('E1').setText("Fan model");
          sheet.getRangeByName('F1').setText("Order Quantity");
          sheet.getRangeByName('G1').setText("EDD");
          sheet.getRangeByName('H1').setText('FirstCoatPaint EDD');
          sheet.getRangeByName('I1').setText('FirstCoatPaint Actual Date');
          sheet.getRangeByName('J1').setText('FirstCoatPaint Remarks');
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(productionresponse.data![i].orderNum);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(productionresponse.data![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(productionresponse.data![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(productionresponse.data![i].fanType);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(productionresponse.data![i].fanModel);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(productionresponse.data![i].orderQty.toString());
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(productionresponse.data![i].eDD);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(productionresponse.data![i].firstCoatPaintEdd);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(productionresponse.data![i].firstcoatpaintActualDate);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(productionresponse.data![i].firstCoatPaintRemarks);
      }
    }

    if (productionresponse.data != null &&
        productionresponse.data!.isNotEmpty) {
      for (i = 0; i < productionresponse.data!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Fan Type");
          sheet.getRangeByName('E1').setText("Fan model");
          sheet.getRangeByName('F1').setText("Order Quantity");
          sheet.getRangeByName('G1').setText("EDD");
          sheet.getRangeByName('H1').setText('Assembly_EDD');
          sheet.getRangeByName('I1').setText('Assembly_Actual_Date');
          sheet.getRangeByName('J1').setText('Assembly Remarks');
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(productionresponse.data![i].orderNum);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(productionresponse.data![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(productionresponse.data![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(productionresponse.data![i].fanType);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(productionresponse.data![i].fanModel);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(productionresponse.data![i].orderQty.toString());
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(productionresponse.data![i].eDD);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(productionresponse.data![i].assemblyEdd);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(productionresponse.data![i].assemblyActualDate);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(productionresponse.data![i].assemblyRemarks);
      }
    }

    if (productionresponse.data != null &&
        productionresponse.data!.isNotEmpty) {
      for (i = 0; i < productionresponse.data!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Fan Type");
          sheet.getRangeByName('E1').setText("Fan model");
          sheet.getRangeByName('F1').setText("Order Quantity");
          sheet.getRangeByName('G1').setText("EDD");
          sheet.getRangeByName('H1').setText('Testing_EDD');
          sheet.getRangeByName('I1').setText('Testing_Actual_Date');
          sheet.getRangeByName('J1').setText('Testing Remarks');
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(productionresponse.data![i].orderNum);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(productionresponse.data![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(productionresponse.data![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(productionresponse.data![i].fanType);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(productionresponse.data![i].fanModel);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(productionresponse.data![i].orderQty.toString());
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(productionresponse.data![i].eDD);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(productionresponse.data![i].testingEdd);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(productionresponse.data![i].testingActualDate);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(productionresponse.data![i].testingRemarks);
      }
    }

    if (productionresponse.data != null &&
        productionresponse.data!.isNotEmpty) {
      for (i = 0; i < productionresponse.data!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Fan Type");
          sheet.getRangeByName('E1').setText("Fan model");
          sheet.getRangeByName('F1').setText("Order Quantity");
          sheet.getRangeByName('G1').setText("EDD");
          sheet.getRangeByName('H1').setText('FinalPaint_EDD');
          sheet.getRangeByName('I1').setText('FinalPaint_Actual_Date');
          sheet.getRangeByName('J1').setText('FinalPaintRemarks');
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(productionresponse.data![i].orderNum);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(productionresponse.data![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(productionresponse.data![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(productionresponse.data![i].fanType);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(productionresponse.data![i].fanModel);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(productionresponse.data![i].orderQty.toString());
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(productionresponse.data![i].eDD);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(productionresponse.data![i].finalPaintEdd);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(productionresponse.data![i].finalpaintActualDate);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(productionresponse.data![i].finalPaintRemarks);
      }
    }

    if (productionresponse.data != null &&
        productionresponse.data!.isNotEmpty) {
      for (i = 0; i < productionresponse.data!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Fan Type");
          sheet.getRangeByName('E1').setText("Fan model");
          sheet.getRangeByName('F1').setText("Order Quantity");
          sheet.getRangeByName('G1').setText("EDD");
          sheet.getRangeByName('H1').setText('Packing_Dispatch_EDD');
          sheet.getRangeByName('I1').setText('Packing Date');
          sheet.getRangeByName('J1').setText('Packing Remarks');
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(productionresponse.data![i].orderNum);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(productionresponse.data![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(productionresponse.data![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(productionresponse.data![i].fanType);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(productionresponse.data![i].fanModel);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(productionresponse.data![i].orderQty.toString());
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(productionresponse.data![i].eDD);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(productionresponse.data![i].packingDispatchEdd);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(productionresponse.data![i].packingDate);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(productionresponse.data![i].packingRemarks);
      }
    }

    if (productionresponse.data != null &&
        productionresponse.data!.isNotEmpty) {
      for (i = 0; i < productionresponse.data!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Fan Type");
          sheet.getRangeByName('E1').setText("Fan model");
          sheet.getRangeByName('F1').setText("Order Quantity");
          sheet.getRangeByName('G1').setText("EDD");
          sheet.getRangeByName('H1').setText('Packing_Dispatch_EDD');
          sheet.getRangeByName('I1').setText('Dispatch Date');
          sheet.getRangeByName('J1').setText('Dispatch Remarks');
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(productionresponse.data![i].orderNum);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(productionresponse.data![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(productionresponse.data![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(productionresponse.data![i].fanType);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(productionresponse.data![i].fanModel);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(productionresponse.data![i].orderQty.toString());
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(productionresponse.data![i].eDD);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(productionresponse.data![i].packingDispatchEdd);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(productionresponse.data![i].dispatchDate);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(productionresponse.data![i].dispatchRemarks);
      }
    }

    if (productionresponse.data != null &&
        productionresponse.data!.isNotEmpty) {
      for (i = 0; i < productionresponse.data!.length; i++) {
        if (i == 0) {
          sheet.getRangeByName('A1').setText("Order Number");
          sheet.getRangeByName('B1').setText("Job Number");
          sheet.getRangeByName('C1').setText("Customer Name");
          sheet.getRangeByName('D1').setText("Fan Type");
          sheet.getRangeByName('E1').setText("Fan model");
          sheet.getRangeByName('F1').setText("Order Quantity");
          sheet.getRangeByName('G1').setText("EDD");
          sheet.getRangeByName('H1').setText('Accessories_EDD');
          sheet.getRangeByName('I1').setText('Accessories_Issued_Date');
          sheet.getRangeByName('J1').setText('Accessories_Completed_Date');
          sheet.getRangeByName('K1').setText('Accessories_Remarks');
        }

        sheet
            .getRangeByName("A" + (i + 2).toString())
            .setText(productionresponse.data![i].orderNum);
        sheet
            .getRangeByName("B" + (i + 2).toString())
            .setText(productionresponse.data![i].jobNum);
        sheet
            .getRangeByName("C" + (i + 2).toString())
            .setText(productionresponse.data![i].customerName);
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(productionresponse.data![i].fanType);
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(productionresponse.data![i].fanModel);
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(productionresponse.data![i].orderQty.toString());
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(productionresponse.data![i].eDD);
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(productionresponse.data![i].accessoriesEdd);
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(productionresponse.data![i].accessoriesIssuedDate);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(productionresponse.data![i].accessoriesCompletedDate);
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(productionresponse.data![i].accessoriesRemarks);
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
      final String fileName = '$path/Outputt.xlsx';
      final File file = File(fileName);
      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open(fileName);
    }
  }

  Future<List<dynamic>> productioncall() async {
    isLoading.value = true;
    print(findTrueIndex(checkboxValues) == 0);
    print(findTrueIndex(checkboxValues) == 1);
    print(findTrueIndex(checkboxValues) == 2);
    print(findTrueIndex(checkboxValues) == 3);
    //try {
    Map<String, dynamic> payload = {
      'Department': "",
      'checkbox': findTrueIndex(checkboxValues) == 0
          ? "Yesterday"
          : findTrueIndex(checkboxValues) == 1
              ? "Weekly"
              : findTrueIndex(checkboxValues) == 2
                  ? "Monthly"
                  : YearController.value.text,
      'weekNumber':  WeekController.value.text.length == 1 ? "0"+WeekController.value.text : WeekController.value.text,
      'fromDate': FromController.value.text,
      'toDate': ToController.value.text,
    };
    data = [];
    var Response = await connect.commonconnect(payload);
    // print("datas + ${Response.data![chart.value].delayed!.length}");
    isLoading.value = false;
    debugPrint("JobUpdateResponse: ${Response.toJson()}");

    if (!Response.error!) {
      JobUpdatestatus = Response;
      isLoading.value = false;
      // handleCheckboxClicked(0);
      data = Response.data!;
      print(chart.value);
      print("data + ${data[chart.value].planned!.length}");
      print("data + ${data[chart.value].actual!.length}");
      print("data + ${data[chart.value].delayed!.length}");
      update();
      return Response.data!;
    } else {
      return data;
    }
  }

  Future<List<dynamic>> productionexport() async {
    isLoading.value = true;
    print(findTrueIndex(checkboxValues) == 0);
    print(findTrueIndex(checkboxValues) == 1);
    print(findTrueIndex(checkboxValues) == 2);
    //try {
    Map<String, dynamic> payload = {
      'Department': buttomclicked.value.toString(),
      'checkbox': findTrueIndex(checkboxValues) == 0
          ? "Yesterday"
          : findTrueIndex(checkboxValues) == 1
              ? "Weekly"
              : findTrueIndex(checkboxValues) == 2
                  ? YearController.value.text
                  : '',
      'weekNumber': WeekController.value.text,
    };
    var Response = await connect.productionexcel(payload);
    isLoading.value = false;
    debugPrint("ExportResponse: ${Response.toJson()}");
    if (!Response.error!) {
      productionresponse = Response;
      isLoading.value = false;
      productiondata = Response.data!;
      update();
      return Response.data!;
    } else {
      return data;
    }
  }

  @override
  void onInit() async {
    super.onInit();
  }
}
