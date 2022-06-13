import 'package:doof_app/charts/food_thrown_chart.dart';
import 'package:doof_app/stacked_bar.dart';
import 'package:doof_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:doof_app/charts/food_thrown_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        title: const Text("Statistics"),
        backgroundColor: const Color.fromARGB(255, 0, 160, 130),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'Type of food thrown',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            PieChart(
              dataMap: dataMap,
              animationDuration: const Duration(milliseconds: 1600),
              chartLegendSpacing: 30,
              chartRadius: MediaQuery.of(context).size.width / 1.6,
              //colorList: colorList,
              initialAngleInDegree: 0,
              chartType: ChartType.disc,
              ringStrokeWidth: 80,
              legendOptions: const LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                //legendShape: _BoxShape.circle,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: const ChartValuesOptions(
                showChartValueBackground: false,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: false,
                decimalPlaces: 1,
              ),
              // gradientList: ---To add gradient colors---
              // emptyColorGradient: ---Empty Color gradient---
            ),
            const WeekWraper(),
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'The amount of food thrown',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: FoodThrownChart(
                data: data,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'The reason of throwing food',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: ReasonBarChart(),
            ),
            const WeekWraper(),
            //const SomeScreen(),
            //Center(child: StackedBarChart.withSampleData())
          ],
        ),
      ),
    );
  }
}

final Map<String, double> dataMap = {
  "Meat": 5,
  "Vegetables": 3,
  "Fruit": 2,
  "Drinks": 6,
  "Dairy": 1,
  "Backery": 4,
  "Another": 5,
};
final List<FoodThrownSeries> data = [
  FoodThrownSeries(
    year: " 09/05 \n 16/05 ",
    weight: 600,
    barColor: charts.ColorUtil.fromDartColor(primaryColor),
  ),
  FoodThrownSeries(
    year: " 17/05 \n 23/05 ",
    weight: 500,
    barColor: charts.ColorUtil.fromDartColor(primaryColor),
  ),
  FoodThrownSeries(
    year: " 24/05 \n 30/05 ",
    weight: 460,
    barColor: charts.ColorUtil.fromDartColor(primaryColor),
  ),
  FoodThrownSeries(
    year: " 31/06 \n 06/06 ",
    weight: 520,
    barColor: charts.ColorUtil.fromDartColor(primaryColor),
  ),
  FoodThrownSeries(
    year: "This week",
    weight: 275,
    barColor: charts.ColorUtil.fromDartColor(customOrange),
  ),
];

class WeekWraper extends StatelessWidget {
  const WeekWraper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
            const Text(
              'This week',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward),
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
