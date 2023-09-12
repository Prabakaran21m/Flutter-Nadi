import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class mompage extends StatefulWidget {
  const mompage({Key? key}) : super(key: key);

  @override
  State<mompage> createState() => _mompageState();
}

class _mompageState extends State<mompage> {
  late DateTime selectedDate;
  var from_month = TextEditingController();
  var end_month = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  List<bool> checkboxValues = [false, false, false, false];
  void handleCheckboxClicked(int index) {
    setState(() {
      for (int i = 0; i < checkboxValues.length; i++) {
        if (i == index) {
          checkboxValues[i] = true; // Set selected checkbox as true
        } else {
          checkboxValues[i] = false; // Set other checkboxes as false
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2.0,
                    blurRadius: 2.0,
                    offset: Offset(0, 2), // Set the elevation values
                  ),
                ],
                color: Colors.white,
              ),
              height: MediaQuery.of(context).size.height * 1.05,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(top: 10, bottom: 10, right: 10),
                        height: 70,
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: Text(
                          'MOM',
                          style: TextStyle(
                              color: Color(0xFF153C86),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.exit_to_app),
                          label: Text('EXPORT'))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Checkbox(
                        value: checkboxValues[0],
                        onChanged: (bool? newValue) {
                          handleCheckboxClicked(0);
                        },
                      ),
                      Text('Yesterday'),
                      Checkbox(
                        value: checkboxValues[1],
                        onChanged: (bool? newValue) {
                          handleCheckboxClicked(1);
                        },
                      ),
                      Text('Weekly'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Checkbox(
                        value: checkboxValues[2],
                        onChanged: (bool? newValue) {
                          handleCheckboxClicked(2);
                        },
                      ),
                      Text('Monthly'),
                      Checkbox(
                        value: checkboxValues[3],
                        onChanged: (bool? newValue) {
                          handleCheckboxClicked(3);
                        },
                      ),
                      Text('Annual')
                    ],
                  ),
                  Visibility(
                    visible: checkboxValues[1],
                    child: Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Week Number'),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: checkboxValues[2],
                    child: Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              readOnly: true,
                              controller: from_month,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'From Month'),
                              onTap: () {},
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),
                          Expanded(
                            child: TextField(
                              readOnly: true,
                              controller: end_month,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'End Month'),
                              onTap: () {
                                _selectDate(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: checkboxValues[3],
                    child: Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.calendar_today_rounded),
                            border: OutlineInputBorder(),
                            labelText: 'years'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.70,
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: SfCartesianChart(
                          title: ChartTitle(
                              text: 'MOM ', textStyle: TextStyle(fontSize: 10)),
                          primaryXAxis: CategoryAxis(),
                          series: [
                            ColumnSeries<ChartData, String>(
                              dataSource: <ChartData>[ChartData('PLANNED', 1)],
                              xValueMapper: (ChartData ch, _) => ch.x,
                              yValueMapper: (ChartData ch, _) => ch.y,
                            ),
                            ColumnSeries<ChartData, String>(
                              dataSource: <ChartData>[ChartData('ACTUAL', 2)],
                              xValueMapper: (ChartData ch, _) => ch.x,
                              yValueMapper: (ChartData ch, _) => ch.y,
                            ),
                            ColumnSeries<ChartData, String>(
                              dataSource: <ChartData>[ChartData('DELAY ', 5)],
                              xValueMapper: (ChartData ch, _) => ch.x,
                              yValueMapper: (ChartData ch, _) => ch.y,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 1.3,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2.0,
                      blurRadius: 2.0,
                      offset: Offset(0, 2), // Set the elevation values
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 10, right: 10),
                          height: 70,
                          width: MediaQuery.of(context).size.width * 0.50,
                          child: Text(
                            'PLAN VS ACTUAL & DELAYED',
                            style: TextStyle(
                                color: Color(0xFF153C86),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                            onPressed: () {},
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
                        Checkbox(
                            activeColor: Colors.indigo.shade900,
                            value: checkboxValues[0],
                            onChanged: (value) {
                              handleCheckboxClicked(0);
                            }),
                        Text('Year'),
                        Checkbox(
                            activeColor: Colors.indigo.shade900,
                            value: checkboxValues[1],
                            onChanged: (value) {
                              handleCheckboxClicked(1);
                            }),
                        Text('Weekly'),
                        Checkbox(
                            activeColor: Colors.indigo.shade900,
                            value: checkboxValues[2],
                            onChanged: (value) {
                              handleCheckboxClicked(2);
                            }),
                        Text('Annual'),
                      ],
                    ),
                    Visibility(
                        visible: checkboxValues[1],
                        child: Padding(
                          padding: const EdgeInsets.only(left: 60, right: 60),
                          child: TextFormField(
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  labelText: 'Week Number',
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)))),
                        )),
                    Visibility(
                        visible: checkboxValues[2],
                        child: Padding(
                          padding: const EdgeInsets.only(left: 60, right: 60),
                          child: TextFormField(
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  labelText: 'Year',
                                  labelStyle: TextStyle(color: Colors.black),
                                  suffixIcon: Icon(Icons.calendar_today),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)))),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child: DataTable(
                              headingRowColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.indigo.shade900),
                              columnSpacing: 8.0,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2.0,
                                  blurRadius: 2.0,
                                  offset:
                                      Offset(0, 2), // Set the elevation values
                                ),
                              ], color: Colors.white),
                              columns: [
                                DataColumn(
                                    label: Text(
                                  'Department',
                                  style: TextStyle(color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataColumn(
                                    label: Text(
                                  'Planed Qty',
                                  style: TextStyle(color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataColumn(
                                    label: Text(
                                  'Actual Qty',
                                  style: TextStyle(color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataColumn(
                                    label: Text(
                                  'Delyed Qty',
                                  style: TextStyle(color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                )),
                              ],
                              rows: [
                                DataRow(
                                  cells: [
                                    DataCell(
                                      Center(
                                        child: Text('Production Drawing',
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('32',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(Center(
                                        child: Text('Mom',
                                            overflow: TextOverflow.ellipsis))),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('32',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(Center(
                                        child: Text('CNC',
                                            overflow: TextOverflow.ellipsis))),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('32',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(Center(
                                        child: Text('Hub',
                                            overflow: TextOverflow.ellipsis))),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('32',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(Center(
                                        child: Text('Machining',
                                            overflow: TextOverflow.ellipsis))),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('32',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(Center(
                                        child: Text('Impeller',
                                            overflow: TextOverflow.ellipsis))),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('32',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(Center(
                                        child: Text('Cashing',
                                            overflow: TextOverflow.ellipsis))),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('32',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(Center(
                                        child: Text('Accessories',
                                            overflow: TextOverflow.ellipsis))),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('32',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(Center(
                                        child: Text('First Coat Paint',
                                            overflow: TextOverflow.ellipsis))),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('32',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(Center(
                                        child: Text('Assembly',
                                            overflow: TextOverflow.ellipsis))),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('32',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(Center(
                                        child: Text('Testing',
                                            overflow: TextOverflow.ellipsis))),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('32',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(Center(
                                        child: Text('Final Paint',
                                            overflow: TextOverflow.ellipsis))),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('32',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(Center(
                                        child: Text('Packing',
                                            overflow: TextOverflow.ellipsis))),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('32',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(Center(
                                        child: Text('Dispatch',
                                            overflow: TextOverflow.ellipsis))),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('0',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                    DataCell(
                                        Center(
                                            child: Text('32',
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        onTap: () {}),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ),
                    Divider(thickness: 1),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  final String x;
  final int y;

  ChartData(this.x, this.y);
}
