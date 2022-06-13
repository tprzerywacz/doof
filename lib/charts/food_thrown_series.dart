import 'package:charts_flutter/flutter.dart' as charts;

class FoodThrownSeries {
  final String year;
  final int weight;
  final charts.Color barColor;

  FoodThrownSeries(
      {required this.year, required this.weight, required this.barColor});
}
