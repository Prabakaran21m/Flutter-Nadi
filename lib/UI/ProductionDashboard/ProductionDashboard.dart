import 'package:code/Controller/ProductionDashboardController/ProductionDashboardController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Provider/Dataprovider.dart';

class productiondashboard extends GetView<ProductionDashboardController> {
  productiondashboard({Key? key}) : super(key: key);

  late DateTime selectedDate;

  Future<void> selectFromDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Colors.indigo.shade900,
              colorScheme: ColorScheme.light(primary: Colors.indigo.shade900)
                  .copyWith(secondary: Colors.indigo.shade900),
            ),
            child: child!,
          );
        });
    if (picked != null) {
      controller.FromController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  Future<void> selectToDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Colors.indigo.shade900,
              colorScheme: ColorScheme.light(primary: Colors.indigo.shade900)
                  .copyWith(secondary: Colors.indigo.shade900),
            ),
            child: child!,
          );
        });
    if (picked != null) {
      controller.ToController.text = DateFormat('yyyy-MM-dd').format(picked);
      controller.productioncall();
      controller.productionexport();
    }
  }

  DateTime _selectedyear = DateTime.now();

  String showYear = 'Select Year';

  SelectYear(context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select Year'),
            content: SizedBox(
              width: 300,
              height: 300,
              child: YearPicker(
                  firstDate: DateTime(DateTime.now().year - 100, 1),
                  lastDate: DateTime(2025),
                  initialDate: DateTime.now(),
                  selectedDate: _selectedyear,
                  onChanged: (DateTime dateTime) {
                    _selectedyear = dateTime;
                    showYear = "${dateTime.year}";
                    controller.YearController.text = showYear.toString();
                    controller.productioncall();
                    controller.productionexport();
                    Navigator.of(context).pop();
                  }),
            ),
          );
        });
  }

  bool isScrollable = true;

  @override
  Widget build(BuildContext context) {
    ProductionDashboardController controller =
        Get.put(ProductionDashboardController());
    controller.userDataProvider =
        Provider.of<DataProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.productioncall();
      controller.productionexport();
    });
    return GetBuilder<ProductionDashboardController>(
        init: ProductionDashboardController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFF153C86),
                title: Text('NADI'),
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_rounded)),
              ),
              body: Obx(
                () => controller.isLoading.value == true
                    ? const Center(child: CircularProgressIndicator())
                    : controller.data.isNotEmpty
                        ? SingleChildScrollView(
                            child: Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Obx(() => TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: controller
                                                          .buttomclicked
                                                          .value ==
                                                      "Production and Drawing"
                                                  ? Colors.indigo.shade900
                                                  : Colors.grey.shade500,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          onPressed: () {
                                            controller.buttomclicked.value =
                                                'Production and Drawing';
                                            controller.chart.value = 0;
                                            controller.productioncall();
                                            controller.productionexport();
                                          },
                                          child: Text(
                                            controller.data[0].department
                                                .toString(),
                                            style: TextStyle(
                                                // color: Colors.indigo.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Obx(() => TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: controller
                                                          .buttomclicked
                                                          .value ==
                                                      "MOM"
                                                  ? Colors.indigo.shade900
                                                  : Colors.grey.shade500,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          onPressed: () {
                                            controller.buttomclicked.value =
                                                'MOM';
                                            controller.chart.value = 1;
                                            controller.productioncall();
                                            controller.productionexport();
                                          },
                                          child: Text(
                                            controller.data[1].department
                                                .toString(),
                                            style: TextStyle(
                                                // color: Colors.indigo.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Obx(() => TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: controller
                                                          .buttomclicked
                                                          .value ==
                                                      "CNC"
                                                  ? Colors.indigo.shade900
                                                  : Colors.grey.shade500,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          onPressed: () {
                                            controller.buttomclicked.value =
                                                'CNC';
                                            controller.chart.value = 2;
                                            controller.productioncall();
                                            controller.productionexport();
                                          },
                                          child: Text(
                                            controller.data[2].department
                                                .toString(),
                                            style: TextStyle(
                                                // color: Colors.indigo.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Obx(() => TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: controller
                                                          .buttomclicked
                                                          .value ==
                                                      "Hub"
                                                  ? Colors.indigo.shade900
                                                  : Colors.grey.shade500,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          onPressed: () {
                                            controller.buttomclicked.value =
                                                'Hub';
                                            controller.chart.value = 3;
                                            controller.productioncall();
                                            controller.productionexport();
                                          },
                                          child: Text(
                                            controller.data[3].department
                                                .toString(),
                                            style: TextStyle(
                                                // color: Colors.indigo.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Obx(() => TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: controller
                                                          .buttomclicked
                                                          .value ==
                                                      "Machining"
                                                  ? Colors.indigo.shade900
                                                  : Colors.grey.shade500,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          onPressed: () {
                                            controller.buttomclicked.value =
                                                'Machining';
                                            controller.chart.value = 4;
                                            controller.productioncall();
                                            controller.productionexport();
                                          },
                                          child: Text(
                                            controller.data[4].department
                                                .toString(),
                                            style: TextStyle(
                                                // color: Colors.indigo.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Obx(() => TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: controller
                                                          .buttomclicked
                                                          .value ==
                                                      "Impeller"
                                                  ? Colors.indigo.shade900
                                                  : Colors.grey.shade500,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          onPressed: () {
                                            controller.buttomclicked.value =
                                                'Impeller';
                                            controller.chart.value = 5;
                                            controller.productioncall();
                                            controller.productionexport();
                                          },
                                          child: Text(
                                            controller.data[5].department
                                                .toString(),
                                            style: TextStyle(
                                                // color: Colors.indigo.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Obx(() => TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: controller
                                                          .buttomclicked
                                                          .value ==
                                                      "Casing"
                                                  ? Colors.indigo.shade900
                                                  : Colors.grey.shade500,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          onPressed: () {
                                            controller.buttomclicked.value =
                                                'Casing';
                                            controller.chart.value = 6;
                                            controller.productioncall();
                                            controller.productionexport();
                                          },
                                          child: Text(
                                            controller.data[6].department
                                                .toString(),
                                            style: TextStyle(
                                                // color: Colors.indigo.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Obx(() => TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: controller
                                                          .buttomclicked
                                                          .value ==
                                                      "First Coat Paint"
                                                  ? Colors.indigo.shade900
                                                  : Colors.grey.shade500,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          onPressed: () {
                                            controller.buttomclicked.value =
                                                'First Coat Paint';
                                            controller.chart.value = 7;
                                            controller.productioncall();
                                            controller.productionexport();
                                          },
                                          child: Text(
                                            controller.data[8].department
                                                .toString(),
                                            style: TextStyle(
                                                // color: Colors.indigo.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Obx(() => TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: controller
                                                          .buttomclicked
                                                          .value ==
                                                      "Assembly"
                                                  ? Colors.indigo.shade900
                                                  : Colors.grey.shade500,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          onPressed: () {
                                            controller.buttomclicked.value =
                                                'Assembly';
                                            controller.chart.value = 8;
                                            controller.productioncall();
                                            controller.productionexport();
                                          },
                                          child: Text(
                                            controller.data[9].department
                                                .toString(),
                                            style: TextStyle(
                                                // color: Colors.indigo.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Obx(() => TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: controller
                                                          .buttomclicked
                                                          .value ==
                                                      "Testing"
                                                  ? Colors.indigo.shade900
                                                  : Colors.grey.shade500,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          onPressed: () {
                                            controller.buttomclicked.value =
                                                'Testing';
                                            controller.chart.value = 9;
                                            controller.productioncall();
                                            controller.productionexport();
                                          },
                                          child: Text(
                                            controller.data[10].department
                                                .toString(),
                                            style: TextStyle(
                                                // color: Colors.indigo.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Obx(() => TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: controller
                                                          .buttomclicked
                                                          .value ==
                                                      "Final Paint"
                                                  ? Colors.indigo.shade900
                                                  : Colors.grey.shade500,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          onPressed: () {
                                            controller.buttomclicked.value =
                                                'Final Paint';
                                            controller.chart.value = 10;
                                            controller.productioncall();
                                            controller.productionexport();
                                          },
                                          child: Text(
                                            controller.data[11].department
                                                .toString(),
                                            style: TextStyle(
                                                // color: Colors.indigo.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Obx(() => TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: controller
                                                          .buttomclicked
                                                          .value ==
                                                      "Packing"
                                                  ? Colors.indigo.shade900
                                                  : Colors.grey.shade500,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          onPressed: () {
                                            controller.buttomclicked.value =
                                                'Packing';
                                            controller.chart.value = 11;
                                            controller.productioncall();
                                            controller.productionexport();
                                          },
                                          child: Text(
                                            controller.data[12].department
                                                .toString(),
                                            style: TextStyle(
                                                // color: Colors.indigo.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Obx(() => TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: controller
                                                          .buttomclicked
                                                          .value ==
                                                      "Dispatch"
                                                  ? Colors.indigo.shade900
                                                  : Colors.grey.shade500,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          onPressed: () {
                                            controller.buttomclicked.value =
                                                'Dispatch';
                                            controller.chart.value = 12;
                                            controller.productioncall();
                                            controller.productionexport();
                                          },
                                          child: Text(
                                            controller.data[13].department
                                                .toString(),
                                            style: TextStyle(
                                                // color: Colors.indigo.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Obx(() => TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: controller
                                                          .buttomclicked
                                                          .value ==
                                                      "Accessories"
                                                  ? Colors.indigo.shade900
                                                  : Colors.grey.shade500,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          onPressed: () {
                                            controller.buttomclicked.value =
                                                'Accessories';
                                            controller.chart.value = 13;
                                            controller.productioncall();
                                            controller.productionexport();
                                          },
                                          child: Text(
                                            controller.data[7].department
                                                .toString(),
                                            style: TextStyle(
                                                // color: Colors.indigo.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              controller.isLoading.value == true
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : controller.data.isNotEmpty
                                      ? Column(children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  controller
                                                      .buttomclicked.value,
                                                  style: TextStyle(
                                                      color: Colors
                                                          .indigo.shade900,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ElevatedButton.icon(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.indigo
                                                                    .shade900),
                                                    onPressed: () {
                                                      controller.createExcel();
                                                    },
                                                    icon:
                                                        Icon(Icons.exit_to_app),
                                                    label: Text('EXPORT')),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Obx(
                                                () => Checkbox(
                                                    activeColor:
                                                        Colors.indigo.shade900,
                                                    value: controller
                                                        .checkboxValues[0]
                                                        .value,
                                                    onChanged: (value) {

                                                      controller .handleCheckboxClicked(
                                                              0);
                                                      controller
                                                          .productioncall();
                                                      controller
                                                          .productionexport();

                                                      controller.YearController
                                                          .clear();
                                                      controller.ToController
                                                          .clear();
                                                      controller.FromController
                                                          .clear();
                                                      controller.WeekController
                                                          .clear();
                                                    }),
                                              ),
                                              Text('Yesterday'),
                                              Obx(
                                                () => Checkbox(
                                                    activeColor:
                                                        Colors.indigo.shade900,
                                                    value: controller
                                                        .checkboxValues[1]
                                                        .value,
                                                    onChanged: (value) {
                                                      controller
                                                          .handleCheckboxClicked(
                                                              1);

                                                      controller.FromController
                                                          .clear();
                                                      controller.ToController
                                                          .clear();
                                                      controller.YearController
                                                          .clear();
                                                    }),
                                              ),
                                              Text('Weekly'),
                                            ],
                                          ),
                                          Obx(
                                            () => Visibility(
                                                visible: controller
                                                    .checkboxValues[1].value,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 60, right: 60),
                                                  child: TextFormField(
                                                      controller: controller
                                                          .WeekController,
                                                      onFieldSubmitted:
                                                          (value) {
                                                        controller
                                                            .productioncall();
                                                        controller
                                                            .productionexport();
                                                      },
                                                      onTap: () {},
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(
                                                              decimal: false),
                                                      decoration:
                                                          InputDecoration(
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              labelText:
                                                                  'Week Number',
                                                              labelStyle: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0)))),
                                                )),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Obx(
                                                () => Checkbox(
                                                    activeColor:
                                                        Colors.indigo.shade900,
                                                    value: controller
                                                        .checkboxValues[2]
                                                        .value,
                                                    onChanged: (value) {
                                                      controller
                                                          .handleCheckboxClicked(
                                                              2);
                                                      controller.WeekController
                                                          .clear();
                                                      controller.YearController
                                                          .clear();
                                                    }),
                                              ),
                                              Text('Monthly  '),
                                              Obx(
                                                () => Checkbox(
                                                    activeColor:
                                                        Colors.indigo.shade900,
                                                    value: controller
                                                        .checkboxValues[3]
                                                        .value,
                                                    onChanged: (value) {
                                                      controller
                                                          .handleCheckboxClicked(
                                                              3);
                                                      controller.WeekController
                                                          .clear();
                                                      controller.FromController
                                                          .clear();
                                                      controller.ToController
                                                          .clear(); //handleCheckboxClicked(2);
                                                    }),
                                              ),
                                              Text('Annual'),
                                            ],
                                          ),
                                          Obx(
                                            () => Visibility(
                                              visible: controller
                                                  .checkboxValues[2].value,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10,
                                                              left: 10),
                                                      child: TextFormField(
                                                          readOnly: true,
                                                          keyboardType:
                                                              TextInputType
                                                                  .none,
                                                          controller: controller
                                                              .FromController,
                                                          onTap: () {
                                                            selectFromDate(
                                                                context);
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                                  suffixIcon:
                                                                      Icon(Icons
                                                                          .calendar_today),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.black),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.black),
                                                                  ),
                                                                  labelText:
                                                                      'From',
                                                                  labelStyle:
                                                                      TextStyle(
                                                                          color: Colors
                                                                              .black),
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0)))),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10,
                                                              left: 10),
                                                      child: TextFormField(
                                                          readOnly: true,
                                                          keyboardType:
                                                              TextInputType
                                                                  .none,
                                                          controller: controller
                                                              .ToController,
                                                          onTap: () {
                                                            selectToDate(
                                                                context);
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                                  suffixIcon:
                                                                      Icon(Icons
                                                                          .calendar_today),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.black),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.black),
                                                                  ),
                                                                  labelText:
                                                                      'To',
                                                                  labelStyle:
                                                                      TextStyle(
                                                                          color: Colors
                                                                              .black),
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0)))),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Obx(
                                            () => Visibility(
                                                visible: controller
                                                    .checkboxValues[3].value,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 60, right: 60),
                                                  child: TextFormField(
                                                      keyboardType:
                                                          TextInputType.none,
                                                      controller: controller
                                                          .YearController,
                                                      onTap: () {
                                                        SelectYear(context);
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              labelText: 'Year',
                                                              labelStyle: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              suffixIcon: Icon(Icons
                                                                  .calendar_today),
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0)))),
                                                )),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: SfCartesianChart(
                                              title: ChartTitle(
                                                  text: controller
                                                      .buttomclicked.value,
                                                  textStyle:
                                                      TextStyle(fontSize: 10)),
                                              primaryXAxis: CategoryAxis(),
                                              series: [
                                                ColumnSeries<ChartData,
                                                    dynamic>(
                                                  dataSource: <ChartData>[
                                                    ChartData(
                                                        'PLANNED',
                                                        controller
                                                            .data[controller
                                                                .chart.value]
                                                            .planned!
                                                            .length ?? 0)
                                                  ],
                                                  xValueMapper:
                                                      (ChartData ch, _) => ch.x,
                                                  yValueMapper:
                                                      (ChartData ch, _) => ch.y,
                                                ),
                                                ColumnSeries<ChartData,
                                                    dynamic>(
                                                  dataSource: <ChartData>[
                                                    ChartData(
                                                        'ACTUAL',
                                                        controller
                                                            .data[controller
                                                                .chart.value]
                                                            .actual!
                                                            .length ?? 0)
                                                  ],
                                                  xValueMapper:
                                                      (ChartData ch, _) => ch.x,
                                                  yValueMapper:
                                                      (ChartData ch, _) => ch.y,
                                                ),
                                                ColumnSeries<ChartData,
                                                    dynamic>(
                                                  dataSource: <ChartData>[
                                                    ChartData(
                                                        'DELAY ',
                                                        controller
                                                            .data[controller
                                                                .chart.value]
                                                            .delayed!
                                                            .length ?? 0)
                                                  ],
                                                  xValueMapper:
                                                      (ChartData ch, _) => ch.x,
                                                  yValueMapper:
                                                      (ChartData ch, _) => ch.y,
                                                )
                                              ],
                                            ),
                                          ),
                                        ])
                                      : Container()
                            ],
                          ))
                        : Center(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 100),
                                  Image.asset("asset/nodata.png"),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
              ));
        });
  }
}

class ChartData {
  final String x;
  final int y;

  ChartData(this.x, this.y);
}
