import 'package:code/Controller/ManagementDashboardController/ManagementPlanvsActualController.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:provider/provider.dart';
import '../../Provider/Dataprovider.dart';
import '../../Routes/app_routes.dart';

class ManagementPlanvsActualScreen
    extends GetView<ManagementPlanvsActualController> {
  ManagementPlanvsActualScreen({Key? key}) : super(key: key);

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
                    controller.JobUpdateCall();
                    controller.exportexcelcall();
                    Navigator.of(context).pop();
                  }),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    ManagementPlanvsActualController controller =
        Get.put(ManagementPlanvsActualController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.JobUpdateCall();
      controller.exportexcelcall();
    });
    controller.userdataprovider =
        Provider.of<DataProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(100, 70),
            child: AppBar(
              title: Text('NADI'),
              backgroundColor: Colors.indigo.shade900,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios_new_outlined)),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              child: Column(children: [
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'PLAN VS ACTUAL & DELAYED',
                        style: TextStyle(
                            color: Colors.indigo.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    controller.createExcel();
                                    print('button taped');
                                  },
                                  label: Text('Export'),
                                  icon: Icon(Icons.exit_to_app),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.indigo.shade900),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => Checkbox(
                                    activeColor: Colors.indigo.shade900,
                                    value: controller.checkboxValues[0].value,
                                    onChanged: (value) {
                                      controller.JobUpdateCall();
                                      controller.exportexcelcall();
                                      controller.handleCheckboxClicked(0);
                                      controller.WeekController.clear();
                                      controller.YearController.clear();
                                    }),
                              ),
                              Text('Yesterday'),
                              Obx(
                                () => Checkbox(
                                    activeColor: Colors.indigo.shade900,
                                    value: controller.checkboxValues[1].value,
                                    onChanged: (value) {
                                      controller.handleCheckboxClicked(1);
                                      controller.YearController
                                          .clear(); //handleCheckboxClicked(2);
                                    }),
                              ),
                              Text('Weekly'),
                              Obx(
                                () => Checkbox(
                                    activeColor: Colors.indigo.shade900,
                                    value: controller.checkboxValues[2].value,
                                    onChanged: (value) {
                                      controller.handleCheckboxClicked(2);
                                      controller.WeekController
                                          .clear(); //handleCheckboxClicked(2);
                                    }),
                              ),
                              Text('Annual'),
                            ],
                          ),
                          Obx(
                            () => Visibility(
                                visible: controller.checkboxValues[1].value,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 60, right: 60),
                                  child: TextFormField(
                                      controller: controller.WeekController,
                                      onFieldSubmitted: (value) {
                                        controller.JobUpdateCall();
                                        controller.exportexcelcall();
                                      },
                                      //onEditingComplete: controller.JobUpdateCall(),
                                      onTap: () {},
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                              decimal: false),
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          labelText: 'Week Number',
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10.0)))),
                                )),
                          ),
                          Obx(
                            () => Visibility(
                                visible: controller.checkboxValues[2].value,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 60, right: 60),
                                  child: TextFormField(
                                      keyboardType: TextInputType.none,
                                      controller: controller.YearController,
                                      onTap: () {
                                        SelectYear(context);
                                      },
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          labelText: 'Year',
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          suffixIcon:
                                              Icon(Icons.calendar_today),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10.0)))),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Obx(
                            () => controller.isLoading.value == true
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : controller.data.isNotEmpty
                                    ? SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Container(
                                            decoration: BoxDecoration(),
                                            child: DataTable(
                                              columnSpacing: 85,
                                              headingRowColor:
                                                  MaterialStateColor
                                                      .resolveWith(
                                                (states) =>
                                                    Colors.indigo.shade900,
                                              ),
                                              showCheckboxColumn: false,
                                              columns: [
                                                DataColumn(
                                                    label: Text(
                                                  'Department',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                                DataColumn(
                                                    label: Text(
                                                  'Planed Qty',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                                DataColumn(
                                                    label: Text(
                                                  'Actual Qty',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                                DataColumn(
                                                    label: Text(
                                                  'Delyed Qty',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                              ],
                                              rows: controller.data.map((item) {
                                                return DataRow(
                                                  cells: [
                                                    DataCell(Center(
                                                        child: Text(
                                                            item.department
                                                                    .toString() ??
                                                                "",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis))),
                                                    DataCell(
                                                        Center(
                                                            child: Text(
                                                                item.planned!
                                                                        .length
                                                                        .toString() ??
                                                                    "",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis)),
                                                        onTap: () {
                                                      controller
                                                          .userdataprovider
                                                          .setdatavalue(
                                                              item.department);
                                                      controller
                                                          .userdataprovider
                                                          .setPlannedData(
                                                              item.planned);
                                                      Get.toNamed(AppRoutes
                                                          .Alertpage.toName);
                                                    }),
                                                    DataCell(
                                                        Center(
                                                            child: Text(
                                                                item.actual!
                                                                        .length
                                                                        .toString() ??
                                                                    "",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis)),
                                                        onTap: () {
                                                      controller
                                                          .userdataprovider
                                                          .setdatavalue(
                                                              item.department);
                                                      controller
                                                          .userdataprovider
                                                          .setPlannedData(
                                                              item.actual);
                                                      Get.toNamed(AppRoutes
                                                          .Alertpage.toName);
                                                    }),
                                                    DataCell(
                                                        Center(
                                                            child: Text(
                                                                item.delayed!
                                                                        .length
                                                                        .toString() ??
                                                                    "",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis)),
                                                        onTap: () {
                                                      controller
                                                          .userdataprovider
                                                          .setdatavalue(
                                                              item.department);
                                                      controller
                                                          .userdataprovider
                                                          .setPlannedData(
                                                              item.delayed);
                                                      Get.toNamed(AppRoutes
                                                          .Alertpage.toName);
                                                    }),
                                                  ],
                                                );
                                              }).toList(),
                                            )),
                                      )
                                    : Center(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 100),
                                              Image.asset("asset/nodata.png"),
                                              SizedBox(height: 20),
                                            ],
                                          ),
                                        ),
                                      ),
                          )
                        ])),
              ]),
            ),
          )),
    );
  }
}
