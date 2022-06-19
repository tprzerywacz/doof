import 'package:doof_app/charts/food_thrown_series.dart';
import 'package:doof_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class FoodThrownChart extends StatelessWidget {
  const FoodThrownChart({
    Key? key,
    required this.data,
    required this.currentIndex,
    required this.onSeriesChanged,
  }) : super(key: key);

  final List<FoodThrownSeries> data;
  final int currentIndex;
  final ValueSetter<int> onSeriesChanged;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<FoodThrownSeries, String>> series = [
      charts.Series(
        id: "Food Thrown",
        data: data,
        domainFn: (FoodThrownSeries series, _) => series.year,
        measureFn: (FoodThrownSeries series, _) => series.weight,
        colorFn: (FoodThrownSeries series, _) =>
            charts.ColorUtil.fromDartColor(series.index == currentIndex ? customOrange : primaryColor),
      ),
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
                  selectionModels: [
                    charts.SelectionModelConfig(
                      type: charts.SelectionModelType.info,
                      changedListener: (model) {
                        final series = model.selectedDatum.first.datum as FoodThrownSeries;
                        onSeriesChanged(series.index);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
