import 'key.dart';

// class ChartData {
//   final String SeriesType;
//   final List<double> values;
//
//   ChartData({required this.SeriesType, required this.values});
// }

class Keyvalues {
  String key, value;
  bool status;
  Keyvalues({required this.key, required this.value, this.status = true});
}

class ChartData1 {
  final String category;
  final double planned;

  ChartData1({
    required this.category,
    required this.planned,
  });
}

class ChartData2 {
  final String category1;
  final double actual;
  // final double delayed;

  ChartData2({
    required this.category1,
    required this.actual,
  });
}

class ChartData3 {
  final String category3;
  final double delayed;

  ChartData3({
    required this.category3,
    required this.delayed,
  });
}
