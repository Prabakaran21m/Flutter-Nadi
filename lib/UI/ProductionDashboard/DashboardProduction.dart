import 'package:code/Controller/ManagementDashboardController/DashboardScreenController.dart';
import 'package:code/Routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ProductionDashboard.dart';
import 'ProductionPlanvsActualScreen.dart';

class DashBoardProduction extends GetView<DashboardScreenController> {
  DashBoardProduction({super.key});

  List Name = [
    'DRAWING',
    'PLAN VS ACTUAL',
  ];
  List Assets = [
    AssetImage('asset/Monthly.png'),
    AssetImage('asset/Planed.png'),
  ];

  @override
  Widget build(BuildContext context) {
    DashboardScreenController controller = Get.put(DashboardScreenController());
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
      body: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'DASHBOARD',
                  style: TextStyle(
                      color: Colors.indigo.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 2,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => productiondashboard()),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProductionPlanvsActualScreen()),
                            );
                          }
                        },
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Image(
                                image: Assets[index],
                                height: 80,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                Name[index],
                                style: TextStyle(
                                    color: Colors.indigo.shade900,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2.0,
                                blurRadius: 2.0,
                                offset:
                                    Offset(0, 2), // Set the elevation values
                              ),
                            ],
                            color: Colors.white,
                          ),
                          height: 150,
                          width: 150,
                        ),
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
