import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:code/ApiCall/api_Calls.dart';
import 'package:code/Json_Response/DashBoard/JobUpdates.dart';
import 'package:code/Json_Response/PRODUCTION_DASHBOARD/DomesticFans.dart';
import 'package:code/Json_Response/PRODUCTION_DASHBOARD/GEExportFans.dart';
import 'package:code/scrollView.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'ApiCall/ApiClass.dart';
import 'AppTab.dart';
import 'Json_Response/PRODUCTION_DASHBOARD//ProcessPendingFans.dart';
import 'Json_Response/PRODUCTION_DASHBOARD/AlstomFans.dart';
import 'Json_Response/PRODUCTION_DASHBOARD/BarcFans.dart';
import 'Json_Response/PRODUCTION_DASHBOARD/DelayedProcess.dart';
import 'Json_Response/PRODUCTION_DASHBOARD/DispatchQuantity.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'key.dart';

// Define data structure for a bar group
class DataItem {
  String readyToDispatch;
  String disptached;

  DataItem(this.readyToDispatch, this.disptached);
}

class quantity {
  plannedvalues planned;
  actualvalues actual;
  delayedvalues delayed;

  quantity(this.planned, this.actual, this.delayed);
}

class quantity1 {
  plannedvalues1 planned1;
  actualvalues1 actual1;
  delayedvalues1 delayed1;

  quantity1(this.planned1, this.actual1, this.delayed1);
}

class plannedvalues {
  String PlannedCategories;
  int PlannedNumbers;

  plannedvalues(this.PlannedCategories, this.PlannedNumbers);
}

class plannedvalues1 {
  String PlannedCategories1;
  int PlannedNumbers1;

  plannedvalues1(this.PlannedCategories1, this.PlannedNumbers1);
}

class actualvalues {
  String ActualCategories;
  int ActualNumbers;

  actualvalues(this.ActualCategories, this.ActualNumbers);
}

class actualvalues1 {
  String ActualCategories1;
  int ActualNumbers1;

  actualvalues1(this.ActualCategories1, this.ActualNumbers1);
}

class delayedvalues {
  String DelayedCategories;
  int DelayedNumbers;

  delayedvalues(this.DelayedCategories, this.DelayedNumbers);
}

class delayedvalues1 {
  String DelayedCategories1;
  int DelayedNumbers1;

  delayedvalues1(this.DelayedCategories1, this.DelayedNumbers1);
}

class Pie {
  String quantity;
  Color color;

  Pie(this.quantity, this.color);
}

class Pie2 {
  String quantity;
  Color color;

  Pie2(this.quantity, this.color);
}

class Pie3 {
  String quantity;
  Color color;

  Pie3(this.quantity, this.color);
}

class Pie4 {
  String quantity;
  Color color;

  Pie4(this.quantity, this.color);
}

int x = 1;
int x2 = 0;
int x3 = 0;

class dashbord extends StatefulWidget {
  dashbord({Key? key}) : super(key: key);

  @override
  State<dashbord> createState() => _dashbord();
}

class _dashbord extends State<dashbord> {
  late final TabController _tabController;
  int _selectedTabIndex = 0;
  int pagenumber = 1;
  api_Calls api_calls = new api_Calls();
  List<Dataquantity> data = [];
  List<Datas> datas = [];
  List<JobUpdatesData> jobupdatedatas = [];
  int counter = 0;

  void _refreshData() {
    setState(() {
      counter = DateTime.now().millisecond;
    });
  }

  List<ChartData1> chartData1 = [];
  List<ReadyToDispatch> readyToDispatch = [];
  List<Disptached> disptached = [];
  List<Delay> bar4 = [];
  List<Domestic> domesticfan = [];
  List<GeExport> geexportfan = [];
  List<Alstom> alstomfan = [];
  List<Barc> barcfan = [];
  List<DataItem> _Twobar = [];
  List<quantity> val = [];
  List<quantity> val1 = [];
  List<quantity1> chartData = [];

  List<quantity> search = [];
  List<String>? jobvalues = [];

  late TooltipBehavior _tooltipBehavior;

  TextEditingController weeklyController = TextEditingController();
  TextEditingController annualController = TextEditingController();
  TextEditingController weeklyController1 = TextEditingController();
  TextEditingController annualController1 = TextEditingController();
  int value = 0;

  void UpdateIndex(int index) async {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  //  14 tabBar lists
  List<Keyvalues> tabList = <Keyvalues>[
    Keyvalues(key: "0 ", value: "Production and Drawing"),
    Keyvalues(key: "1 ", value: "MOM"),
    Keyvalues(key: "2 ", value: " CNC "),
    Keyvalues(key: "3 ", value: " Hub "),
    Keyvalues(key: "4 ", value: " Machining "),
    Keyvalues(key: "5 ", value: " Impeller "),
    Keyvalues(key: "6 ", value: " Casing "),
    Keyvalues(key: "7 ", value: " Accessories "),
    Keyvalues(key: "8 ", value: " First Coat Paint "),
    Keyvalues(key: "9 ", value: " Assembly "),
    Keyvalues(key: "10 ", value: " Testing "),
    Keyvalues(key: "11 ", value: " Final Paint "),
    Keyvalues(key: "12", value: " Packing "),
    Keyvalues(key: "13 ", value: "Dispatch "),
  ];

  static List<Color> purple = [];
  static List<Color> pink = [];
  static List<Color> yellow = [];
  static List<Color> index = [];
  String checkboxclick = "Yesterday";
  String Enternumbervalue = "";
  String machineValue = "CNC";

  String checkboxclick1 = "Yesterday";
  String Enternumbervalue1 = "";
  String machineValue1 = "";

  bool _isLoading = true;
  bool clickyesterdayValue = true;
  bool clickWeeklyValue = false;
  bool clickAnnualValue = false;

  //14 tab onClick function
  bool clickyesterdayValue1 = true;
  bool clickWeeklyValue1 = false;
  bool clickAnnualValue1 = false;

  @override
  void initState() {
    super.initState();
    _refreshData();
    purple.add(Colors.purple);
    yellow.add(Colors.yellow);
    pink.add(Colors.pink);

    index.add(Colors.green);
    index.add(Colors.blue);
    index.add(Colors.red);
    index.add(Colors.orange);
    index.add(Colors.purpleAccent);
    index.add(Colors.grey);
    index.add(Colors.deepPurpleAccent);
    index.add(Colors.cyanAccent);
    index.add(Colors.brown);
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  Future<List<quantity>?> jobUpdates(
      {required String check,
      required String number,
      required String machine}) async {
    var data1 = {
      'checkbox': check,
      'weekNumber': number,
      'Department': machine
    };
    var user = await api_calls.JOBUPDATES(ApiClass.JOBUPDATES3, data1);

    val = [];
    jobupdatedatas = [];
    print("user.error!");
    print(user.error!);

    if (!user.error!) {
      // print(jsonDecode(user.toString()));
      user.data!.map((item) {
        jobupdatedatas?.add(item);
      }).toList();

      List<String> leftSide = [];
      leftSide.addAll(getxaxisjobvalues());
      for (int i = 0; i < jobupdatedatas!.length; i++) {
        plannedvalues data =
            plannedvalues(leftSide[i], jobupdatedatas![i].planned!.length);
        actualvalues data2 =
            actualvalues(leftSide[i], jobupdatedatas![i].actual!.length);
        delayedvalues data3 =
            delayedvalues(leftSide[i], jobupdatedatas![i].delayed!.length);
        quantity data4 = quantity(data, data2, data3);
        val.add(data4);
      }

      print(val);
    }

    return val;
  }

  Future<List<quantity>?> jobUpdates2({
    required String check1,
    required String number1,
    required String machine1,
    int pagenumber = 1,
  }) async {
    try {
      print(">>>>>" + check1);
      print("****" + number1);
      print("####" + machine1);
      var data2 = {
        'checkbox': check1,
        'weekNumber': number1,
        'Department': machine1,
        'pagenumber': '$pagenumber',
      };
      var responce = await api_calls.JOBUPDATES2(ApiClass.JOBUPDATES3, data2);

      chartData = [];
      print(responce.toJson());
      if (responce.error == false) {
        // pagenumber = pagenumber + 1;
        responce.data!.map((items) {
          data?.add(items);
        }).toList();
        plannedvalues dataPlanned = plannedvalues("PLANNED", data[0].Quantity!);
        actualvalues dataActual = actualvalues("ACTUAL", data[1].Quantity!);
        delayedvalues dataDelayed = delayedvalues("DELAYED", data[2].Quantity!);
        quantity data5 = quantity(dataPlanned, dataActual, dataDelayed);
        // val1 = [];
        val1.add(data5);
        print("ResponseJSON");
        print(data5.toString());
      } else {
        // throw Exception('Failed to load data');
      }

      return val1;
    } catch (e) {
      print('Error');
    }
  }

  Future<List<Datas>> barchart() async {
    var res = await api_calls
        .PROCESSSCREENPENDINGFANS(ApiClass.PROCESSSCREENPENDINGFANS);
    var responseData = json.decode(res.body);

    String msg = responseData["message"];
    bool error = responseData["error"];
    print(data);
    print("DATA" + msg);
    print(error);

    if (!error) {
      var dat = responseData["data"];
      dat.map((item) {
        datas!.add(Datas.fromJson(item));
      }).toList();
      print(dat);
      ProcessPendingFans user = ProcessPendingFans(
          responseData["message"], responseData["error"], datas);
      if (kDebugMode) {
        print(user.data);
      }
    } else {}
    return datas;
  }

  Future<List<DataItem>> barchart2() async {
    print("cart 1");
    var res = await api_calls.DISPATCHQTY(ApiClass.DISPATCHQTY);
    print("cart 2");
    var responseData = json.decode(res.body);
    String msg = responseData["message"];
    bool error = responseData["error"];
    print("DATA" + msg);
    if (!error) {
      print(jsonDecode(res.body));
      print("cart 3");

      var dat = responseData["readyToDispatch"];
      var datD = responseData["disptached"];

      List? tags = dat != null ? List.from(dat) : null;
      List? tags2 = datD != null ? List.from(datD) : null;

      for (int i = 0; i < tags!.length; i++) {
        print("readyToDispatch : " + tags![i]["Quantity"]);
        print("disptached : " + tags2![i]["Quantity"]);
        DataItem data = DataItem(
            tags![i]["Quantity"].toString(), tags2![i]["Quantity"].toString());

        _Twobar.add(data);
        print("" + _Twobar[i].readyToDispatch + "" + _Twobar[i].disptached);
      }

      dat.map((item) {
        readyToDispatch!.add(ReadyToDispatch.fromJson(item));
      }).toList();
      datD.map((item) {
        disptached!.add(Disptached.fromJson(item));
      }).toList();
      DispatchQuantity user = DispatchQuantity(responseData["message"],
          responseData["error"], readyToDispatch, disptached);
      if (kDebugMode) {
        print(user.readyToDispatch);
        print(user.disptached);
      }
    } else {}

    return _Twobar;
  }

  Future<List<Delay>> barchart3() async {
    var res = await api_calls.DELAYEDPROCESS(ApiClass.DELAYEDPROCESS);
    var responseData = json.decode(res.body);
    String msg = responseData["message"];
    bool error = responseData["error"];
    print(bar4);
    print("DATA" + msg);
    print(error);
    if (!error) {
      var dat = responseData["data"];
      dat.map((item) {
        bar4!.add(Delay.fromJson(item));
      }).toList();
      print(dat);
      DelayedProcess user =
          DelayedProcess(responseData["message"], responseData["error"], bar4);
      if (kDebugMode) {
        print(user.data);
      }
    } else {}
    return bar4;
  }

  Future<List<Pie>> Piechart1() async {
    List<Pie> pielist = [];
    var res = await api_calls.DOMESTICORDERSFANS(ApiClass.DOMESTICORDERSFANS);
    var responseData = json.decode(res.body);
    String msg = responseData["message"];
    bool error = responseData["error"];
    print(domesticfan);
    print("DATA" + msg);
    print(error);
    if (!error) {
      var dat = responseData["data"];
      dat.map((item) {
        domesticfan!.add(Domestic.fromJson(item));
      }).toList();
      print(dat);
      DomesticFans user = DomesticFans(
          responseData["message"], responseData["error"], domesticfan);
      for (int i = 0; i < user.data.length; i++) {
        if (user.data[i].Quantity != null) {
          print("data_of_pie" + user.data[i].Quantity.toString());
          Pie piedata =
              new Pie(user.data[i].Quantity.toString() ?? "0", index[i]);
          pielist.add(piedata);
        }
      }
      if (kDebugMode) {
        print(user.data);
      } else {}
    }
    print("PIELIST");
    print(pielist.length);
    return pielist;
  }

  Future<List<Pie2>> Piechart2() async {
    List<Pie2> pielist = [];
    var res = await api_calls.GEEXPORTFANS(ApiClass.GEEXPORTFANS);
    var responseData = json.decode(res.body);
    String msg = responseData["message"];
    bool error = responseData["error"];
    print(geexportfan);
    print("DATA" + msg);
    print(error);
    if (!error) {
      var dat = responseData["data"];
      dat.map((item) {
        geexportfan!.add(GeExport.fromJson(item));
      }).toList();
      print(dat);
      GEExportFans user = GEExportFans(
          responseData["message"], responseData["error"], geexportfan);
      for (int i = 0; i < user.data.length; i++) {
        if (user.data[i].Quantity != null) {
          print("data_of_pie" + user.data[i].Quantity.toString());
          Pie2 piedata =
              new Pie2(user.data[i].Quantity.toString() ?? "0", index[i]);
          pielist.add(piedata);
        }
      }
      if (kDebugMode) {
        print(user.data);
      } else {}
    }
    print("PIELIST");
    print(pielist.length);
    return pielist;
  }

  Future<List<Pie3>> Piechart3() async {
    List<Pie3> pielist = [];
    var res = await api_calls.ALSTOMFANS(ApiClass.ALSTOMFANS);
    var responseData = json.decode(res.body);
    String msg = responseData["message"];
    bool error = responseData["error"];
    print(alstomfan);
    print("DATA" + msg);
    print(error);
    if (!error) {
      var dat = responseData["data"];
      dat.map((item) {
        alstomfan!.add(Alstom.fromJson(item));
      }).toList();
      print(dat);
      AlstomFans user =
          AlstomFans(responseData["message"], responseData["error"], alstomfan);
      for (int i = 0; i < user.data.length; i++) {
        if (user.data[i].Quantity != null) {
          print("data_of_pie" + user.data[i].Quantity.toString());
          Pie3 piedata =
              new Pie3(user.data[i].Quantity.toString() ?? "0", index[i]);
          pielist.add(piedata);
        }
      }
      if (kDebugMode) {
        print(user.data);
      } else {}
    }
    print("PIELIST");
    print(pielist.length);
    return pielist;
  }

  Future<List<Pie4>> Piechart4() async {
    List<Pie4> pielist = [];
    var res = await api_calls.BARCFANS(ApiClass.BARCFANS);
    var responseData = json.decode(res.body);
    String msg = responseData["message"];
    bool error = responseData["error"];
    print(barcfan);
    print("DATA" + msg);
    print(error);
    if (!error) {
      var dat = responseData["data"];
      dat.map((item) {
        alstomfan!.add(Alstom.fromJson(item));
      }).toList();
      print(dat);
      AlstomFans user =
          AlstomFans(responseData["message"], responseData["error"], alstomfan);
      for (int i = 0; i < user.data.length; i++) {
        if (user.data[i].Quantity != null) {
          print("data_of_pie" + user.data[i].Quantity.toString());
          Pie4 piedata =
              new Pie4(user.data[i].Quantity.toString() ?? "0", index[i]);
          pielist.add(piedata);
        }
      }
      if (kDebugMode) {
        print(user.data);
      } else {}
    }
    print("PIELIST");
    print(pielist.length);
    return pielist;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo.shade800,
          title: Container(
            padding: EdgeInsets.only(right: 25),
            child: Center(
              child: Text("Dashboard",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(children: [
            // SizedBox(
            //   height: 15,
            // ),
            Center(
                child: Text("Plan Vs Actual Delayed",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo.shade800,
                    ))),
            _checkbox(context),
            clickWeeklyValue
                ? Container(
                    padding: EdgeInsets.only(right: 15, left: 15, top: 15),
                    child: TextField(
                      controller: weeklyController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.indigo.shade800)),
                        labelText: "Weekly",
                      ),
                      onChanged: (value) {
                        setState(() {
                          print("weeklyController$weeklyController");
                          if (weeklyController.text.length > 0) {
                            print("Enternumbervalue$Enternumbervalue");
                            Enternumbervalue = weeklyController.text.toString();
                          }
                        });
                      },
                    ),
                  )
                : Text(""),
            clickAnnualValue
                ? Container(
                    padding: EdgeInsets.only(right: 15, left: 15),
                    child: TextField(
                      controller: annualController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.indigo.shade800)),
                        labelText: "Annual",
                      ),
                      onChanged: (value) {
                        setState(() {
                          print("annualController$annualController");
                          if (annualController.text.length > 0) {
                            print("Enternumbervalue$Enternumbervalue");
                            Enternumbervalue = annualController.text.toString();
                          }
                        });
                      },
                    ),
                  )
                : Text(""),
            if (checkboxclick.length != 0)
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 30, left: 15, right: 10),
                  child: FutureBuilder<List<quantity>?>(
                      future: jobUpdates(
                          check: checkboxclick,
                          number: Enternumbervalue,
                          machine: ''),
                      builder: (context, snapshot) {
                        // for (int i = 0; i < snapshot.data.length = 0; i++) {
                        if (snapshot.data != null) {
                          if (snapshot.data?.length != 0) {
                            return Flex(direction: Axis.horizontal, children: [
                              Flexible(
                                flex: 1,
                                child: Column(
                                  children: [
                                    SfCartesianChart(
                                      title: ChartTitle(text: 'Job Updates'),
                                      legend: Legend(isVisible: true),
                                      tooltipBehavior: _tooltipBehavior,
                                      series: <ChartSeries>[
                                        BarSeries<quantity, String>(
                                            name: 'Planned',
                                            dataSource: val,
                                            xValueMapper: (quantity qty, _) =>
                                                qty.planned.PlannedCategories,
                                            yValueMapper: (quantity qty, _) =>
                                                qty.planned.PlannedNumbers,
                                            dataLabelSettings:
                                                DataLabelSettings(
                                                    isVisible: false),
                                            enableTooltip: true),
                                        BarSeries<quantity, String>(
                                            name: 'Actual',
                                            dataSource: val,
                                            xValueMapper: (quantity qty, _) =>
                                                qty.actual.ActualCategories,
                                            yValueMapper: (quantity qty, _) =>
                                                qty.actual.ActualNumbers,
                                            dataLabelSettings:
                                                DataLabelSettings(
                                                    isVisible: false),
                                            enableTooltip: true),
                                        BarSeries<quantity, String>(
                                            name: 'Delayed',
                                            dataSource: val,
                                            xValueMapper: (quantity qty, _) =>
                                                qty.delayed.DelayedCategories,
                                            yValueMapper: (quantity qty, _) =>
                                                qty.delayed.DelayedNumbers,
                                            dataLabelSettings:
                                                DataLabelSettings(
                                              isVisible: false,
                                            ),
                                            enableTooltip: true)
                                      ],
                                      primaryXAxis: CategoryAxis(),
                                      primaryYAxis: NumericAxis(
                                          edgeLabelPlacement:
                                              EdgeLabelPlacement.shift,
                                          numberFormat:
                                              NumberFormat.decimalPattern()),
                                    ),
                                    HorizontalScrollView(
                                      children: List.generate(tabList.length,
                                          (index) {
                                        var model = tabList[index];
                                        return AppTabMenu(
                                          title: model.value,
                                          disable: !model.status,
                                          isSelected:
                                              _selectedTabIndex == index,
                                          onClick: () {
                                            setState(() {
                                              _selectedTabIndex = index;
                                            });
                                            // print("Tab:$index");
                                            // UpdateIndex(index);
                                            // _refreshData();
                                          },
                                        );
                                      }),
                                    ),
                                    bar(context),
                                  ],
                                ),
                              ),
                            ]);
                          } else {
                            return Container(
                              child: Text("NO DATA"),
                            );
                          }
                        } else {
                          return Container(
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(color: Colors.white),
                            child: Center(
                              child: Image.asset(
                                'asset/nadi_logo.gif',
                                width: 200,
                                height: 150,
                              ),
                            ),
                          );
                        }
                      })),
          ]),
        ));
  }

  Widget bar(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
            flex: 1,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(children: [
                Center(
                    child: Text(
                  "Machinig",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo.shade800,
                  ),
                )),
                _checkbox1(context),
                clickWeeklyValue1
                    ? Container(
                        child: TextField(
                          controller: weeklyController1,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.indigo.shade800)),
                            labelText: "Weekly",
                          ),
                          onChanged: (value) {
                            setState(() {
                              // _showChart = true;
                              print("weeklyController$weeklyController1");
                              if (weeklyController1.text.length > 0) {
                                print("Enternumbervalue$Enternumbervalue1");
                                Enternumbervalue1 =
                                    weeklyController1.text.toString();
                              }
                            });
                          },
                        ),
                      )
                    : Text(""),
                clickAnnualValue1
                    ? Container(
                        // padding: EdgeInsets.only(right: 15, left: 15),
                        child: TextField(
                          controller: annualController1,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.indigo.shade800)),
                            labelText: "Annual",
                          ),
                          onChanged: (value) {
                            setState(() {
                              print("annualController$annualController1");
                              if (annualController1.text.length > 0) {
                                print("Enternumbervalue$Enternumbervalue1");
                                Enternumbervalue1 =
                                    annualController1.text.toString();
                              }
                            });
                          },
                        ),
                      )
                    : Text(""),
                if (checkboxclick1.length != 0)
                  Flex(direction: Axis.horizontal, children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                          child: FutureBuilder<List<quantity>?>(
                              key: ValueKey(counter),
                              future: jobUpdates2(
                                check1: checkboxclick1,
                                number1: Enternumbervalue1,
                                machine1: tabList[_selectedTabIndex].value,
                              ),
                              builder: (context, snapshot1) {
                                if (val1 != null) {
                                  if (val1 != 0) {
                                    return Column(children: [
                                      SfCartesianChart(
                                        isTransposed: true,
                                        title: ChartTitle(text: 'Job Updates'),
                                        legend: Legend(isVisible: true),
                                        tooltipBehavior: _tooltipBehavior,
                                        series: <ChartSeries>[
                                          BarSeries<quantity, String>(
                                              name: 'Planned',
                                              dataSource: val1,
                                              xValueMapper:
                                                  (quantity data, _) => data
                                                      .planned
                                                      .PlannedCategories,
                                              yValueMapper: (quantity data,
                                                      _) =>
                                                  data.planned.PlannedNumbers,
                                              dataLabelSettings:
                                                  DataLabelSettings(
                                                isVisible: false,
                                                labelAlignment:
                                                    ChartDataLabelAlignment
                                                        .bottom,
                                              ),
                                              enableTooltip: true),
                                          BarSeries<quantity, String>(
                                              name: 'Actual',
                                              dataSource: val1,
                                              xValueMapper: (quantity data,
                                                      _) =>
                                                  data.actual.ActualCategories,
                                              yValueMapper:
                                                  (quantity data, _) =>
                                                      data.actual.ActualNumbers,
                                              dataLabelSettings:
                                                  DataLabelSettings(
                                                isVisible: false,
                                                labelAlignment:
                                                    ChartDataLabelAlignment
                                                        .bottom,
                                              ),
                                              enableTooltip: true),
                                          BarSeries<quantity, String>(
                                              name: 'Delayed',
                                              dataSource: val1,
                                              xValueMapper:
                                                  (quantity data, _) => data
                                                      .delayed
                                                      .DelayedCategories,
                                              yValueMapper: (quantity data,
                                                      _) =>
                                                  data.delayed.DelayedNumbers,
                                              dataLabelSettings:
                                                  DataLabelSettings(
                                                isVisible: false,
                                                labelAlignment:
                                                    ChartDataLabelAlignment
                                                        .bottom,
                                              ),
                                              enableTooltip: true),
                                        ],
                                        primaryXAxis: CategoryAxis(),
                                        primaryYAxis: NumericAxis(
                                          edgeLabelPlacement:
                                              EdgeLabelPlacement.shift,
                                          numberFormat:
                                              NumberFormat.decimalPattern(),
                                        ),
                                      ),
                                    ]);
                                  } else {
                                    return Container(
                                      child: Text("NO DATA"),
                                    );
                                  }
                                } else {
                                  return Container(
                                      decoration:
                                          BoxDecoration(color: Colors.white),
                                      child: Center(
                                          child: CircularProgressIndicator()));
                                }
                              })),
                    ),
                  ]),
              ]),
            )),
      ],
    );
  }

  Widget _checkbox(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 50, //<-- SEE HERE
            ),
            ElevatedButton(
              child: Text('Yesterday'),
              onPressed: () {
                setState(() {
                  clickyesterdayValue;
                  checkboxclick = "Yesterday";
                  Enternumbervalue = "";
                  machineValue = "";
                  clickyesterdayValue = true;
                  clickWeeklyValue = false;
                  clickAnnualValue = false;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: clickyesterdayValue
                    ? Colors.indigo.shade800
                    : Colors.grey.shade700,
                // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                // textStyle: TextStyle(
                //     fontSize: 30,
                //     fontWeight: FontWeight.bold)
              ),
            ),
            SizedBox(
              width: 20, //<-- SEE HERE
            ),
            ElevatedButton(
              child: Text('Weekly'),
              onPressed: () {
                setState(() {
                  clickWeeklyValue;
                  checkboxclick = "Weekly";
                  Enternumbervalue = "";
                  clickyesterdayValue = false;
                  clickWeeklyValue = true;
                  clickAnnualValue = false;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: clickWeeklyValue
                    ? Colors.indigo.shade800
                    : Colors.grey.shade700,
              ),
            ),
            SizedBox(
              width: 20, //<-- SEE HERE
            ),
            ElevatedButton(
              child: Text('Annual'),
              onPressed: () {
                setState(() {
                  clickAnnualValue;
                  checkboxclick = "Annual";
                  Enternumbervalue = "";
                  clickyesterdayValue = false;
                  clickWeeklyValue = false;
                  clickAnnualValue = true;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: clickAnnualValue
                    ? Colors.indigo.shade800
                    : Colors.grey.shade700,
              ),
            ),
            SizedBox(
              width: 20, //<-- SEE HERE
            ),
            // bar(context),
          ],
        ),
      ),
    );
  }

  Widget _checkbox1(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 50, //<-- SEE HERE
          ),
          ElevatedButton(
            child: Text('Yesterday'),
            onPressed: () {
              setState(() {
                clickyesterdayValue1;
                checkboxclick1 = "Yesterday";
                Enternumbervalue1 = "";
                machineValue1 = "";
                clickyesterdayValue1 = true;
                clickWeeklyValue1 = false;
                clickAnnualValue1 = false;
              });
            },
            style: ElevatedButton.styleFrom(
              primary: clickyesterdayValue1
                  ? Colors.indigo.shade800
                  : Colors.grey.shade700,
            ),
          ),
          SizedBox(
            width: 20, //<-- SEE HERE
          ),
          ElevatedButton(
            child: Text('Weekly'),
            onPressed: () {
              setState(() {
                clickWeeklyValue1;
                checkboxclick1 = "Weekly";
                Enternumbervalue1 = "";
                clickyesterdayValue1 = false;
                clickWeeklyValue1 = true;
                clickAnnualValue1 = false;
              });
            },
            style: ElevatedButton.styleFrom(
              primary: clickWeeklyValue1
                  ? Colors.indigo.shade800
                  : Colors.grey.shade700,
            ),
          ),
          SizedBox(
            width: 20, //<-- SEE HERE
          ),
          ElevatedButton(
            child: Text('Annual'),
            onPressed: () {
              setState(() {
                clickAnnualValue1;
                checkboxclick1 = "Annual";
                Enternumbervalue1 = "";
                clickyesterdayValue1 = false;
                clickWeeklyValue1 = false;
                clickAnnualValue1 = true;
              });
            },
            style: ElevatedButton.styleFrom(
              primary: clickAnnualValue1
                  ? Colors.indigo.shade800
                  : Colors.grey.shade700,
            ),
          ),
          SizedBox(
            width: 20, //<-- SEE HERE
          ),
          // build(context),

          // bar(context)
        ],
      ),
    );
  }

  List<String> getxaxisjobvalues() {
    final List<String> xaxisjobvalues = [
      'PDWG',
      'MOM',
      'CNC',
      'HUB',
      'MACHINING',
      'IMPELLER',
      'CASING',
      'ACCESSORIES',
      'FCP',
      'ASSEMBLY',
      'TESTING',
      'FINAL PAINT',
      'PACKING',
      'DISPATCH',
    ];
    return xaxisjobvalues;
  }

  List<String> getyaxisjobvalues() {
    final List<String> yaxisjobvalues = [
      'PLANNED',
      'ACTUAL',
      'DELAYED',
    ];
    return yaxisjobvalues;
  }
}
