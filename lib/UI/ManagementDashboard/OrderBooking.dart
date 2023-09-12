import 'package:code/Pojo/OrderBookingResponse.dart';
import 'package:code/api/theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../Controller/ManagementDashboardController/OrderBookingController.dart';


class OrderBooking extends GetView<OrderBookingController> {
  OrderBooking({Key? key}) : super(key: key);
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
      controller.OrderBookingCall();  }
  }

  @override

  Widget build(BuildContext context) {
    OrderBookingController controller=Get.put(OrderBookingController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.OrderBookingCall();
      controller.OrderBookingexcelCall();
    });
    return GetBuilder<OrderBookingController>(
        init: OrderBookingController(),
        builder: (controller) {
          return
            Scaffold(
                appBar: AppBar(
                  title: Text('NADI'),
                  backgroundColor: Colors.indigo.shade900,
                  leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios_rounded)),
                ),
                body:
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'ORDER BOOKING',
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
                              padding: const EdgeInsets.only(
                                  right: 10, left: 10),
                              child: TextFormField(
                                  readOnly: true,
                                  onTap: () {
                                    SelectYear(context);
                                  },
                                  controller: controller.FromDateController,
                                  keyboardType: TextInputType.none,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.calendar_today),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black),
                                      ),
                                      labelText: 'From Date',
                                      labelStyle: TextStyle(
                                          color: Colors.black),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10.0)))),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, left: 10),
                              child: TextFormField(
                                  readOnly: true,
                                  keyboardType: TextInputType.none,
                                  controller: controller.ToDateController,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.black),
                                      ),
                                      labelText: 'To Date',
                                      labelStyle: TextStyle(
                                          color: Colors.black),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10.0)))),
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
                              onPressed: () {controller.createExcel();},
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
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 2.8,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 1.5,
                            // color: Colors.red,
                            child:
                           Obx(()=> controller.isLoading.value ?
                            loadingWidget() : Column(
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
                                      child: Center(
                                          child: Text('Order Category',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ))),
                                      decoration: BoxDecoration(
                                          color: Colors.indigo.shade900,
                                          border: Border(
                                              right: BorderSide(
                                                color: Colors.black,
                                              ),
                                              bottom: BorderSide(
                                                color: Colors.black,
                                              ))),
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
                                          child: Text(
                                            'Order Type',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          )),
                                      decoration: BoxDecoration(
                                          color: Colors.indigo.shade900,
                                          border: Border(
                                              right: BorderSide(
                                                  color: Colors.black),
                                              bottom: BorderSide(
                                                color: Colors.black,
                                              ))),
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
                                          child: Text('Total Qty (Nos)',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ))),
                                      decoration: BoxDecoration(
                                          color: Colors.indigo.shade900,
                                          border: Border(
                                              right: BorderSide(
                                                  color: Colors.black),
                                              bottom: BorderSide(
                                                color: Colors.black,
                                              ))),
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
                                          child: Text('Order Released (INR)',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ))),
                                      decoration: BoxDecoration(
                                          color: Colors.indigo.shade900,
                                          border: Border(
                                              right: BorderSide(
                                                  color: Colors.black),
                                              bottom: BorderSide(
                                                color: Colors.black,
                                              ))),
                                    ),

                                  ],
                                ),
                                Expanded(
                                    child: Column(
                                      children: [
                                        TableModel(context,
                                            controller.Orderdata.domestic),
                                        TableModel2(context,
                                            controller.Orderdata.alstom),
                                        TableModel3(context,
                                            controller.Orderdata.wabtecIndia),
                                        TableModel4(context,
                                            controller.Orderdata.wabtecUSA),
                                        TableModel5(context,
                                            controller.Orderdata.export),
                                        TableModel6(context,
                                            controller.Orderdata.grandTotal),
                                      ],
                                    )),
                              ],
                            ),
                           )
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            );

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
                            child: Text(domestic!.centrifugal!.bookedOrderQty
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
                            child: Text(domestic!.centrifugal!.bookedOrderValue
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
                        child: Center(child: Text(domestic!.axial!.bookedOrderQty
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
                        child: Center(child: Text(domestic!.axial!.bookedOrderValue
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
                        child: Center(child: Text(domestic.spares!.bookedOrderQty.toString())),
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
                        child: Center(child: Text(domestic.spares!.bookedOrderValue.toString())),
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
                        child: Center(child: Text(domestic.domesticTotal!.bookedOrderQty.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
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
                        child: Center(child: Text(domestic.domesticTotal!.bookedOrderValue.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
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
                            child: Text(alstom!.centrifugal!.bookedOrderQty
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
                            child: Text(alstom!.centrifugal!.bookedOrderValue
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
                        child: Center(child: Text(alstom!.axial!.bookedOrderQty
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
                        child: Center(child: Text(alstom!.axial!.bookedOrderValue
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
                        child: Center(child: Text(alstom.spares!.bookedOrderQty.toString())),
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
                        child: Center(child: Text(alstom.spares!.bookedOrderValue.toString())),
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
                        child: Center(child: Text(alstom.alstomTotal!.bookedOrderQty.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
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
                        child: Center(child: Text(alstom.alstomTotal!.bookedOrderValue.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
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
                            child: Text(wabtecIndia!.centrifugal!.bookedOrderQty
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
                            child: Text(wabtecIndia!.centrifugal!.bookedOrderValue
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
                        child: Center(child: Text(wabtecIndia!.axial!.bookedOrderQty
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
                        child: Center(child: Text(wabtecIndia!.axial!.bookedOrderValue
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
                        child: Center(child: Text(wabtecIndia.spares!.bookedOrderQty.toString())),
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
                        child: Center(child: Text(wabtecIndia.spares!.bookedOrderValue.toString())),
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
                        child: Center(child: Text(wabtecIndia.wabtecIndiaTotal!.bookedOrderQty.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
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
                        child: Center(child: Text(wabtecIndia.wabtecIndiaTotal!.bookedOrderValue.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
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
                            child: Text(wabtecUSA!.centrifugal!.bookedOrderQty
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
                            child: Text(wabtecUSA!.centrifugal!.bookedOrderValue
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
                        child: Center(child: Text(wabtecUSA!.axial!.bookedOrderQty
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
                        child: Center(child: Text(wabtecUSA!.axial!.bookedOrderValue
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
                        child: Center(child: Text(wabtecUSA.spares!.bookedOrderQty.toString())),
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
                        child: Center(child: Text(wabtecUSA.spares!.bookedOrderValue.toString())),
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
                        child: Center(child: Text(wabtecUSA.wabtecUSATotal!.bookedOrderQty.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
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
                        child: Center(child: Text(wabtecUSA.wabtecUSATotal!.bookedOrderValue.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
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
                            child: Text(export!.centrifugal!.bookedOrderQty
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
                            child: Text(export!.centrifugal!.bookedOrderValue
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
                        child: Center(child: Text(export!.axial!.bookedOrderQty
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
                        child: Center(child: Text(export!.axial!.bookedOrderValue
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
                        child: Center(child: Text(export.spares!.bookedOrderQty.toString())),
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
                        child: Center(child: Text(export.spares!.bookedOrderValue.toString())),
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
                        child: Center(child: Text(export.exportTotal!.bookedOrderQty.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
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
                        child: Center(child: Text(export.exportTotal!.bookedOrderValue.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
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
                            child: Text(grandTotal!.total!.bookedOrderQty
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
                            child: Text(grandTotal!.total!.bookedOrderValue
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
