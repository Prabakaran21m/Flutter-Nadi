import 'dart:convert';

import 'package:code/ApiCall/ApiClass.dart';
import 'package:code/ApiCall/api_Calls.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Json_Response/DisplayProcessForPMS.dart';

class processscreens extends StatefulWidget {
  final String job_num;
  final String order_num;
  final String order_date;
  final String release_date;
  final String sales_rep_code;
  final String customer_contact_name;
  final String city;
  final String billing_group;
  final String need_by_date;
  final String request_date;
  final String character_08;
  final String prc_con_num;
  final String date_06;
  final String date_12;

  const processscreens(
      {Key? key,
      required this.job_num,
      required this.order_num,
      required this.order_date,
      required this.release_date,
      required this.sales_rep_code,
      required this.customer_contact_name,
      required this.city,
      required this.billing_group,
      required this.need_by_date,
      required this.request_date,
      required this.character_08,
      required this.prc_con_num,
      required this.date_06,
      required this.date_12})
      : super(key: key);

  @override
  State<processscreens> createState() => _processscreensState(
      this.job_num,
      this.order_num,
      this.order_date,
      this.release_date,
      this.sales_rep_code,
      this.customer_contact_name,
      this.city,
      this.billing_group,
      this.need_by_date,
      this.request_date,
      this.character_08,
      this.prc_con_num,
      this.date_06,
      this.date_12);
}

class _processscreensState extends State<processscreens>
    with SingleTickerProviderStateMixin {
  // Map<String, String> params = Get.arguments;
  // String sec;
  String job_num;
  String order_num;
  String order_date;
  String release_date;
  String sales_rep_code;
  String customer_contact_name;
  String city;
  String billing_group;
  String need_by_date;
  String request_date;
  String character_08;
  String prc_con_num;
  String date_06;
  String date_12;

  _processscreensState(
    this.job_num,
    this.order_num,
    this.order_date,
    this.release_date,
    this.sales_rep_code,
    this.customer_contact_name,
    this.city,
    this.billing_group,
    this.need_by_date,
    this.request_date,
    this.character_08,
    this.prc_con_num,
    this.date_06,
    this.date_12,
  );

  api_Calls apicalls = new api_Calls();

  // List<Production> production = [];
  // List<Mom> mom = [];
  // List<Stores> stores = [];
  // List<Purchase> purchase = [];
  List<Cnc> cnc = [];
  List<Hub> hub = [];
  List<Machining> machining = [];
  List<Impeller> impeller = [];
  List<Casing> casing = [];
  List<Accessories> accessories = [];
  List<Fc_paint> fc_paint = [];
  List<Assembly> assembly = [];
  List<Testing> testing = [];
  List<Final_paint> final_paint = [];
  List<Packing> packing = [];

  late final TabController _tabController;

  void initState() {
    _tabController = TabController(length: 11, vsync: this);
    super.initState();
  }

  // PRODUCTION() {
  //   return SingleChildScrollView(
  //     child: FutureBuilder<List<Production>>(
  //         future: product(),
  //         builder: (context, snapshot) {
  //           if (snapshot.data != null) {
  //             if (snapshot.data?.length != 0) {
  //               return SingleChildScrollView(
  //                   scrollDirection: Axis.horizontal,
  //                   child: DataTable(
  //                     headingRowColor: MaterialStateColor.resolveWith(
  //                         (states) => Colors.indigo.shade800),
  //                     showCheckboxColumn: false, // <-- this is important
  //                     columns: [
  //                       DataColumn(
  //                           label: Text(
  //                         'orderid',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                         label: Text(
  //                           'serial_no',
  //                           style: TextStyle(
  //                               color: Colors.white,
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 15),
  //                         ),
  //                       ),
  //                       DataColumn(
  //                         label: Text(
  //                           'id_no',
  //                           style: TextStyle(
  //                               color: Colors.white,
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 15),
  //                         ),
  //                       ),
  //                       DataColumn(
  //                         label: Text(
  //                           'order_num',
  //                           style: TextStyle(
  //                               color: Colors.white,
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 15),
  //                         ),
  //                       ),
  //                       DataColumn(
  //                         label: Text(
  //                           'job_num_1',
  //                           style: TextStyle(
  //                               color: Colors.white,
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 15),
  //                         ),
  //                       ),
  //                       DataColumn(
  //                         label: Text(
  //                           'prod_code',
  //                           style: TextStyle(
  //                               color: Colors.white,
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 15),
  //                         ),
  //                       ),
  //                       DataColumn(
  //                           label: Text(
  //                         'short_char_01',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                           label: Text(
  //                         'order_qty_1',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                           label: Text(
  //                         'need_by_date',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                           label: Text(
  //                         'production_drawing_edd',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                           label: Text(
  //                         'productionid',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                           label: Text(
  //                         'production_dg_committed_date',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                           label: Text(
  //                         'bom_committed_date',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                           label: Text(
  //                         'production_revised_date',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                           label: Text(
  //                         'production_remarks',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                           label: Text(
  //                         'production_revised_remarks',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                           label: Text(
  //                         'production_status',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                     ],
  //
  //                     rows: snapshot.data!
  //                         .map((data) => DataRow(
  //                               cells: [
  //                                 DataCell(
  //                                   Center(
  //                                     child: Text(
  //                                       data.orderid ?? "",
  //                                       style: TextStyle(
  //                                           color: Colors.black,
  //                                           fontWeight: FontWeight.bold,
  //                                           fontSize: 14),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.serial_no ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.id_no ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.order_num ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.job_num_1 ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.prod_code ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.short_char_01 ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.order_qty_1 ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.need_by_date ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.production_drawing_edd ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.productionid ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.production_dg_committed_date ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.bom_committed_date ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.production_revised_date ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.production_remarks ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.production_revised_remarks ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.production_status ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                               ],
  //                             ))
  //                         .toList(),
  //                   ));
  //             } else {
  //               return Container(
  //                 decoration: BoxDecoration(color: Colors.white),
  //                 child: Center(
  //                   child: Image.asset(
  //                     'asset/nodata.png',
  //                     width: 250,
  //                     height: 220,
  //                   ),
  //                 ),
  //               );
  //             }
  //           } else {
  //             return Container(
  //               decoration: BoxDecoration(color: Colors.white),
  //               child: Center(
  //                 child: Image.asset(
  //                   'asset/nodata.png',
  //                   width: 250,
  //                   height: 220,
  //                 ),
  //               ),
  //             );
  //           }
  //         }),
  //   );
  // }

  // Future<List<Production>> product() async {
  //   var map = <String, String>{};
  //   print(production);
  //   map['job_num'] = job_num;
  //
  //   var res =
  //       await apicalls.DisplayprocessforPMS(map, ApiClass.DISPLAYPROCESSFORPMS);
  //   var responseData = json.decode(res.body);
  //   String msg = responseData["message"];
  //   bool error = responseData["error"];
  //   print(msg);
  //   print(error);
  //   if (!error) {
  //     var dat = responseData["production"];
  //     print(dat);
  //     dat.map((item) {
  //       production.add(Production.fromJson(item));
  //     }).toList();
  //     print(dat);
  //     DisplayProcessForPMS user = DisplayProcessForPMS(
  //         responseData["message"],
  //         responseData["error"],
  //         production,
  //         mom,
  //         stores,
  //         purchase,
  //         cnc,
  //         hub,
  //         impeller,
  //         machining,
  //         casing,
  //         accessories,
  //         fc_paint,
  //         assembly,
  //         testing,
  //         final_paint,
  //         packing);
  //     if (kDebugMode) {
  //       print(user.production);
  //     }
  //   } else {}
  //   return production;
  // }

  // MOM() {
  //   return SingleChildScrollView(
  //     child: FutureBuilder<List<Mom>>(
  //         future: moms(),
  //         builder: (context, snapshot) {
  //           if (snapshot.data != null) {
  //             if (snapshot.data?.length != 0) {
  //               return SingleChildScrollView(
  //                   scrollDirection: Axis.horizontal,
  //                   child: DataTable(
  //                     headingRowColor: MaterialStateColor.resolveWith(
  //                         (states) => Colors.indigo.shade800),
  //                     showCheckboxColumn: false, // <-- this is important
  //                     columns: [
  //                       DataColumn(
  //                           label: Text(
  //                         'orderid',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                         label: Text(
  //                           'serial_no',
  //                           style: TextStyle(
  //                               color: Colors.white,
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 15),
  //                         ),
  //                       ),
  //                       DataColumn(
  //                         label: Text(
  //                           'id_no',
  //                           style: TextStyle(
  //                               color: Colors.white,
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 15),
  //                         ),
  //                       ),
  //                       DataColumn(
  //                         label: Text(
  //                           'order_num',
  //                           style: TextStyle(
  //                               color: Colors.white,
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 15),
  //                         ),
  //                       ),
  //                       DataColumn(
  //                         label: Text(
  //                           'job_num_1',
  //                           style: TextStyle(
  //                               color: Colors.white,
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 15),
  //                         ),
  //                       ),
  //                       DataColumn(
  //                         label: Text(
  //                           'prod_code',
  //                           style: TextStyle(
  //                               color: Colors.white,
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 15),
  //                         ),
  //                       ),
  //                       DataColumn(
  //                           label: Text(
  //                         'short_char_01',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                           label: Text(
  //                         'order_qty_1',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                           label: Text(
  //                         'need_by_date',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                           label: Text(
  //                         'mom_planning_edd',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                           label: Text(
  //                         'momid',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                           label: Text(
  //                         'mom_executed_date',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                           label: Text(
  //                         'mom_released_date',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                           label: Text(
  //                         'mom_remarks',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                       DataColumn(
  //                           label: Text(
  //                         'mom_status',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       )),
  //                     ],
  //
  //                     rows: snapshot.data!
  //                         .map((data) => DataRow(
  //                               cells: [
  //                                 DataCell(
  //                                   Center(
  //                                     child: Text(
  //                                       data.orderid ?? "",
  //                                       style: TextStyle(
  //                                           color: Colors.black,
  //                                           fontWeight: FontWeight.bold,
  //                                           fontSize: 14),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.serial_no ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.id_no ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.order_num ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.job_num_1 ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.prod_code ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.short_char_01 ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.order_qty_1 ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.need_by_date ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.mom_planning_edd ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.momid ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.mom_executed_date ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.mom_released_date ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.mom_remarks ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                                 DataCell(Center(
  //                                   child: Text(
  //                                     data.mom_status ?? "",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: 14),
  //                                   ),
  //                                 )),
  //                               ],
  //                             ))
  //                         .toList(),
  //                   ));
  //             } else {
  //               return Container(
  //                 decoration: BoxDecoration(color: Colors.white),
  //                 child: Center(
  //                   child: Image.asset(
  //                     'asset/nodata.png',
  //                     width: 250,
  //                     height: 220,
  //                   ),
  //                 ),
  //               );
  //             }
  //           } else {
  //             return Container(
  //               decoration: BoxDecoration(color: Colors.white),
  //               child: Center(
  //                 child: Image.asset(
  //                   'asset/nodata.png',
  //                   width: 250,
  //                   height: 220,
  //                 ),
  //               ),
  //             );
  //           }
  //         }),
  //   );
  // }

  // Future<List<Mom>> moms() async {
  //   var map = <String, String>{};
  //   map['job_num'] = job_num;
  //
  //   var res =
  //       await apicalls.DisplayprocessforPMS(map, ApiClass.DISPLAYPROCESSFORPMS);
  //   var responseData = json.decode(res.body);
  //   String msg = responseData["message"];
  //   bool error = responseData["error"];
  //   print(msg);
  //   print(error);
  //   if (!error) {
  //     var dat = responseData["mom"];
  //     print(dat);
  //     dat.map((item) {
  //       mom.add(Mom.fromJson(item));
  //     }).toList();
  //     print(dat);
  //     DisplayProcessForPMS user = DisplayProcessForPMS(
  //         responseData["message"],
  //         responseData["error"],
  //         production,
  //         mom,
  //         stores,
  //         purchase,
  //         cnc,
  //         hub,
  //         impeller,
  //         machining,
  //         casing,
  //         accessories,
  //         fc_paint,
  //         assembly,
  //         testing,
  //         final_paint,
  //         packing);
  //     if (kDebugMode) {
  //       print(user.mom);
  //     }
  //   } else {}
  //   return mom;
  // }

  // STORES() {
  //   return SingleChildScrollView(
  //     child: FutureBuilder<List<Stores>>(
  //         // future: store(),
  //         builder: (context, snapshot) {
  //       if (snapshot.data != null) {
  //         if (snapshot.data?.length != 0) {
  //           return SingleChildScrollView(
  //               scrollDirection: Axis.horizontal,
  //               child: DataTable(
  //                 headingRowColor: MaterialStateColor.resolveWith(
  //                     (states) => Colors.indigo.shade800),
  //                 showCheckboxColumn: false, // <-- this is important
  //                 columns: [
  //                   DataColumn(
  //                       label: Text(
  //                     'Order Number',
  //                     style: TextStyle(
  //                         color: Colors.white,
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 15),
  //                   )),
  //                   DataColumn(
  //                     label: Text(
  //                       'Job Number',
  //                       style: TextStyle(
  //                           color: Colors.white,
  //                           fontWeight: FontWeight.bold,
  //                           fontSize: 15),
  //                     ),
  //                   ),
  //                   DataColumn(
  //                     label: Text(
  //                       'Order Date',
  //                       style: TextStyle(
  //                           color: Colors.white,
  //                           fontWeight: FontWeight.bold,
  //                           fontSize: 15),
  //                     ),
  //                   ),
  //                   DataColumn(
  //                     label: Text(
  //                       'Job Release Date',
  //                       style: TextStyle(
  //                           color: Colors.white,
  //                           fontWeight: FontWeight.bold,
  //                           fontSize: 15),
  //                     ),
  //                   ),
  //                   DataColumn(
  //                     label: Container(
  //                       padding: EdgeInsets.only(left: 40),
  //                       child: Text(
  //                         'Selling Req Qty',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 15),
  //                       ),
  //                     ),
  //                   ),
  //                   DataColumn(
  //                     label: Text(
  //                       'Customer No',
  //                       style: TextStyle(
  //                           color: Colors.white,
  //                           fontWeight: FontWeight.bold,
  //                           fontSize: 15),
  //                     ),
  //                   ),
  //                 ],
  //
  //                 rows: snapshot.data!
  //                     .map((data) => DataRow(
  //                           cells: [
  //                             DataCell(
  //                               Center(
  //                                 child: Text(
  //                                   data.orderid ?? "",
  //                                   style: TextStyle(
  //                                       color: Colors.black,
  //                                       fontWeight: FontWeight.bold,
  //                                       fontSize: 14),
  //                                 ),
  //                               ),
  //                             ),
  //                             DataCell(Center(
  //                               child: Text(
  //                                 data.serial_no ?? "",
  //                                 style: TextStyle(
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 14),
  //                               ),
  //                             )),
  //                             DataCell(Center(
  //                               child: Text(
  //                                 data.id_no ?? "",
  //                                 style: TextStyle(
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 14),
  //                               ),
  //                             )),
  //                             DataCell(Center(
  //                               child: Text(
  //                                 data.order_num ?? "",
  //                                 style: TextStyle(
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 14),
  //                               ),
  //                             )),
  //                             DataCell(Center(
  //                               child: Text(
  //                                 data.job_num_1 ?? "",
  //                                 style: TextStyle(
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 14),
  //                               ),
  //                             )),
  //                             DataCell(Center(
  //                               child: Text(
  //                                 data.prod_code ?? "",
  //                                 style: TextStyle(
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 14),
  //                               ),
  //                             )),
  //                             DataCell(Center(
  //                               child: Text(
  //                                 data.short_char_01 ?? "",
  //                                 style: TextStyle(
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 14),
  //                               ),
  //                             )),
  //                             DataCell(Center(
  //                               child: Text(
  //                                 data.order_qty_1 ?? "",
  //                                 style: TextStyle(
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 14),
  //                               ),
  //                             )),
  //                             DataCell(Center(
  //                               child: Text(
  //                                 data.need_by_date ?? "",
  //                                 style: TextStyle(
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 14),
  //                               ),
  //                             )),
  //                             DataCell(Center(
  //                               child: Text(
  //                                 data.stores_edd ?? "",
  //                                 style: TextStyle(
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 14),
  //                               ),
  //                             )),
  //                             DataCell(Center(
  //                               child: Text(
  //                                 data.storeid ?? "",
  //                                 style: TextStyle(
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 14),
  //                               ),
  //                             )),
  //                             DataCell(Center(
  //                               child: Text(
  //                                 data.bom_received_date ?? "",
  //                                 style: TextStyle(
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 14),
  //                               ),
  //                             )),
  //                             DataCell(Center(
  //                               child: Text(
  //                                 data.stores_revised_date ?? "",
  //                                 style: TextStyle(
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 14),
  //                               ),
  //                             )),
  //                             DataCell(Center(
  //                               child: Text(
  //                                 data.report_submitted ?? "",
  //                                 style: TextStyle(
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 14),
  //                               ),
  //                             )),
  //                             DataCell(Center(
  //                               child: Text(
  //                                 data.stores_remarks ?? "",
  //                                 style: TextStyle(
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 14),
  //                               ),
  //                             )),
  //                             DataCell(Center(
  //                               child: Text(
  //                                 data.stores_revised_remarks ?? "",
  //                                 style: TextStyle(
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 14),
  //                               ),
  //                             )),
  //                             DataCell(Center(
  //                               child: Text(
  //                                 data.stores_status ?? "",
  //                                 style: TextStyle(
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 14),
  //                               ),
  //                             )),
  //                           ],
  //                         ))
  //                     .toList(),
  //               ));
  //         } else {
  //           return Container(
  //             decoration: BoxDecoration(color: Colors.white),
  //             child: Center(
  //               child: Image.asset(
  //                 'asset/nodata.png',
  //                 width: 250,
  //                 height: 220,
  //               ),
  //             ),
  //           );
  //         }
  //       } else {
  //         return Container(
  //           decoration: BoxDecoration(color: Colors.white),
  //           child: Center(
  //             child: Image.asset(
  //               'asset/nodata.png',
  //               width: 250,
  //               height: 220,
  //             ),
  //           ),
  //         );
  //       }
  //     }),
  //   );
  // }

  // Future<List<Stores>> store() async {
  //   var map = <String, String>{};
  //   map['job_num'] = job_num;
  //
  //   var res =
  //       await apicalls.DisplayprocessforPMS(map, ApiClass.DISPLAYPROCESSFORPMS);
  //   var responseData = json.decode(res.body);
  //   String msg = responseData["message"];
  //   bool error = responseData["error"];
  //   print(msg);
  //   print(error);
  //   if (!error) {
  //     var dat = responseData["stores"];
  //     print(dat);
  //     dat.map((item) {
  //       stores.add(Stores.fromJson(item));
  //     }).toList();
  //     print(dat);
  //     DisplayProcessForPMS user = DisplayProcessForPMS(
  //         responseData["message"],
  //         responseData["error"],
  //         production,
  //         mom,
  //         stores,
  //         purchase,
  //         cnc,
  //         hub,
  //         impeller,
  //         machining,
  //         casing,
  //         accessories,
  //         fc_paint,
  //         assembly,
  //         testing,
  //         final_paint,
  //         packing);
  //     if (kDebugMode) {
  //       print(user.stores);
  //     }
  //   } else {}
  //   return stores;
  // }

  CNC() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 40),
      child: SingleChildScrollView(
        child: FutureBuilder<List<Cnc>>(
            future: cncs(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                if (snapshot.data?.length != 0) {
                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.indigo.shade800),
                        showCheckboxColumn: false, // <-- this is important
                        columns: [
                          // DataColumn(
                          //     label: Text(
                          //   'orderid',
                          //   style: TextStyle(
                          //       color: Colors.white,
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 15),
                          // )),
                          // DataColumn(
                          //   label: Text(
                          //     'serial_no',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 15),
                          //   ),
                          // ),
                          // DataColumn(
                          //   label: Text(
                          //     'id_no',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 15),
                          //   ),
                          // ),
                          // DataColumn(
                          //   label: Text(
                          //     'order_num',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 15),
                          //   ),
                          // ),
                          // DataColumn(
                          //   label: Text(
                          //     'job_num_1',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 15),
                          //   ),
                          // ),
                          // DataColumn(
                          //   label: Text(
                          //     'prod_code',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 15),
                          //   ),
                          // ),
                          // DataColumn(
                          //   label: Text(
                          //     'short_char_01',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 15),
                          //   ),
                          // ),
                          // DataColumn(
                          //   label: Text(
                          //     'order_qty_1',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 15),
                          //   ),
                          // ),
                          DataColumn(
                            label: Text(
                              'Cnc_Cdd',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Cnc_Edd',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          // DataColumn(
                          //   label: Text(
                          //     'cncid',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 15),
                          //   ),
                          // ),
                          // DataColumn(
                          //   label: Text(
                          //     'cnc_issued_date',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 15),
                          //   ),
                          // ),
                          // DataColumn(
                          //   label: Text(
                          //     'cnc_completed_date',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 15),
                          //   ),
                          // ),
                          // DataColumn(
                          //   label: Text(
                          //     'cnc_revised_date',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 15),
                          //   ),
                          // ),
                          // DataColumn(
                          //   label: Text(
                          //     'cnc_remarks',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 15),
                          //   ),
                          // ),
                          // DataColumn(
                          //   label: Text(
                          //     'cnc_revised_remarks',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 15),
                          //   ),
                          // ),
                          // DataColumn(
                          //   label: Text(
                          //     'cncstatus',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 15),
                          //   ),
                          // ),
                        ],

                        rows: snapshot.data!
                            .map((data) => DataRow(
                                  cells: [
                                    // DataCell(
                                    //   Center(
                                    //     child: Text(
                                    //       data.orderid ?? "",
                                    //       style: TextStyle(
                                    //           color: Colors.black,
                                    //           fontWeight: FontWeight.bold,
                                    //           fontSize: 14),
                                    //     ),
                                    //   ),
                                    // ),
                                    // DataCell(Center(
                                    //   child: Text(
                                    //     data.serial_no ?? "",
                                    //     style: TextStyle(
                                    //         color: Colors.black,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 14),
                                    //   ),
                                    // )),
                                    // DataCell(Center(
                                    //   child: Text(
                                    //     data.id_no ?? "",
                                    //     style: TextStyle(
                                    //         color: Colors.black,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 14),
                                    //   ),
                                    // )),
                                    // DataCell(Center(
                                    //   child: Text(
                                    //     data.order_num ?? "",
                                    //     style: TextStyle(
                                    //         color: Colors.black,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 14),
                                    //   ),
                                    // )),
                                    // DataCell(Center(
                                    //   child: Text(
                                    //     data.job_num_1 ?? "",
                                    //     style: TextStyle(
                                    //         color: Colors.black,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 14),
                                    //   ),
                                    // )),
                                    // DataCell(Center(
                                    //   child: Text(
                                    //     data.prod_code ?? "",
                                    //     style: TextStyle(
                                    //         color: Colors.black,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 14),
                                    //   ),
                                    // )),
                                    // DataCell(Center(
                                    //   child: Text(
                                    //     data.short_char_01 ?? "",
                                    //     style: TextStyle(
                                    //         color: Colors.black,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 14),
                                    //   ),
                                    // )),
                                    // DataCell(Center(
                                    //   child: Text(
                                    //     data.order_qty_1 ?? "",
                                    //     style: TextStyle(
                                    //         color: Colors.black,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 14),
                                    //   ),
                                    // )),
                                    DataCell(Center(
                                      child: Text(
                                        data.need_by_date ?? "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    )),
                                    DataCell(Center(
                                      child: Text(
                                        data.cnc_edd ?? "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    )),
                                    // DataCell(Center(
                                    //   child: Text(
                                    //     data.cncid ?? "",
                                    //     style: TextStyle(
                                    //         color: Colors.black,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 14),
                                    //   ),
                                    // )),
                                    // DataCell(Center(
                                    //   child: Text(
                                    //     data.cnc_issued_date ?? "",
                                    //     style: TextStyle(
                                    //         color: Colors.black,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 14),
                                    //   ),
                                    // )),
                                    // DataCell(Center(
                                    //   child: Text(
                                    //     data.cnc_completed_date ?? "",
                                    //     style: TextStyle(
                                    //         color: Colors.black,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 14),
                                    //   ),
                                    // )),
                                    // DataCell(Center(
                                    //   child: Text(
                                    //     data.cnc_revised_date ?? "",
                                    //     style: TextStyle(
                                    //         color: Colors.black,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 14),
                                    //   ),
                                    // )),
                                    // DataCell(Center(
                                    //   child: Text(
                                    //     data.cnc_remarks ?? "",
                                    //     style: TextStyle(
                                    //         color: Colors.black,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 14),
                                    //   ),
                                    // )),
                                    // DataCell(Center(
                                    //   child: Text(
                                    //     data.cnc_revised_remarks ?? "",
                                    //     style: TextStyle(
                                    //         color: Colors.black,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 14),
                                    //   ),
                                    // )),
                                    // DataCell(Center(
                                    //   child: Text(
                                    //     data.cncstatus ?? "",
                                    //     style: TextStyle(
                                    //         color: Colors.black,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 14),
                                    //   ),
                                    // )),
                                  ],
                                ))
                            .toList(),
                      ));
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 80),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Image.asset(
                        'asset/nodata.png',
                        width: 250,
                        height: 220,
                      ),
                    ),
                  );
                }
              } else {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 80),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Image.asset(
                      'asset/nodata.png',
                      width: 250,
                      height: 220,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  Future<List<Cnc>> cncs() async {
    var map = <String, String>{};
    map['job_num'] = job_num;

    var res =
        await apicalls.DisplyprocessforPMS(map, ApiClass.DISPLAYPROCESSFORPMS);
    var responseData = json.decode(res.body);
    String msg = responseData["message"];
    bool error = responseData["error"];
    print(cnc);
    print("PCMSG" + msg);
    print(error);
    if (!error) {
      var dat = responseData["cnc"];
      print(dat);
      dat.map((item) {
        cnc.add(Cnc.fromJson(item));
      }).toList();
      print(dat);
      DisplayProcessForPMS user = DisplayProcessForPMS(
          responseData["message"],
          responseData["error"],
          // production,
          // mom,
          // stores,
          // purchase,
          cnc,
          hub,
          impeller,
          machining,
          casing,
          accessories,
          fc_paint,
          assembly,
          testing,
          final_paint,
          packing);
      if (kDebugMode) {
        print(user.cnc);
      }
    } else {}
    return cnc;
  }

  // PURCHASE() {
  //   return SingleChildScrollView(
  //     child: FutureBuilder<List<Purchase>>(
  //         future: moms(),
  //         builder: (context, snapshot) {
  //       if (snapshot.data != null) {
  //         if (snapshot.data?.length != 0) {
  //           return SingleChildScrollView(
  //               // scrollDirection: Axis.horizontal,
  //               // child: DataTable(
  //               //   headingRowColor: MaterialStateColor.resolveWith(
  //               //       (states) => Colors.indigo.shade800),
  //               //   showCheckboxColumn: false, // <-- this is important
  //               //   columns: [
  //               //     DataColumn(
  //               //         label: Text(
  //               //       'orderid',
  //               //       style: TextStyle(
  //               //           color: Colors.white,
  //               //           fontWeight: FontWeight.bold,
  //               //           fontSize: 15),
  //               //     )),
  //               //     DataColumn(
  //               //       label: Text(
  //               //         'serial_no',
  //               //         style: TextStyle(
  //               //             color: Colors.white,
  //               //             fontWeight: FontWeight.bold,
  //               //             fontSize: 15),
  //               //       ),
  //               //     ),
  //               //     DataColumn(
  //               //       label: Text(
  //               //         'id_no',
  //               //         style: TextStyle(
  //               //             color: Colors.white,
  //               //             fontWeight: FontWeight.bold,
  //               //             fontSize: 15),
  //               //       ),
  //               //     ),
  //               //     DataColumn(
  //               //       label: Text(
  //               //         'order_num',
  //               //         style: TextStyle(
  //               //             color: Colors.white,
  //               //             fontWeight: FontWeight.bold,
  //               //             fontSize: 15),
  //               //       ),
  //               //     ),
  //               //     DataColumn(
  //               //       label: Container(
  //               //         padding: EdgeInsets.only(left: 40),
  //               //         child: Text(
  //               //           'job_num_1',
  //               //           style: TextStyle(
  //               //               color: Colors.white,
  //               //               fontWeight: FontWeight.bold,
  //               //               fontSize: 15),
  //               //         ),
  //               //       ),
  //               //     ),
  //               //     DataColumn(
  //               //       label: Text(
  //               //         'prod_code',
  //               //         style: TextStyle(
  //               //             color: Colors.white,
  //               //             fontWeight: FontWeight.bold,
  //               //             fontSize: 15),
  //               //       ),
  //               //     ),
  //               //     DataColumn(
  //               //         label: Text(
  //               //       'short_char_01',
  //               //       style: TextStyle(
  //               //           color: Colors.white,
  //               //           fontWeight: FontWeight.bold,
  //               //           fontSize: 15),
  //               //     )),
  //               //     DataColumn(
  //               //         label: Text(
  //               //       'order_qty_1',
  //               //       style: TextStyle(
  //               //           color: Colors.white,
  //               //           fontWeight: FontWeight.bold,
  //               //           fontSize: 15),
  //               //     )),
  //               //     DataColumn(
  //               //         label: Text(
  //               //       'need_by_date',
  //               //       style: TextStyle(
  //               //           color: Colors.white,
  //               //           fontWeight: FontWeight.bold,
  //               //           fontSize: 15),
  //               //     )),
  //               //     DataColumn(
  //               //         label: Text(
  //               //       'mom_planning_edd',
  //               //       style: TextStyle(
  //               //           color: Colors.white,
  //               //           fontWeight: FontWeight.bold,
  //               //           fontSize: 15),
  //               //     )),
  //               //     DataColumn(
  //               //         label: Text(
  //               //       'momid',
  //               //       style: TextStyle(
  //               //           color: Colors.white,
  //               //           fontWeight: FontWeight.bold,
  //               //           fontSize: 15),
  //               //     )),
  //               //     DataColumn(
  //               //         label: Text(
  //               //       'mom_executed_date',
  //               //       style: TextStyle(
  //               //           color: Colors.white,
  //               //           fontWeight: FontWeight.bold,
  //               //           fontSize: 15),
  //               //     )),
  //               //     DataColumn(
  //               //         label: Text(
  //               //       'mom_released_date',
  //               //       style: TextStyle(
  //               //           color: Colors.white,
  //               //           fontWeight: FontWeight.bold,
  //               //           fontSize: 15),
  //               //     )),
  //               //     DataColumn(
  //               //         label: Text(
  //               //       'mom_remarks',
  //               //       style: TextStyle(
  //               //           color: Colors.white,
  //               //           fontWeight: FontWeight.bold,
  //               //           fontSize: 15),
  //               //     )),
  //               //     DataColumn(
  //               //         label: Text(
  //               //       'mom_status',
  //               //       style: TextStyle(
  //               //           color: Colors.white,
  //               //           fontWeight: FontWeight.bold,
  //               //           fontSize: 15),
  //               //     )),
  //               //   ],
  //               //
  //               //   rows: snapshot.data!
  //               //       .map((data) => DataRow(
  //               //             cells: [
  //               //               DataCell(
  //               //                 Center(
  //               //                   child: Text(
  //               //                     // data.orderid ??
  //               //                         "",
  //               //                     style: TextStyle(
  //               //                         color: Colors.black,
  //               //                         fontWeight: FontWeight.bold,
  //               //                         fontSize: 14),
  //               //                   ),
  //               //                 ),
  //               //               ),
  //               //               DataCell(Center(
  //               //                 child: Text(
  //               //                   // data.serial_no ??
  //               //                       "",
  //               //                   style: TextStyle(
  //               //                       color: Colors.black,
  //               //                       fontWeight: FontWeight.bold,
  //               //                       fontSize: 14),
  //               //                 ),
  //               //               )),
  //               //               DataCell(Center(
  //               //                 child: Text(
  //               //                   // data.id_no ??
  //               //                       "",
  //               //                   style: TextStyle(
  //               //                       color: Colors.black,
  //               //                       fontWeight: FontWeight.bold,
  //               //                       fontSize: 14),
  //               //                 ),
  //               //               )),
  //               //               DataCell(Center(
  //               //                 child: Text(
  //               //                   // data.order_num ??
  //               //                       "",
  //               //                   style: TextStyle(
  //               //                       color: Colors.black,
  //               //                       fontWeight: FontWeight.bold,
  //               //                       fontSize: 14),
  //               //                 ),
  //               //               )),
  //               //               DataCell(Center(
  //               //                 child: Text(
  //               //                   // data.job_num_1 ??
  //               //                       "",
  //               //                   style: TextStyle(
  //               //                       color: Colors.black,
  //               //                       fontWeight: FontWeight.bold,
  //               //                       fontSize: 14),
  //               //                 ),
  //               //               )),
  //               //               DataCell(Center(
  //               //                 child: Text(
  //               //                   // data.prod_code ??
  //               //                       "",
  //               //                   style: TextStyle(
  //               //                       color: Colors.black,
  //               //                       fontWeight: FontWeight.bold,
  //               //                       fontSize: 14),
  //               //                 ),
  //               //               )),
  //               //               DataCell(Center(
  //               //                 child: Text(
  //               //                   // data.short_char_01 ??
  //               //                       "",
  //               //                   style: TextStyle(
  //               //                       color: Colors.black,
  //               //                       fontWeight: FontWeight.bold,
  //               //                       fontSize: 14),
  //               //                 ),
  //               //               )),
  //               //               DataCell(Center(
  //               //                 child: Text(
  //               //                   // data.order_qty_1 ??
  //               //                       "",
  //               //                   style: TextStyle(
  //               //                       color: Colors.black,
  //               //                       fontWeight: FontWeight.bold,
  //               //                       fontSize: 14),
  //               //                 ),
  //               //               )),
  //               //               DataCell(Center(
  //               //                 child: Text(
  //               //                   // data.need_by_date ??
  //               //                       "",
  //               //                   style: TextStyle(
  //               //                       color: Colors.black,
  //               //                       fontWeight: FontWeight.bold,
  //               //                       fontSize: 14),
  //               //                 ),
  //               //               )),
  //               //               DataCell(Center(
  //               //                 child: Text(
  //               //                   // data.mom_planning_edd ??
  //               //                       "",
  //               //                   style: TextStyle(
  //               //                       color: Colors.black,
  //               //                       fontWeight: FontWeight.bold,
  //               //                       fontSize: 14),
  //               //                 ),
  //               //               )),
  //               //               DataCell(Center(
  //               //                 child: Text(
  //               //                   // data.momid ??
  //               //                       "",
  //               //                   style: TextStyle(
  //               //                       color: Colors.black,
  //               //                       fontWeight: FontWeight.bold,
  //               //                       fontSize: 14),
  //               //                 ),
  //               //               )),
  //               //               DataCell(Center(
  //               //                 child: Text(
  //               //
  //               //                   // data.mom_executed_date ??
  //               //                       "",
  //               //                   style: TextStyle(
  //               //                       color: Colors.black,
  //               //                       fontWeight: FontWeight.bold,
  //               //                       fontSize: 14),
  //               //                 ),
  //               //               )),
  //               //               DataCell(Center(
  //               //                 child: Text(
  //               //                   // data.mom_released_date ??
  //               //                       "",
  //               //                   style: TextStyle(
  //               //                       color: Colors.black,
  //               //                       fontWeight: FontWeight.bold,
  //               //                       fontSize: 14),
  //               //                 ),
  //               //               )),
  //               //               DataCell(Center(
  //               //                 child: Text(
  //               //                   // data.mom_remarks ??
  //               //                       "",
  //               //                   style: TextStyle(
  //               //                       color: Colors.black,
  //               //                       fontWeight: FontWeight.bold,
  //               //                       fontSize: 14),
  //               //                 ),
  //               //               )),
  //               //               DataCell(Center(
  //               //                 child: Text(
  //               //                   // data.mom_status ??
  //               //                       "",
  //               //                   style: TextStyle(
  //               //                       color: Colors.black,
  //               //                       fontWeight: FontWeight.bold,
  //               //                       fontSize: 14),
  //               //                 ),
  //               //               )),
  //               //             ],
  //               //           ))
  //               //       .toList(),
  //               // )
  //               );
  //         } else {
  //           return Container(
  //             padding: EdgeInsets.symmetric(vertical: 80),
  //             decoration: BoxDecoration(color: Colors.white),
  //             child: Center(
  //               child: Image.asset(
  //                 'asset/nodata.png',
  //                 width: 250,
  //                 height: 220,
  //               ),
  //             ),
  //           );
  //         }
  //       } else {
  //         return Container(
  //           padding: EdgeInsets.symmetric(vertical: 80),
  //           decoration: BoxDecoration(color: Colors.white),
  //           child: Center(
  //             child: Image.asset(
  //               'asset/nodata.png',
  //               width: 250,
  //               height: 220,
  //             ),
  //           ),
  //         );
  //       }
  //     }),
  //   );
  // }

  // Future<List<Mom>> purchaes() async {
  //   var map = <String, String>{};
  //   map['job_num'] = job_num;
  //
  //   var res =
  //   await apicalls.DisplayprocessforPMS(map, ApiClass.DISPLAYPROCESSFORPMS);
  //   var responseData = json.decode(res.body);
  //   String msg = responseData["message"];
  //   bool error = responseData["error"];
  //   print(msg);
  //   print(error);
  //   if (!error) {
  //     var dat = responseData["mom"];
  //     print(dat);
  //     dat.map((item) {
  //       purchaes.add(Mom.fromJson(item));
  //     }).toList();
  //     print(dat);
  //     DisplayProcessForPMS user = DisplayProcessForPMS(
  //         responseData["message"],
  //         responseData["error"],
  //         // production,
  //         // mom,
  //         // stores,
  //         // purchase,
  //         cnc,
  //         hub,
  //         impeller,
  //         machining,
  //         casing,
  //         accessories,
  //         fc_paint,
  //         assembly,
  //         testing,
  //         final_paint,
  //         packing);
  //     if (kDebugMode) {
  //       print(user.);
  //     }
  //   } else {}
  //   return mom;
  // }

  HUB() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: SingleChildScrollView(
        child: FutureBuilder<List<Hub>>(
            future: hubs(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                if (snapshot.data?.length != 0) {
                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.indigo.shade800),
                        showCheckboxColumn: false, // <-- this is important
                        columns: [
                          //     DataColumn(
                          //         label: Text(
                          //           'orderid',
                          //           style: TextStyle(
                          //               color: Colors.white,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15),
                          //         )),
                          //     DataColumn(
                          //       label: Text(
                          //         'serial_no',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Text(
                          //         'id_no',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Text(
                          //         'order_num',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Container(
                          //         padding: EdgeInsets.only(left: 40),
                          //         child: Text(
                          //           'job_num_1',
                          //           style: TextStyle(
                          //               color: Colors.white,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15),
                          //         ),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Text(
                          //         'prod_code',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //         label: Text(
                          //           'short_char_01',
                          //           style: TextStyle(
                          //               color: Colors.white,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15),
                          //         )),
                          //     DataColumn(
                          //         label: Text(
                          //           'order_qty_1',
                          //           style: TextStyle(
                          //               color: Colors.white,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15),
                          //         )),
                          DataColumn(
                              label: Text(
                            'Hub_Cdd',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                          DataColumn(
                              label: Text(
                            'Hub_Edd',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                          // DataColumn(
                          //         label: Text(
                          //           'momid',
                          //           style: TextStyle(
                          //               color: Colors.white,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15),
                          //         )),
                          //     DataColumn(
                          //         label: Text(
                          //           'mom_executed_date',
                          //           style: TextStyle(
                          //               color: Colors.white,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15),
                          //         )),
                          //     DataColumn(
                          //         label: Text(
                          //           'mom_released_date',
                          //           style: TextStyle(
                          //               color: Colors.white,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15),
                          //         )),
                          //     DataColumn(
                          //         label: Text(
                          //           'mom_remarks',
                          //           style: TextStyle(
                          //               color: Colors.white,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15),
                          //         )),
                          //     DataColumn(
                          //         label: Text(
                          //           'mom_status',
                          //           style: TextStyle(
                          //               color: Colors.white,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15),
                          //         )),
                        ],
                        //
                        rows: snapshot.data!
                            .map((data) => DataRow(
                                  cells: [
                                    //       DataCell(
                                    //         Center(
                                    //           child: Text(
                                    //             data.orderid ?? "",
                                    //             style: TextStyle(
                                    //                 color: Colors.black,
                                    //                 fontWeight: FontWeight.bold,
                                    //                 fontSize: 14),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //       DataCell(Center(
                                    //         child: Text(
                                    //           data.serial_no ?? "",
                                    //           style: TextStyle(
                                    //               color: Colors.black,
                                    //               fontWeight: FontWeight.bold,
                                    //               fontSize: 14),
                                    //         ),
                                    //       )),
                                    //       DataCell(Center(
                                    //         child: Text(
                                    //           data.id_no ?? "",
                                    //           style: TextStyle(
                                    //               color: Colors.black,
                                    //               fontWeight: FontWeight.bold,
                                    //               fontSize: 14),
                                    //         ),
                                    //       )),
                                    //       DataCell(Center(
                                    //         child: Text(
                                    //           data.order_num ?? "",
                                    //           style: TextStyle(
                                    //               color: Colors.black,
                                    //               fontWeight: FontWeight.bold,
                                    //               fontSize: 14),
                                    //         ),
                                    //       )),
                                    //       DataCell(Center(
                                    //         child: Text(
                                    //           data.job_num_1 ?? "",
                                    //           style: TextStyle(
                                    //               color: Colors.black,
                                    //               fontWeight: FontWeight.bold,
                                    //               fontSize: 14),
                                    //         ),
                                    //       )),
                                    //       DataCell(Center(
                                    //         child: Text(
                                    //           data.prod_code ?? "",
                                    //           style: TextStyle(
                                    //               color: Colors.black,
                                    //               fontWeight: FontWeight.bold,
                                    //               fontSize: 14),
                                    //         ),
                                    //       )),
                                    //       DataCell(Center(
                                    //         child: Text(
                                    //           data.short_char_01 ?? "",
                                    //           style: TextStyle(
                                    //               color: Colors.black,
                                    //               fontWeight: FontWeight.bold,
                                    //               fontSize: 14),
                                    //         ),
                                    //       )),
                                    //       DataCell(Center(
                                    //         child: Text(
                                    //           data.order_qty_1 ?? "",
                                    //           style: TextStyle(
                                    //               color: Colors.black,
                                    //               fontWeight: FontWeight.bold,
                                    //               fontSize: 14),
                                    //         ),
                                    //       )),
                                    DataCell(Center(
                                      child: Text(
                                        data.need_by_date ?? "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    )),
                                    DataCell(Center(
                                      child: Text(
                                        data.hub_edd ?? "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    )),
                                    //       DataCell(Center(
                                    //         child: Text(
                                    //           data.momid ?? "",
                                    //           style: TextStyle(
                                    //               color: Colors.black,
                                    //               fontWeight: FontWeight.bold,
                                    //               fontSize: 14),
                                    //         ),
                                    //       )),
                                    //       DataCell(Center(
                                    //         child: Text(
                                    //           data.mom_executed_date ?? "",
                                    //           style: TextStyle(
                                    //               color: Colors.black,
                                    //               fontWeight: FontWeight.bold,
                                    //               fontSize: 14),
                                    //         ),
                                    //       )),
                                    //       DataCell(Center(
                                    //         child: Text(
                                    //           data.mom_released_date ?? "",
                                    //           style: TextStyle(
                                    //               color: Colors.black,
                                    //               fontWeight: FontWeight.bold,
                                    //               fontSize: 14),
                                    //         ),
                                    //       )),
                                    //       DataCell(Center(
                                    //         child: Text(
                                    //           data.mom_remarks ?? "",
                                    //           style: TextStyle(
                                    //               color: Colors.black,
                                    //               fontWeight: FontWeight.bold,
                                    //               fontSize: 14),
                                    //         ),
                                    //       )),
                                    //       DataCell(Center(
                                    //         child: Text(
                                    //           data.mom_status ?? "",
                                    //           style: TextStyle(
                                    //               color: Colors.black,
                                    //               fontWeight: FontWeight.bold,
                                    //               fontSize: 14),
                                    //         ),
                                    //       )),
                                  ],
                                ))
                            .toList(),
                      ));
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 80),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Image.asset(
                        'asset/nodata.png',
                        width: 250,
                        height: 220,
                      ),
                    ),
                  );
                }
              } else {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 80),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Image.asset(
                      'asset/nodata.png',
                      width: 250,
                      height: 220,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  Future<List<Hub>> hubs() async {
    var map = <String, String>{};
    map['job_num'] = job_num;

    var res =
        await apicalls.DisplyprocessforPMS(map, ApiClass.DISPLAYPROCESSFORPMS);
    var responseData = json.decode(res.body);
    String msg = responseData["message"];
    bool error = responseData["error"];
    print(msg);
    print(error);
    if (!error) {
      var dat = responseData["hub"];
      print(dat);
      dat.map((item) {
        hub.add(Hub.fromJson(item));
      }).toList();
      print(dat);
      DisplayProcessForPMS user = DisplayProcessForPMS(
          responseData["message"],
          responseData["error"],
          // production,
          // mom,
          // stores,
          // purchase,
          cnc,
          hub,
          impeller,
          machining,
          casing,
          accessories,
          fc_paint,
          assembly,
          testing,
          final_paint,
          packing);
      if (kDebugMode) {
        print(user.hub);
      }
    } else {}
    return hub;
  }

  IMPELLER() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: SingleChildScrollView(
        child: FutureBuilder<List<Impeller>>(
            future: impellers(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                if (snapshot.data?.length != 0) {
                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.indigo.shade800),
                        showCheckboxColumn: false, // <-- this is important
                        columns: [
                          DataColumn(
                              label: Text(
                            'Impeller_Cdd',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                          DataColumn(
                            label: Text(
                              'Impeller_Edd',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          //     DataColumn(
                          //       label: Text(
                          //         'id_no',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Text(
                          //         'order_num',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Container(
                          //         padding: EdgeInsets.only(left: 40),
                          //         child: Text(
                          //           'job_num_1',
                          //           style: TextStyle(
                          //               color: Colors.white,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15),
                          //         ),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Text(
                          //         'prod_code',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //         label: Text(
                          //       'short_char_01',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'order_qty_1',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'need_by_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_planning_edd',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'momid',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_executed_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_released_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_remarks',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_status',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                        ],
                        rows: snapshot.data!
                            .map((data) => DataRow(
                                  cells: [
                                    DataCell(
                                      Center(
                                        child: Text(
                                          data.need_by_date ?? "",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    DataCell(Center(
                                      child: Text(
                                        data.impeller_edd ?? "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.id_no ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.order_num ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.job_num_1 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.prod_code ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.short_char_01 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.order_qty_1 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.need_by_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_planning_edd ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.momid ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_executed_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_released_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_remarks ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_status ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                  ],
                                ))
                            .toList(),
                      ));
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 80),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Image.asset(
                        'asset/nodata.png',
                        width: 250,
                        height: 220,
                      ),
                    ),
                  );
                }
              } else {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 80),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Image.asset(
                      'asset/nodata.png',
                      width: 250,
                      height: 220,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  Future<List<Impeller>> impellers() async {
    var map = <String, String>{};
    map['job_num'] = job_num;

    var res =
        await apicalls.DisplyprocessforPMS(map, ApiClass.DISPLAYPROCESSFORPMS);
    var responseData = json.decode(res.body);
    String msg = responseData["message"];
    bool error = responseData["error"];
    print(msg);
    print(error);
    if (!error) {
      var dat = responseData["impeller"];
      print(dat);
      dat.map((item) {
        impeller.add(Impeller.fromJson(item));
      }).toList();
      print(dat);
      DisplayProcessForPMS user = DisplayProcessForPMS(
          responseData["message"],
          responseData["error"],
          // production,
          // mom,
          // stores,
          // purchase,
          cnc,
          hub,
          impeller,
          machining,
          casing,
          accessories,
          fc_paint,
          assembly,
          testing,
          final_paint,
          packing);
      if (kDebugMode) {
        print(user.impeller);
      }
    } else {}
    return impeller;
  }

  MACHINING() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: SingleChildScrollView(
        child: FutureBuilder<List<Machining>>(
            future: machinings(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                if (snapshot.data?.length != 0) {
                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.indigo.shade800),
                        showCheckboxColumn: false, // <-- this is important
                        columns: [
                          DataColumn(
                              label: Text(
                            'Machining_Cdd',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                          DataColumn(
                            label: Text(
                              'Machining_Edd',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          //             DataColumn(
                          //               label: Text(
                          //                 'id_no',
                          //                 style: TextStyle(
                          //                     color: Colors.white,
                          //                     fontWeight: FontWeight.bold,
                          //                     fontSize: 15),
                          //               ),
                          //             ),
                          //             DataColumn(
                          //               label: Text(
                          //                 'order_num',
                          //                 style: TextStyle(
                          //                     color: Colors.white,
                          //                     fontWeight: FontWeight.bold,
                          //                     fontSize: 15),
                          //               ),
                          //             ),
                          //             DataColumn(
                          //               label: Container(
                          //                 padding: EdgeInsets.only(left: 40),
                          //                 child: Text(
                          //                   'job_num_1',
                          //                   style: TextStyle(
                          //                       color: Colors.white,
                          //                       fontWeight: FontWeight.bold,
                          //                       fontSize: 15),
                          //                 ),
                          //               ),
                          //             ),
                          //             DataColumn(
                          //               label: Text(
                          //                 'prod_code',
                          //                 style: TextStyle(
                          //                     color: Colors.white,
                          //                     fontWeight: FontWeight.bold,
                          //                     fontSize: 15),
                          //               ),
                          //             ),
                          //             DataColumn(
                          //                 label: Text(
                          //               'short_char_01',
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontWeight: FontWeight.bold,
                          //                   fontSize: 15),
                          //             )),
                          //             DataColumn(
                          //                 label: Text(
                          //               'order_qty_1',
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontWeight: FontWeight.bold,
                          //                   fontSize: 15),
                          //             )),
                          //             DataColumn(
                          //                 label: Text(
                          //               'need_by_date',
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontWeight: FontWeight.bold,
                          //                   fontSize: 15),
                          //             )),
                          //             DataColumn(
                          //                 label: Text(
                          //               'mom_planning_edd',
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontWeight: FontWeight.bold,
                          //                   fontSize: 15),
                          //             )),
                          //             DataColumn(
                          //                 label: Text(
                          //               'momid',
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontWeight: FontWeight.bold,
                          //                   fontSize: 15),
                          //             )),
                          //             DataColumn(
                          //                 label: Text(
                          //               'mom_executed_date',
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontWeight: FontWeight.bold,
                          //                   fontSize: 15),
                          //             )),
                          //             DataColumn(
                          //                 label: Text(
                          //               'mom_released_date',
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontWeight: FontWeight.bold,
                          //                   fontSize: 15),
                          //             )),
                          //             DataColumn(
                          //                 label: Text(
                          //               'mom_remarks',
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontWeight: FontWeight.bold,
                          //                   fontSize: 15),
                          //             )),
                          //             DataColumn(
                          //                 label: Text(
                          //               'mom_status',
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontWeight: FontWeight.bold,
                          //                   fontSize: 15),
                          //             )),
                        ],
                        //
                        rows: snapshot.data!
                            .map((data) => DataRow(
                                  cells: [
                                    DataCell(
                                      Center(
                                        child: Text(
                                          data.need_by_date ?? "",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    DataCell(Center(
                                      child: Text(
                                        data.machining_edd ?? "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    )),
                                    //                       DataCell(Center(
                                    //                         child: Text(
                                    //                           data.id_no ?? "",
                                    //                           style: TextStyle(
                                    //                               color: Colors.black,
                                    //                               fontWeight: FontWeight.bold,
                                    //                               fontSize: 14),
                                    //                         ),
                                    //                       )),
                                    //                       DataCell(Center(
                                    //                         child: Text(
                                    //                           data.order_num ?? "",
                                    //                           style: TextStyle(
                                    //                               color: Colors.black,
                                    //                               fontWeight: FontWeight.bold,
                                    //                               fontSize: 14),
                                    //                         ),
                                    //                       )),
                                    //                       DataCell(Center(
                                    //                         child: Text(
                                    //                           data.job_num_1 ?? "",
                                    //                           style: TextStyle(
                                    //                               color: Colors.black,
                                    //                               fontWeight: FontWeight.bold,
                                    //                               fontSize: 14),
                                    //                         ),
                                    //                       )),
                                    //                       DataCell(Center(
                                    //                         child: Text(
                                    //                           data.prod_code ?? "",
                                    //                           style: TextStyle(
                                    //                               color: Colors.black,
                                    //                               fontWeight: FontWeight.bold,
                                    //                               fontSize: 14),
                                    //                         ),
                                    //                       )),
                                    //                       DataCell(Center(
                                    //                         child: Text(
                                    //                           data.short_char_01 ?? "",
                                    //                           style: TextStyle(
                                    //                               color: Colors.black,
                                    //                               fontWeight: FontWeight.bold,
                                    //                               fontSize: 14),
                                    //                         ),
                                    //                       )),
                                    //                       DataCell(Center(
                                    //                         child: Text(
                                    //                           data.order_qty_1 ?? "",
                                    //                           style: TextStyle(
                                    //                               color: Colors.black,
                                    //                               fontWeight: FontWeight.bold,
                                    //                               fontSize: 14),
                                    //                         ),
                                    //                       )),
                                    //                       DataCell(Center(
                                    //                         child: Text(
                                    //                           data.need_by_date ?? "",
                                    //                           style: TextStyle(
                                    //                               color: Colors.black,
                                    //                               fontWeight: FontWeight.bold,
                                    //                               fontSize: 14),
                                    //                         ),
                                    //                       )),
                                    //                       DataCell(Center(
                                    //                         child: Text(
                                    //                           data.mom_planning_edd ?? "",
                                    //                           style: TextStyle(
                                    //                               color: Colors.black,
                                    //                               fontWeight: FontWeight.bold,
                                    //                               fontSize: 14),
                                    //                         ),
                                    //                       )),
                                    //                       DataCell(Center(
                                    //                         child: Text(
                                    //                           data.momid ?? "",
                                    //                           style: TextStyle(
                                    //                               color: Colors.black,
                                    //                               fontWeight: FontWeight.bold,
                                    //                               fontSize: 14),
                                    //                         ),
                                    //                       )),
                                    //                       DataCell(Center(
                                    //                         child: Text(
                                    //                           data.mom_executed_date ?? "",
                                    //                           style: TextStyle(
                                    //                               color: Colors.black,
                                    //                               fontWeight: FontWeight.bold,
                                    //                               fontSize: 14),
                                    //                         ),
                                    //                       )),
                                    //                       DataCell(Center(
                                    //                         child: Text(
                                    //                           data.mom_released_date ?? "",
                                    //                           style: TextStyle(
                                    //                               color: Colors.black,
                                    //                               fontWeight: FontWeight.bold,
                                    //                               fontSize: 14),
                                    //                         ),
                                    //                       )),
                                    //                       DataCell(Center(
                                    //                         child: Text(
                                    //                           data.mom_remarks ?? "",
                                    //                           style: TextStyle(
                                    //                               color: Colors.black,
                                    //                               fontWeight: FontWeight.bold,
                                    //                               fontSize: 14),
                                    //                         ),
                                    //                       )),
                                    //                       DataCell(Center(
                                    //                         child: Text(
                                    //                           data.mom_status ?? "",
                                    //                           style: TextStyle(
                                    //                               color: Colors.black,
                                    //                               fontWeight: FontWeight.bold,
                                    //                               fontSize: 14),
                                    //                         ),
                                    //                       )),
                                  ],
                                ))
                            .toList(),
                      ));
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 80),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Image.asset(
                        'asset/nodata.png',
                        width: 250,
                        height: 220,
                      ),
                    ),
                  );
                }
              } else {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 80),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Image.asset(
                      'asset/nodata.png',
                      width: 250,
                      height: 220,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  Future<List<Machining>> machinings() async {
    var map = <String, String>{};
    map['job_num'] = job_num;

    var res =
        await apicalls.DisplyprocessforPMS(map, ApiClass.DISPLAYPROCESSFORPMS);
    var responseData = json.decode(res.body);
    String msg = responseData["message"];
    bool error = responseData["error"];
    print(msg);
    print(error);
    if (!error) {
      var dat = responseData["machining"];
      print(dat);
      dat.map((item) {
        machining.add(Machining.fromJson(item));
      }).toList();
      print(dat);
      DisplayProcessForPMS user = DisplayProcessForPMS(
          responseData["message"],
          responseData["error"],
          // production,
          // mom,
          // stores,
          // purchase,
          cnc,
          hub,
          impeller,
          machining,
          casing,
          accessories,
          fc_paint,
          assembly,
          testing,
          final_paint,
          packing);
      if (kDebugMode) {
        print(user.machining);
      }
    } else {}
    return machining;
  }

  CASING() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: SingleChildScrollView(
        child: FutureBuilder<List<Casing>>(
            future: casings(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                if (snapshot.data?.length != 0) {
                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.indigo.shade800),
                        showCheckboxColumn: false, // <-- this is important
                        columns: [
                          DataColumn(
                              label: Text(
                            'Casing_Cdd',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                          DataColumn(
                            label: Text(
                              'Casing_Edd',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          //     DataColumn(
                          //       label: Text(
                          //         'id_no',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Text(
                          //         'order_num',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Container(
                          //         padding: EdgeInsets.only(left: 40),
                          //         child: Text(
                          //           'job_num_1',
                          //           style: TextStyle(
                          //               color: Colors.white,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15),
                          //         ),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Text(
                          //         'prod_code',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //         label: Text(
                          //       'short_char_01',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'order_qty_1',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'need_by_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_planning_edd',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'momid',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_executed_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_released_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_remarks',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_status',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                        ],

                        rows: snapshot.data!
                            .map((data) => DataRow(
                                  cells: [
                                    DataCell(
                                      Center(
                                        child: Text(
                                          data.need_by_date ?? "",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    DataCell(Center(
                                      child: Text(
                                        data.casing_edd ?? "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.id_no ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.order_num ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.job_num_1 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.prod_code ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.short_char_01 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.order_qty_1 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.need_by_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_planning_edd ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.momid ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_executed_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_released_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_remarks ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_status ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                  ],
                                ))
                            .toList(),
                        // )
                      ));
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 80),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Image.asset(
                        'asset/nodata.png',
                        width: 250,
                        height: 220,
                      ),
                    ),
                  );
                }
              } else {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 80),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Image.asset(
                      'asset/nodata.png',
                      width: 250,
                      height: 220,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  Future<List<Casing>> casings() async {
    var map = <String, String>{};
    map['job_num'] = job_num;

    var res =
        await apicalls.DisplyprocessforPMS(map, ApiClass.DISPLAYPROCESSFORPMS);
    var responseData = json.decode(res.body);
    String msg = responseData["message"];
    bool error = responseData["error"];
    print(msg);
    print(error);
    if (!error) {
      var dat = responseData["casing"];
      print(dat);
      dat.map((item) {
        casing.add(Casing.fromJson(item));
      }).toList();
      print(dat);
      DisplayProcessForPMS user = DisplayProcessForPMS(
          responseData["message"],
          responseData["error"],
          // production,
          // mom,
          // stores,
          // purchase,
          cnc,
          hub,
          impeller,
          machining,
          casing,
          accessories,
          fc_paint,
          assembly,
          testing,
          final_paint,
          packing);
      if (kDebugMode) {
        print(user.casing);
      }
    } else {}
    return casing;
  }

  ACCESSORIES() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      child: SingleChildScrollView(
        child: FutureBuilder<List<Accessories>>(
            future: accessoriess(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                if (snapshot.data?.length != 0) {
                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.indigo.shade800),
                        showCheckboxColumn: false, // <-- this is important
                        columns: [
                          DataColumn(
                              label: Text(
                            'Accessories_Cdd',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                          DataColumn(
                            label: Text(
                              'Accessories_Edd',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          //     DataColumn(
                          //       label: Text(
                          //         'id_no',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Text(
                          //         'order_num',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Container(
                          //         padding: EdgeInsets.only(left: 40),
                          //         child: Text(
                          //           'job_num_1',
                          //           style: TextStyle(
                          //               color: Colors.white,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15),
                          //         ),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Text(
                          //         'prod_code',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //         label: Text(
                          //       'short_char_01',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'order_qty_1',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'need_by_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_planning_edd',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'momid',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_executed_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_released_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_remarks',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_status',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                        ],

                        rows: snapshot.data!
                            .map((data) => DataRow(
                                  cells: [
                                    DataCell(
                                      Center(
                                        child: Text(
                                          data.need_by_date ?? "",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    DataCell(Center(
                                      child: Text(
                                        data.accessories_edd ?? "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.id_no ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.order_num ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.job_num_1 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.prod_code ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.short_char_01 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.order_qty_1 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.need_by_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_planning_edd ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.momid ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_executed_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_released_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_remarks ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_status ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                  ],
                                ))
                            .toList(),
                      ));
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 80),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Image.asset(
                        'asset/nodata.png',
                        width: 250,
                        height: 220,
                      ),
                    ),
                  );
                }
              } else {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 80),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Image.asset(
                      'asset/nodata.png',
                      width: 250,
                      height: 220,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  Future<List<Accessories>> accessoriess() async {
    var map = <String, String>{};
    map['job_num'] = job_num;

    var res =
        await apicalls.DisplyprocessforPMS(map, ApiClass.DISPLAYPROCESSFORPMS);
    var responseData = json.decode(res.body);
    String msg = responseData["message"];
    bool error = responseData["error"];
    print(msg);
    print(error);
    if (!error) {
      var dat = responseData["accessories"];
      print(dat);
      dat.map((item) {
        accessories.add(Accessories.fromJson(item));
      }).toList();
      print(dat);
      DisplayProcessForPMS user = DisplayProcessForPMS(
          responseData["message"],
          responseData["error"],
          // production,
          // mom,
          // stores,
          // purchase,
          cnc,
          hub,
          impeller,
          machining,
          casing,
          accessories,
          fc_paint,
          assembly,
          testing,
          final_paint,
          packing);
      if (kDebugMode) {
        print(user.accessories);
      }
    } else {}
    return accessories;
  }

  TESTING() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: SingleChildScrollView(
        child: FutureBuilder<List<Testing>>(
            future: testings(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                if (snapshot.data?.length != 0) {
                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.indigo.shade800),
                        showCheckboxColumn: false, // <-- this is important
                        columns: [
                          DataColumn(
                              label: Text(
                            'Testing_Cdd',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                          DataColumn(
                            label: Text(
                              'Testing_Edd',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          //     DataColumn(
                          //       label: Text(
                          //         'id_no',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Text(
                          //         'order_num',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Container(
                          //         padding: EdgeInsets.only(left: 40),
                          //         child: Text(
                          //           'job_num_1',
                          //           style: TextStyle(
                          //               color: Colors.white,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15),
                          //         ),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Text(
                          //         'prod_code',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //         label: Text(
                          //       'short_char_01',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'order_qty_1',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'need_by_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_planning_edd',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'momid',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_executed_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_released_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_remarks',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_status',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                        ],

                        rows: snapshot.data!
                            .map((data) => DataRow(
                                  cells: [
                                    DataCell(
                                      Center(
                                        child: Text(
                                          data.need_by_date ?? "",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    DataCell(Center(
                                      child: Text(
                                        data.testing_edd ?? "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.id_no ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.order_num ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.job_num_1 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.prod_code ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.short_char_01 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.order_qty_1 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.need_by_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_planning_edd ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.momid ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_executed_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_released_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_remarks ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_status ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                  ],
                                ))
                            .toList(),
                      ));
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 80),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Image.asset(
                        'asset/nodata.png',
                        width: 250,
                        height: 220,
                      ),
                    ),
                  );
                }
              } else {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 80),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Image.asset(
                      'asset/nodata.png',
                      width: 250,
                      height: 220,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  Future<List<Testing>> testings() async {
    var map = <String, String>{};
    map['job_num'] = job_num;

    var res =
        await apicalls.DisplyprocessforPMS(map, ApiClass.DISPLAYPROCESSFORPMS);
    var responseData = json.decode(res.body);
    String msg = responseData["message"];
    bool error = responseData["error"];
    print(msg);
    print(error);
    if (!error) {
      var dat = responseData["testing"];
      print(dat);
      dat.map((item) {
        testing.add(Testing.fromJson(item));
      }).toList();
      print(dat);
      DisplayProcessForPMS user = DisplayProcessForPMS(
          responseData["message"],
          responseData["error"],
          // production,
          // mom,
          // stores,
          // purchase,
          cnc,
          hub,
          impeller,
          machining,
          casing,
          accessories,
          fc_paint,
          assembly,
          testing,
          final_paint,
          packing);
      if (kDebugMode) {
        print(user.testing);
      }
    } else {}
    return testing;
  }

  FINAL_PAINT() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      child: SingleChildScrollView(
        child: FutureBuilder<List<Final_paint>>(
            future: finals(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                if (snapshot.data?.length != 0) {
                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.indigo.shade800),
                        showCheckboxColumn: false, // <-- this is important
                        columns: [
                          DataColumn(
                              label: Text(
                            'Final_Paint_Cdd',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                          DataColumn(
                            label: Text(
                              'Final_Paint_Edd',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          //     DataColumn(
                          //       label: Text(
                          //         'id_no',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Text(
                          //         'order_num',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Container(
                          //         padding: EdgeInsets.only(left: 40),
                          //         child: Text(
                          //           'job_num_1',
                          //           style: TextStyle(
                          //               color: Colors.white,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15),
                          //         ),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Text(
                          //         'prod_code',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //         label: Text(
                          //       'short_char_01',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'order_qty_1',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'need_by_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_planning_edd',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'momid',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_executed_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_released_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_remarks',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_status',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                        ],

                        rows: snapshot.data!
                            .map((data) => DataRow(
                                  cells: [
                                    DataCell(
                                      Center(
                                        child: Text(
                                          data.need_by_date ?? "",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    DataCell(Center(
                                      child: Text(
                                        data.final_paint_edd ?? "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.id_no ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.order_num ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.job_num_1 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.prod_code ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.short_char_01 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.order_qty_1 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.need_by_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_planning_edd ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.momid ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_executed_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_released_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_remarks ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_status ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                  ],
                                ))
                            .toList(),
                      ));
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 80),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Image.asset(
                        'asset/nodata.png',
                        width: 250,
                        height: 220,
                      ),
                    ),
                  );
                }
              } else {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 80),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Image.asset(
                      'asset/nodata.png',
                      width: 250,
                      height: 220,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  Future<List<Final_paint>> finals() async {
    var map = <String, String>{};
    map['job_num'] = job_num;

    var res =
        await apicalls.DisplyprocessforPMS(map, ApiClass.DISPLAYPROCESSFORPMS);
    var responseData = json.decode(res.body);
    String msg = responseData["message"];
    bool error = responseData["error"];
    print(msg);
    print(error);
    if (!error) {
      var dat = responseData["final_paint"];
      print(dat);
      dat.map((item) {
        final_paint.add(Final_paint.fromJson(item));
      }).toList();
      print(dat);
      DisplayProcessForPMS user = DisplayProcessForPMS(
          responseData["message"],
          responseData["error"],
          // production,
          // mom,
          // stores,
          // purchase,
          cnc,
          hub,
          impeller,
          machining,
          casing,
          accessories,
          fc_paint,
          assembly,
          testing,
          final_paint,
          packing);
      if (kDebugMode) {
        print(user.final_paint);
      }
    } else {}
    return final_paint;
  }

  PACKING() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: SingleChildScrollView(
        child: FutureBuilder<List<Packing>>(
            future: packings(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                if (snapshot.data?.length != 0) {
                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.indigo.shade800),
                        showCheckboxColumn: false, // <-- this is important
                        columns: [
                          DataColumn(
                              label: Text(
                            'Packing_Cdd',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                          DataColumn(
                            label: Text(
                              'Packing_Edd',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          //     DataColumn(
                          //       label: Text(
                          //         'id_no',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Text(
                          //         'order_num',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Container(
                          //         padding: EdgeInsets.only(left: 40),
                          //         child: Text(
                          //           'job_num_1',
                          //           style: TextStyle(
                          //               color: Colors.white,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15),
                          //         ),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Text(
                          //         'prod_code',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //         label: Text(
                          //       'short_char_01',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'order_qty_1',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'need_by_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_planning_edd',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'momid',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_executed_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_released_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_remarks',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_status',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                        ],

                        rows: snapshot.data!
                            .map((data) => DataRow(
                                  cells: [
                                    DataCell(
                                      Center(
                                        child: Text(
                                          data.need_by_date ?? "",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    DataCell(Center(
                                      child: Text(
                                        data.packing_dispatch_edd ?? "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.id_no ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.order_num ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.job_num_1 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.prod_code ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.short_char_01 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.order_qty_1 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.need_by_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_planning_edd ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.momid ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_executed_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_released_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_remarks ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_status ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                  ],
                                ))
                            .toList(),
                      ));
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 80),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Image.asset(
                        'asset/nodata.png',
                        width: 250,
                        height: 220,
                      ),
                    ),
                  );
                }
              } else {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 80),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Image.asset(
                      'asset/nodata.png',
                      width: 250,
                      height: 220,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  Future<List<Packing>> packings() async {
    var map = <String, String>{};
    map['job_num'] = job_num;

    var res =
        await apicalls.DisplyprocessforPMS(map, ApiClass.DISPLAYPROCESSFORPMS);
    var responseData = json.decode(res.body);
    String msg = responseData["message"];
    bool error = responseData["error"];
    print(msg);
    print(error);
    if (!error) {
      var dat = responseData["packing"];
      print(dat);
      dat.map((item) {
        packing.add(Packing.fromJson(item));
      }).toList();
      print(dat);
      DisplayProcessForPMS user = DisplayProcessForPMS(
          responseData["message"],
          responseData["error"],
          // production,
          // mom,
          // stores,
          // purchase,
          cnc,
          hub,
          impeller,
          machining,
          casing,
          accessories,
          fc_paint,
          assembly,
          testing,
          final_paint,
          packing);
      if (kDebugMode) {
        print(user.packing);
      }
    } else {}
    return packing;
  }

  FC_PAINT() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: SingleChildScrollView(
        child: FutureBuilder<List<Fc_paint>>(
            future: fcs(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                if (snapshot.data?.length != 0) {
                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.indigo.shade800),
                        showCheckboxColumn: false, // <-- this is important
                        columns: [
                          DataColumn(
                              label: Text(
                            'Fc_Paint_Cdd',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                          DataColumn(
                            label: Text(
                              'Fc_Paint_Edd',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          //     DataColumn(
                          //       label: Text(
                          //         'id_no',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Text(
                          //         'order_num',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Container(
                          //         padding: EdgeInsets.only(left: 40),
                          //         child: Text(
                          //           'job_num_1',
                          //           style: TextStyle(
                          //               color: Colors.white,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15),
                          //         ),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Text(
                          //         'prod_code',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //         label: Text(
                          //       'short_char_01',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'order_qty_1',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'need_by_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_planning_edd',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'momid',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_executed_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_released_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_remarks',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_status',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                        ],

                        rows: snapshot.data!
                            .map((data) => DataRow(
                                  cells: [
                                    DataCell(
                                      Center(
                                        child: Text(
                                          data.need_by_date ?? "",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    DataCell(Center(
                                      child: Text(
                                        data.first_coat_paint_edd ?? "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.id_no ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.order_num ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.job_num_1 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.prod_code ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.short_char_01 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.order_qty_1 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.need_by_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_planning_edd ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.momid ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_executed_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_released_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_remarks ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_status ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                  ],
                                ))
                            .toList(),
                      ));
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 80),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Image.asset(
                        'asset/nodata.png',
                        width: 250,
                        height: 220,
                      ),
                    ),
                  );
                }
              } else {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 80),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Image.asset(
                      'asset/nodata.png',
                      width: 250,
                      height: 220,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  Future<List<Fc_paint>> fcs() async {
    var map = <String, String>{};
    map['job_num'] = job_num;

    var res =
        await apicalls.DisplyprocessforPMS(map, ApiClass.DISPLAYPROCESSFORPMS);
    var responseData = json.decode(res.body);
    String msg = responseData["message"];
    bool error = responseData["error"];
    print(msg);
    print(error);
    if (!error) {
      var dat = responseData["fc_paint"];
      print(dat);
      dat.map((item) {
        fc_paint.add(Fc_paint.fromJson(item));
      }).toList();
      print(dat);
      DisplayProcessForPMS user = DisplayProcessForPMS(
          responseData["message"],
          responseData["error"],
          // production,
          // mom,
          // stores,
          // purchase,
          cnc,
          hub,
          impeller,
          machining,
          casing,
          accessories,
          fc_paint,
          assembly,
          testing,
          final_paint,
          packing);
      if (kDebugMode) {
        print(user.fc_paint);
      }
    } else {}
    return fc_paint;
  }

  ASSEMBLY() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: SingleChildScrollView(
        child: FutureBuilder<List<Assembly>>(
            future: assemblys(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                if (snapshot.data?.length != 0) {
                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.indigo.shade800),
                        showCheckboxColumn: false, // <-- this is important
                        columns: [
                          DataColumn(
                              label: Text(
                            'Assembly_Cdd',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                          DataColumn(
                            label: Text(
                              'Assembly_Edd',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          //     DataColumn(
                          //       label: Text(
                          //         'id_no',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Text(
                          //         'order_num',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Container(
                          //         padding: EdgeInsets.only(left: 40),
                          //         child: Text(
                          //           'job_num_1',
                          //           style: TextStyle(
                          //               color: Colors.white,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15),
                          //         ),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //       label: Text(
                          //         'prod_code',
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15),
                          //       ),
                          //     ),
                          //     DataColumn(
                          //         label: Text(
                          //       'short_char_01',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'order_qty_1',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'need_by_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_planning_edd',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'momid',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_executed_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_released_date',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_remarks',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          //     DataColumn(
                          //         label: Text(
                          //       'mom_status',
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                        ],

                        rows: snapshot.data!
                            .map((data) => DataRow(
                                  cells: [
                                    DataCell(
                                      Center(
                                        child: Text(
                                          data.need_by_date ?? "",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    DataCell(Center(
                                      child: Text(
                                        data.assembly_edd ?? "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.id_no ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.order_num ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.job_num_1 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.prod_code ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.short_char_01 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.order_qty_1 ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.need_by_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_planning_edd ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.momid ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_executed_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_released_date ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_remarks ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                    //               DataCell(Center(
                                    //                 child: Text(
                                    //                   data.mom_status ?? "",
                                    //                   style: TextStyle(
                                    //                       color: Colors.black,
                                    //                       fontWeight: FontWeight.bold,
                                    //                       fontSize: 14),
                                    //                 ),
                                    //               )),
                                  ],
                                ))
                            .toList(),
                      ));
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 80),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Image.asset(
                        'asset/nodata.png',
                        width: 250,
                        height: 220,
                      ),
                    ),
                  );
                }
              } else {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 80),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Image.asset(
                      'asset/nodata.png',
                      width: 250,
                      height: 220,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  Future<List<Assembly>> assemblys() async {
    var map = <String, String>{};
    map['job_num'] = job_num;

    var res =
        await apicalls.DisplyprocessforPMS(map, ApiClass.DISPLAYPROCESSFORPMS);
    var responseData = json.decode(res.body);
    String msg = responseData["message"];
    bool error = responseData["error"];
    print(msg);
    print(error);
    if (!error) {
      var dat = responseData["assembly"];
      print(dat);
      dat.map((item) {
        assembly.add(Assembly.fromJson(item));
      }).toList();
      print(dat);
      DisplayProcessForPMS user = DisplayProcessForPMS(
          responseData["message"],
          responseData["error"],
          // production,
          // mom,
          // stores,
          // purchase,
          cnc,
          hub,
          impeller,
          machining,
          casing,
          accessories,
          fc_paint,
          assembly,
          testing,
          final_paint,
          packing);
      if (kDebugMode) {
        print(user.assembly);
      }
    } else {}
    return assembly;
  }

  @override
  Widget build(BuildContext context) {
    // var inputFormat = DateFormat('order_date');
    // var inputDate = inputFormat.parse('2000/12/31'); // <-- dd/MM 24H format
    //
    // var outputFormat = DateFormat('dd/MM/yyyy');
    // var outputDate = outputFormat.format(inputDate);
    // print(outputDate);
    final gridview = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // padding: EdgeInsets.only(top: 10),
      children: <Widget>[
        Text(
          "Order Date",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.indigo.shade800),
          ),
          child: Text(
            order_date,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: Text(
            "Release Date",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.indigo.shade800),
          ),
          child: Text(
            release_date,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
        // Container(
        //   padding: EdgeInsets.all(10),
        //   height: 100,
        //   width: 150,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(color: Colors.indigo.shade800),
        //   ),
        //   child: Center(
        //     child: Text(
        //       release_date,
        //       style: TextStyle(color: Colors.black, fontSize: 15),
        //     ),
        //   ),
        // ),
        // Container(
        //   padding: EdgeInsets.only(right: 10, left: 10),
        //   height: 50,
        //   width: 100,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(color: Colors.indigo.shade800),
        //   ),
        //   child: Center(
        //     child: Text(
        //       sales_rep_code,
        //       style: TextStyle(color: Colors.black, fontSize: 15),
        //     ),
        //   ),
        // ),
        // Container(
        //   height: 100,
        //   width: 150,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(color: Colors.indigo.shade800),
        //   ),
        //   child: Center(
        //     child: Text(
        //       customer_contact_name,
        //       style: TextStyle(color: Colors.black, fontSize: 15),
        //     ),
        //   ),
        // ),
        // Container(
        //   height: 100,
        //   width: 150,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(color: Colors.indigo.shade800),
        //   ),
        //   child: Center(
        //     child: Text(
        //       city,
        //       style: TextStyle(color: Colors.black, fontSize: 15),
        //     ),
        //   ),
        // ),
        // Container(
        //   height: 100,
        //   width: 150,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(color: Colors.indigo.shade800),
        //   ),
        //   child: Center(
        //     child: Text(
        //       billing_group,
        //       style: TextStyle(color: Colors.black, fontSize: 15),
        //     ),
        //   ),
        // ),
        // Container(
        //   height: 50,
        //   width: 100,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(color: Colors.indigo.shade800),
        //   ),
        //   child: Center(
        //     child: Text(
        //       need_by_date,
        //       style: TextStyle(color: Colors.black, fontSize: 15),
        //     ),
        //   ),
        // ),
        // Container(
        //   height: 50,
        //   width: 100,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(color: Colors.indigo.shade800),
        //   ),
        //   child: Center(
        //     child: Text(
        //       request_date,
        //       style: TextStyle(color: Colors.black, fontSize: 15),
        //     ),
        //   ),
        // ),
        // Container(
        //   height: 50,
        //   width: 100,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(color: Colors.indigo.shade800),
        //   ),
        //   child: Center(
        //     child: Text(
        //       character_08,
        //       style: TextStyle(color: Colors.black, fontSize: 15),
        //     ),
        //   ),
        // ),
        // Container(
        //   height: 100,
        //   width: 150,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(color: Colors.indigo.shade800),
        //   ),
        //   child: Center(
        //     child: Text(
        //       prc_con_num,
        //       style: TextStyle(color: Colors.black, fontSize: 15),
        //     ),
        //   ),
        // ),
        // Container(
        //   height: 100,
        //   width: 150,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(color: Colors.indigo.shade800),
        //   ),
        //   child: Center(
        //     child: Text(
        //       date_06,
        //       style: TextStyle(color: Colors.black, fontSize: 15),
        //     ),
        //   ),
        // ),
        // Container(
        //   height: 100,
        //   width: 150,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(color: Colors.indigo.shade800),
        //   ),
        //   child: Center(
        //     child: Text(
        //       date_12,
        //       style: TextStyle(color: Colors.black, fontSize: 15),
        //     ),
        //   ),
        // ),
      ],
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   mainAxisExtent: 50.0,
      //   mainAxisSpacing: 10.0,
      //   crossAxisSpacing: 10.0,
      //   childAspectRatio: 4.0,
      //   crossAxisCount: 2,
      //   // crossAxisSpacing: 10,
      // ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade800,
        title: Container(
          padding: EdgeInsets.only(right: 40),
          child: Center(
            child: Text("Process Screen",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: gridview,
          ),
          Container(
              padding: EdgeInsets.only(top: 210),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                margin: const EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    TabBar(
                        indicatorColor: Colors.indigo[200],
                        indicatorWeight: 4.0,
                        unselectedLabelColor: Colors.white,
                        labelColor: Colors.white,
                        controller: _tabController,
                        isScrollable: true,
                        tabs: [
                          // Tab(
                          //   child: Text(
                          //     "Production",
                          //     style: TextStyle(
                          //         color: Colors.black,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 14.0),
                          //   ),
                          // ),
                          // Tab(
                          //   child: Text(
                          //     "Mom",
                          //     style: TextStyle(
                          //         color: Colors.black,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 14.0),
                          //   ),
                          // ),
                          // Tab(
                          //   child: Text(
                          //     "Stores",
                          //     style: TextStyle(
                          //         color: Colors.black,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 14.0),
                          //   ),
                          // ),
                          // Tab(
                          //   child: Text(
                          //     "Purchase",
                          //     style: TextStyle(
                          //         color: Colors.black,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 14.0),
                          //   ),
                          // ),
                          Tab(
                            child: Text(
                              "Cnc",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Hub",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Machining",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Impeller",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Casing",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Accessories",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Fc_paint",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Assembly",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Testing",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Final_Paint",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Packing",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                          ),
                        ]),

                    // SizedBox(
                    //   width: double.infinity,
                    //   height: 60,
                    //   child: ListView.builder(
                    //       physics: const BouncingScrollPhysics(),
                    //       itemCount: items.length,
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (ctx, index) {
                    //         return Column(
                    //           children: [
                    //             GestureDetector(
                    //               onTap: () {
                    //                 setState(() {
                    //                   current = index;
                    //                 });
                    //               },
                    //               child: AnimatedContainer(
                    //                 duration: const Duration(milliseconds: 300),
                    //                 margin: const EdgeInsets.all(5),
                    //                 width: 100,
                    //                 height: 45,
                    //                 decoration: BoxDecoration(
                    //                   color: current == index
                    //                       ? Colors.indigo[800]
                    //                       : Colors.indigoAccent,
                    //                   borderRadius: current == index
                    //                       ? BorderRadius.circular(15)
                    //                       : BorderRadius.circular(10),
                    //                   border: current == index
                    //                       ? Border.all(
                    //                           color: Colors.indigoAccent,
                    //                           width: 2)
                    //                       : null,
                    //                 ),
                    //                 child: Center(
                    //                   child: Text(
                    //                     items[index],
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.w500,
                    //                         color: current == index
                    //                             ? Colors.white
                    //                             : Colors.white),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //             Visibility(
                    //                 visible: current == index,
                    //                 child: Container(
                    //                   width: 5,
                    //                   height: 5,
                    //                   decoration: const BoxDecoration(
                    //                       color: Colors.indigoAccent,
                    //                       shape: BoxShape.circle),
                    //                 ))
                    //           ],
                    //         );
                    //       }),
                    // ),

                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // PRODUCTION(),
                          // MOM(),
                          // STORES(),
                          // PURCHASE(),
                          CNC(),
                          HUB(),
                          MACHINING(),
                          IMPELLER(),
                          CASING(),
                          ACCESSORIES(),
                          FC_PAINT(),
                          ASSEMBLY(),
                          TESTING(),
                          FINAL_PAINT(),
                          PACKING(),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
