import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../Controller/ManagementDashboardController/SalesreportController.dart';
import '../../Pojo/SalesReportResponse.dart';
import '../../api/theme_widget.dart';

class Salesreport extends GetView<SalesReportController> {
  Salesreport({Key? key}) : super(key: key);

  String showYear = 'Select Year';
  String showMonth = 'Select Month';
  DateTime _selectedyear = DateTime.now();
  DateTime selectedMonth = DateTime.now();



  SelectYear(context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select Date'),
            content: SizedBox(
              width: 300,
              height: 300,
              child: SfDateRangePicker(
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
                initialSelectedRange: PickerDateRange(
                    DateTime.now().subtract(const Duration(days: 4)),
                    DateTime.now().add(const Duration(days: 3))),
              ),
            ),
          );
        });
  }
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      controller.FromDateController.text =
      '${DateFormat('yyyy-MM-dd').format(args.value.startDate)}';
      controller.ToDateController.text =
      ' ${DateFormat('yyyy-MM-dd').format(
          args.value.endDate ?? args.value.startDate)}';
      // controller.OrderBookingCall();
    }
  }


  @override
  Widget build(BuildContext context) {
    SalesReportController controller =
    Get.put(SalesReportController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.SalesReportCall();
      controller.SalesReportexcelCall();
    });
    return GetBuilder<SalesReportController>(
        init: SalesReportController(),
        builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: Text('NADI'),
            backgroundColor: Colors.indigo.shade900,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios_rounded)),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'SALES REPORT',
                        style: TextStyle(
                            color: Colors.indigo.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: TextFormField(
                            readOnly: true,
                            keyboardType: TextInputType.none,
                            controller: controller.FromDateController,
                            onTap: () {
                              SelectYear(context);
                            },
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.calendar_today),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                labelText: 'From',
                                labelStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.0)))),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: TextFormField(
                            readOnly: true,
                            keyboardType: TextInputType.none,
                            controller: controller.ToDateController,
                            onTap: () {
                            },
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.calendar_today),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                labelText: 'To',
                                labelStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.0)))),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          controller.createExcel();
                          // controller.createFolderInAppDocDir("Nadi" +
                          //     DateTime.now().millisecondsSinceEpoch.toString());
                        },
                        label: Text('Export'),
                        icon: Icon(Icons.exit_to_app),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.indigo.shade900),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 2.8,
                      width: MediaQuery.of(context).size.width * 1.5,
                      // color: Colors.red,
                      child:Obx(()=> controller.isLoading.value ?
                      loadingWidget() : Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width:
                                    MediaQuery.of(context).size.width / 2 - 83,
                                child: Center(
                                    child: Text('Order Category',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ))),
                                decoration: BoxDecoration(
                                    color: Colors.indigo.shade900,
                                    border: Border(
                                        right: BorderSide(
                                          color: Colors.grey,
                                        ),
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                        ))),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Center(
                                    child: Text(
                                  'Order Type',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                                decoration: BoxDecoration(
                                    color: Colors.indigo.shade900,
                                    border: Border(
                                        right: BorderSide(color: Colors.grey),
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                        ))),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Center(
                                    child: Text('Total Qty (Nos)',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ))),
                                decoration: BoxDecoration(
                                    color: Colors.indigo.shade900,
                                    border: Border(
                                        right: BorderSide(color: Colors.grey),
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                        ))),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Center(
                                    child: Text('Order Released (INR)',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ))),
                                decoration: BoxDecoration(
                                    color: Colors.indigo.shade900,
                                    border: Border(
                                        right: BorderSide(color: Colors.grey),
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                        ))),
                              ),

                            ],
                          ),
                          Expanded(
                            child:Column(children: [
                              TableModel(context,controller.Salesdata.domestic),
                              TableModel2(context,controller.Salesdata.alstom),
                              TableModel3(context,controller.Salesdata.wabtecIndia),
                              TableModel4(context,controller.Salesdata.wabtecUSA),
                              TableModel5(context,controller.Salesdata.export),
                              TableModel6(context,controller.Salesdata.grandTotal),],)



                          ),
                        ],
                      ),)
                    ),
                  ),
                ),

                //TableModel(context),
              ],
            ),
          ));
    });
  }

  var name = ["Domestic", "Alstom", 'Wabtec India', 'Wabtec USA', "Export"];

  Widget TableModel(BuildContext context, Domestic? domestic) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.4,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2 - 83,
              child: Center(child: Text("Domestic",style: TextStyle(fontWeight: FontWeight.bold))),
              decoration: BoxDecoration(
                // color: Colors.yellowAccent,
                  border: Border(
                      bottom: BorderSide(color: Colors.grey),
                      left: BorderSide(color: Colors.grey))),
            ),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.4,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 1.2,
              // color: Colors.green,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text("Centrifugal")),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(
                            child: Text(domestic!.centrifugal!.saleOrderQty
                                .toString())),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(
                            child: Text(domestic!.centrifugal!.saleOrderValue
                                .toString())),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text('Axial')),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(domestic!.axial!.saleOrderQty
                            .toString())),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(domestic!.axial!.saleOrderValue
                            .toString())),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text('Spares')),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(domestic.spares!.saleOrderQty.toString())),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(domestic.spares!.saleOrderValue.toString())),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text('Domestic Total',style: TextStyle(fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(domestic.domesticTotal!.saleOrderQty.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(domestic.domesticTotal!.saleOrderValue.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget TableModel2(BuildContext context, Alstom? alstom) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.4,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2 - 83,
              child: Center(child: Text("Alstom",style: TextStyle(fontWeight: FontWeight.bold))),
              decoration: BoxDecoration(
                // color: Colors.yellowAccent,
                  border: Border(
                      bottom: BorderSide(color: Colors.grey),
                      left: BorderSide(color: Colors.grey))),
            ),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.4,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 1.2,
              // color: Colors.green,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text("Centrifugal")),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(
                            child: Text(alstom!.centrifugal!.saleOrderQty
                                .toString())),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(
                            child: Text(alstom!.centrifugal!.saleOrderValue
                                .toString())),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text('Axial')),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(alstom!.axial!.saleOrderQty
                            .toString())),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(alstom!.axial!.saleOrderValue
                            .toString())),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text('Spares')),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(alstom.spares!.saleOrderQty.toString())),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(alstom.spares!.saleOrderValue.toString())),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text('Domestic Total',style: TextStyle(fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(alstom.alstomTotal!.saleOrderQty.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(alstom.alstomTotal!.saleOrderValue.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget TableModel3(BuildContext context,   WabtecIndia? wabtecIndia) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.4,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2 - 83,
              child: Center(child: Text("WabtecIndia",style: TextStyle(fontWeight: FontWeight.bold))),
              decoration: BoxDecoration(
                // color: Colors.yellowAccent,
                  border: Border(
                      bottom: BorderSide(color: Colors.grey),
                      left: BorderSide(color: Colors.grey))),
            ),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.4,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 1.2,
              // color: Colors.green,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text("Centrifugal")),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(
                            child: Text(wabtecIndia!.centrifugal!.saleOrderQty
                                .toString())),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(
                            child: Text(wabtecIndia!.centrifugal!.saleOrderValue
                                .toString())),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text('Axial')),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(wabtecIndia!.axial!.saleOrderQty
                            .toString())),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(wabtecIndia!.axial!.saleOrderValue
                            .toString())),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text('Spares')),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(wabtecIndia.spares!.saleOrderQty.toString())),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(wabtecIndia.spares!.saleOrderValue.toString())),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text('Wabtec India Total',style: TextStyle(fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(wabtecIndia.wabtecIndiaTotal!.saleOrderQty.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(wabtecIndia.wabtecIndiaTotal!.saleOrderValue.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget TableModel4(BuildContext context,   WabtecUSA? wabtecUSA) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.4,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2 - 83,
              child: Center(child: Text("WabtecUSA",style: TextStyle(fontWeight: FontWeight.bold))),
              decoration: BoxDecoration(
                // color: Colors.yellowAccent,
                  border: Border(
                      bottom: BorderSide(color: Colors.grey),
                      left: BorderSide(color: Colors.grey))),
            ),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.4,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 1.2,
              // color: Colors.green,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text("Centrifugal")),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(
                            child: Text(wabtecUSA!.centrifugal!.saleOrderQty
                                .toString())),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(
                            child: Text(wabtecUSA!.centrifugal!.saleOrderValue
                                .toString())),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text('Axial')),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(wabtecUSA!.axial!.saleOrderQty
                            .toString())),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(wabtecUSA!.axial!.saleOrderValue
                            .toString())),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text('Spares')),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(wabtecUSA.spares!.saleOrderQty.toString())),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(wabtecUSA.spares!.saleOrderValue.toString())),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text('Wabtec USA Total',style: TextStyle(fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(wabtecUSA.wabtecUSATotal!.saleOrderQty.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(wabtecUSA.wabtecUSATotal!.saleOrderValue.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget TableModel5(BuildContext context, Export? export) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.4,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2 - 83,
              child: Center(child: Text("Export",style: TextStyle(fontWeight: FontWeight.bold))),
              decoration: BoxDecoration(
                // color: Colors.yellowAccent,
                  border: Border(
                      bottom: BorderSide(color: Colors.grey),
                      left: BorderSide(color: Colors.grey))),
            ),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.4,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 1.2,
              // color: Colors.green,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text("Centrifugal")),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(
                            child: Text(export!.centrifugal!.saleOrderQty
                                .toString())),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(
                            child: Text(export!.centrifugal!.saleOrderValue
                                .toString())),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text('Axial')),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(export!.axial!.saleOrderQty
                            .toString())),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(export!.axial!.saleOrderValue
                            .toString())),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text('Spares')),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(export.spares!.saleOrderQty.toString())),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(export.spares!.saleOrderValue.toString())),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text('Export Total',style: TextStyle(fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(export.exportTotal!.saleOrderQty.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text(export.exportTotal!.saleOrderValue.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget TableModel6(BuildContext context,  GrandTotal? grandTotal) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.1,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2 - 83,
              child: Center(child: Text("GrandTotal",style: TextStyle(fontWeight: FontWeight.bold))),
              decoration: BoxDecoration(
                // color: Colors.yellowAccent,
                  border: Border(
                      bottom: BorderSide(color: Colors.grey),
                      left: BorderSide(color: Colors.grey))),
            ),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.1,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 1.2,
              // color: Colors.green,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(child: Text("Total",style: TextStyle(fontWeight: FontWeight.bold))),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(
                            child: Text(grandTotal!.total!.saleOrderQty
                                .toString(),style: TextStyle(fontWeight: FontWeight.bold))),
                        decoration: BoxDecoration(
                          // color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.3,
                        child: Center(
                            child: Text(grandTotal!.total!.saleOrderValue
                                .toString(),style: TextStyle(fontWeight: FontWeight.bold))),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                            border:
                            Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                      ),

                    ],
                  ),


                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
