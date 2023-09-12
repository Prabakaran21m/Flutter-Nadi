import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../Controller/ManagementDashboardController/AlertPageController.dart';
import '../../Provider/Dataprovider.dart';

class Alertpage extends GetView<MenuPageController> {
  Alertpage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MenuPageController controller = Get.put(MenuPageController());
    controller.userDataProvider =
        Provider.of<DataProvider>(context, listen: false);

    return GetBuilder<MenuPageController>(
        init: MenuPageController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.indigo.shade900,
                  title: Text('NADI'),
                  leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios_rounded)),
                ),
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          ('${controller.userDataProvider.departmentvalue.toString()} :'),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                            'Total Jobs -${controller.userDataProvider.PlannedValue!.length}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() => controller.isLoading.value == true
                        ? const Center(child: CircularProgressIndicator())
                        : controller.userDataProvider.PlannedValue!.isNotEmpty
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DataTable(
                                    border: TableBorder.all(),
                                    columnSpacing: 20,
                                    columns: [
                                      DataColumn(
                                          label: Text(
                                        'Job Number	',
                                        style: TextStyle(color: Colors.black),
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'Customer Name	',
                                        style: TextStyle(color: Colors.black),
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'Fan Model	',
                                        style: TextStyle(color: Colors.black),
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'Qty',
                                        style: TextStyle(color: Colors.black),
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                    ],
                                    rows: controller
                                        .userDataProvider.PlannedValue!
                                        .map((item) {
                                      return DataRow(cells: [
                                        DataCell(Text(
                                          item.jobNum.toString() ?? "",
                                          style: TextStyle(color: Colors.black),
                                        )),
                                        DataCell(Text(
                                            item.customerName.toString() ?? "",
                                            style: TextStyle(
                                                color: Colors.black))),
                                        DataCell(Text(
                                            item.fanModel.toString() ?? "",
                                            style: TextStyle(
                                                color: Colors.black))),
                                        DataCell(Text(
                                            item.orderQty.toString() ?? "",
                                            style: TextStyle(
                                                color: Colors.black))),
                                      ]);
                                    }).toList(),
                                  ),
                                ),
                              )
                            : Center(
                                child: Container(
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 100),
                                        Center(
                                          child: Text(
                                            "There is No Job. Total Qty is 'ZERO'",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                        // Image.asset("asset/nodata.png"),
                                        SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                  ]),
                )),
          );
        });
  }
}
