import 'dart:convert';
import 'dart:io';

import 'package:code/Json_Response/QrDisplayValue.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'ApiCall/ApiClass.dart';
import 'ApiCall/api_Calls.dart';
import 'Json_Response/QrScannerCodeResponse.dart';

class qrscanner extends StatefulWidget {
  const qrscanner({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<qrscanner> createState() => _Qrscanner();
}

class _Qrscanner extends State<qrscanner> {
  final GlobalKey _gLobalkey = GlobalKey();
  QRViewController? controller;
  Barcode? result;

  final searchcontroller = TextEditingController();

  api_Calls apiClass = new api_Calls();
  List<QRDis> qrvalue = [];
  List<QRDis>? search;
  late String partCode = "";
  late String partDescriptions = "";
  late String onHandQty;
  late String unitCost;
  late String totalCost;

  late String apisearch;

  @override
  void initState() {
    super.initState();
    search = qrvalue;
  }

  Qrvalues() {
    return FutureBuilder<List<QRDis>>(
        future: display(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.indigo.shade800),
                  showCheckboxColumn: false, // <-- this is important
                  columns: [
                    DataColumn(
                        label: Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        'PartCode',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    )),
                    DataColumn(
                      label: Text(
                        'PartDescriptions',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'OnHandQty',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'UnitCost',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'TotalCost',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ],
                  rows: snapshot.data!
                      .map((data) => DataRow(
                            cells: [
                              DataCell(
                                SizedBox(
                                  width: 220,
                                  child: Text(
                                    data.partCode ?? "",
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              DataCell(SizedBox(
                                width: 300,
                                child: Text(
                                  data.partDescriptions ?? "",
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              )),
                              DataCell(Center(
                                child: Text(
                                  data.onHandQty ?? "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              )),
                              DataCell(Center(
                                child: Text(
                                  data.unitCost ?? "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              )),
                              DataCell(Center(
                                child: Text(
                                  data.totalCost ?? "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              )),
                            ],
                          ))
                      .toList(),
                ));
          } else {
            return Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.only(bottom: 150),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Image.asset(
                      'asset/nadi_logo.gif',
                      width: 150,
                      height: 100,
                    ),
                  ),
                  Text(
                    "Loading Data...",
                    style: TextStyle(
                      color: Colors.indigo[800],
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }

  void qr(QRViewController controller) {
    setState(() {
      this.controller = controller;
      controller.resumeCamera();
    });

    controller.scannedDataStream.listen((event) {
      setState(() {
        print("PRINTNULL");
        var b = (event.code.toString().split(' - '));
        for (var i = 0; i < b.length; i++) {
          if (b[i].contains("Part Code")) {
            print("-" + b[i + 1]);
            partCode = b[i + 1];
            partCode = partCode.replaceAll("Part Desc", "");
            partCode = partCode.trim();
          } else {}
        }

        print("PARTCODEFAILED" + partCode.toString());
        if (partCode != null) {
          qrApiCall(partCode);
          if (Platform.isAndroid) {
            controller.pauseCamera();
          } else if (Platform.isIOS) {
            controller.resumeCamera();
          }
        } else {
          print("failedEmpty");
        }
      });
    });
  }

  Future<List<QRDis>> display() async {
    print(result);
    var map = <String, String>{};
    map['partCode'] = "";
    var res = await apiClass.QrdisplayProcess(map, ApiClass.QRCODESCANNER);
    print(res);

    var responseData = json.decode(res.body);
    String msg = responseData["message"];
    print(msg);
    bool error = responseData["error"];
    print(error);

    if (!error) {
      var dat = responseData["data"];
      dat.map((item) {
        qrvalue.add(QRDis.fromJson(item));
      }).toList();
      QrDisplayValue user = QrDisplayValue(
          responseData["message"], responseData["error"], qrvalue);
      if (kDebugMode) {
        print(user.data);
      }
    } else {
      print("elseFortheerror");
    }
    return qrvalue;
  }

  Future<void> qrApiCall(String? result) async {
    print(result);

    var map = <String, String>{};
    map['partCode'] = result!;

    var res = await apiClass.displayProcess(map, ApiClass.QRCODESCANNER);
    var responseData = json.decode(res);
    print(responseData);
    Data dataa = Data.fromJson(responseData["data"]);

    QrScannerCodeResponse user = QrScannerCodeResponse(
        responseData["message"], responseData["error"], dataa);
    if (!user.error) {
      bottomsheet(context, user.data.onHandQty, user.data.totalCost);
    }

    if (kDebugMode) {
      print(user.message);
      print(user.data.partDescriptions);
    } else {}
    controller?.pauseCamera();
    controller?.resumeCamera();
  }

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade800,
        title: Container(
          padding: EdgeInsets.only(right: 40),
          child: Center(
            child: Text("Store",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 250,
                  width: 250,
                  child: QRView(key: _gLobalkey, onQRViewCreated: qr),
                ),
                Center(
                  child: (result != null)
                      ? Text('${result!.code}')
                      : Text('Scan a code'),
                ),
                // Container(
                //   decoration: BoxDecoration(color: Colors.white),
                //   padding: EdgeInsets.all(10),
                //   child: TextField(
                //     controller: searchcontroller,
                //     decoration: InputDecoration(
                //         contentPadding:
                //             EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                //         hintText: "PartCode",
                //         prefixIcon: Icon(Icons.search),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(20),
                //           borderSide: BorderSide(),
                //         )),
                //     onChanged: (partCode) {
                //       // if (partCode == "") {
                //       setState(() {
                //         qrvalue = search!
                //             .where((element) => element.partCode!
                //                 .toLowerCase()
                //                 .contains(partCode.toLowerCase()))
                //             .toList();
                //         display();
                //       });
                //       // }
                //       // if (partDescriptions == "") {
                //       //   setState(() {
                //       //     qrvalue = search!
                //       //         .where((element) =>
                //       //             element.partDescriptions!.contains(value))
                //       //         .toList();
                //       //   });
                //       // }
                //     },
                //   ),
                // ),
                Qrvalues()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void bottomsheet(context, String item, String total) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "No of items : " + item,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Total cost : " + total,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ]),
      ),
    ),
  );
}
