import 'package:code/pie_chart_sections.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'indicators_widget.dart';

class Pie extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChartPageState();
}

class PieChartPageState extends State {
  int? touchedIndex;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Card(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                      // touchCallback: (pieTouchResponse, _) {
                      //   setState(() {
                      //     if (pieTouchResponse is FlLongPressEnd ||
                      //         pieTouchResponse is FlPanEndEvent) {
                      //       touchedIndex = -1;
                      //     } else {
                      //       touchedIndex = (pieTouchResponse as int);
                      //     }
                      //   });
                      // },
                      ),
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: getSections(touchedIndex!),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: IndicatorsWidget(),
                ),
              ],
            ),
          ],
        ),
      );
}
