import 'package:doof_app/charts/food_thrown_series.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class FoodThrownChart extends StatelessWidget {
  final List<FoodThrownSeries> data;
  const FoodThrownChart({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<charts.Series<FoodThrownSeries, String>> series = [
      charts.Series(
          id: "Food Thrown",
          data: data,
          domainFn: (FoodThrownSeries series, _) => series.year,
          measureFn: (FoodThrownSeries series, _) => series.weight,
          colorFn: (FoodThrownSeries series, _) => series.barColor)
    ];

    return Container(
      height: 300,
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: charts.BarChart(
                  series,
                  animate: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
