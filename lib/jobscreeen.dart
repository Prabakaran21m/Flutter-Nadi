import 'dart:convert';

import 'package:code/processscreens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'ApiCall/ApiClass.dart';
import 'ApiCall/api_Calls.dart';
import 'Json_Response/ResponseForPMS.dart';

class jobscreen extends StatefulWidget {
  const jobscreen({Key? key}) : super(key: key);

  @override
  State<jobscreen> createState() => _jobscreen();
}

class _jobscreen extends State<jobscreen> {
  api_Calls api_calls = new api_Calls();
  List<Data> data = [];

  final controller = TextEditingController();
  List<Data> filter = [];

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  tab() {
    return SingleChildScrollView(
      child: FutureBuilder<List<Data>>(
          future: getFilteredList(),
          builder: (context, snapshot) {
            if (snapshot.data!.isNotEmpty) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.indigo.shade800),
                  showCheckboxColumn: false, // <-- this is important
                  columns: [
                    DataColumn(
                        label: Text(
                      'Order Number',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
                    DataColumn(
                      label: Text(
                        'Job Number',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Order Date',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Job Release Date',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    DataColumn(
                      label: Container(
                        padding: EdgeInsets.only(left: 60),
                        child: Text(
                          'Sales Rep',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Customer No',
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
                                Center(
                                  child: Text(
                                    data.order_num ?? "",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              DataCell(Center(
                                child: Text(
                                  data.job_num ?? "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              )),
                              DataCell(Center(
                                child: Text(
                                  data.order_date ?? "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              )),
                              DataCell(Center(
                                child: Text(
                                  data.release_date ?? "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              )),
                              DataCell(Center(
                                child: Text(
                                  data.sales_rep_code ?? "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              )),
                              DataCell(Center(
                                child: Text(
                                  data.customer_contact_name ?? "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              )),
                            ],
                            onSelectChanged: (value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => processscreens(
                                        job_num: data.job_num ?? "",
                                        order_num: data.order_num ?? "",
                                        release_date: data.release_date ?? "",
                                        customer_contact_name:
                                            data.customer_contact_name ?? "",
                                        sales_rep_code:
                                            data.sales_rep_code ?? "",
                                        city: data.city ?? "",
                                        need_by_date: data.need_by_date ?? "",
                                        billing_group: data.billing_group ?? "",
                                        prc_con_num: data.prc_con_num ?? "",
                                        character_08: data.character_08 ?? "",
                                        order_date: data.order_date ?? "",
                                        request_date: data.request_date ?? "",
                                        date_06: data.date_06 ?? "",
                                        date_12: data.date_12 ?? ""),
                                  ));
                            },
                          ))
                      .toList(),
                ),
              );
            } else {
              return Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: Colors.white),
                padding: EdgeInsets.symmetric(vertical: 100),
                child: Column(
                  children: [
                    Image.asset(
                      'asset/search.jpg',
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                    ),
                    Text(
                      "Search For Data",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }

  Future<List<Data>> getProducts() async    {
    var res =
        await api_calls.FetchOtherScreenForPms(ApiClass.FETCHOTHERSCREENFORPMS);
    var responseData = json.decode(res.body);
    String msg = responseData["message"];
    bool error = responseData["error"];
    print(data);
    print("MSG" + msg);
    print(error);
    if (!error) {
      var dat = responseData["data"];
      dat.map((item) {
        filter!.add(Data.fromJson(item));
      }).toList();
      ResponseForPMS user =
          ResponseForPMS(responseData["message"], responseData["error"], data);
      if (kDebugMode) {
        print(user.data);
      }
    } else {}
    return filter;
  }

  Future<List<Data>> getFilteredList() async {
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade800,
        title: Container(
          padding: EdgeInsets.only(right: 40),
          child: Center(
            child: Text("Job Screen",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
            padding: EdgeInsets.all(10),
            child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    hintText: "JobNumber",
                    labelStyle:
                        TextStyle(fontSize: 14, color: Colors.grey[700]),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(),
                    )),
                onChanged: (value) {
                  setState(() {
                    if (value.toString().isNotEmpty) {
                      print("FILTER");
                      print(filter);
                      data = filter!
                          .where((element) => element.job_num!.contains(value))
                          .toList();
                      if (filter.isNotEmpty) {
                        print("GETFilter");
                        getFilteredList();
                      } else {
                        Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(color: Colors.white),
                          padding: EdgeInsets.symmetric(vertical: 100),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 80),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Center(
                                  child: Image.asset(
                                    'asset/nodata.png',
                                    width: 250,
                                    height: 220,
                                  ),
                                ),
                              ),
                              Text(
                                "Invalid Data",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        );
                      }
                    } else {
                      data.clear();
                    }
                  });
                }),
          ),
          Expanded(
            child: tab(),
          )
        ],
      ),
    );
  }
}
