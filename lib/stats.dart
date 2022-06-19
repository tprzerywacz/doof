import 'package:doof_app/charts/food_thrown_chart.dart';
import 'package:doof_app/charts/stacked_bar.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:doof_app/charts/food_thrown_series.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  final _weekIndex = ValueNotifier(4);

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
        child: ValueListenableBuilder<int>(
          valueListenable: _weekIndex,
          builder: (context, value, _) {
            return Column(
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
                  dataMap: dataMap[_weekIndex.value],
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
                WeekWraper(index: _weekIndex, label: data[_weekIndex.value].year),
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
                    currentIndex: value,
                    onSeriesChanged: (selectedValue) => _weekIndex.value = selectedValue,
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
              ],
            );
          },
        ),
      ),
    );
  }
}

final dataMap = <Map<String, double>>[
  {
    "Meat": 5,
    "Vegetables": 3,
    "Fruit": 2,
    "Drinks": 6,
    "Dairy": 1,
    "Backery": 4,
    "Another": 5,
  },
  {
    "Meat": 7,
    "Vegetables": 8,
    "Fruit": 1,
    "Drinks": 1,
    "Dairy": 2,
    "Backery": 6,
    "Another": 4,
  },
  {
    "Meat": 3,
    "Vegetables": 5,
    "Fruit": 6,
    "Drinks": 2,
    "Dairy": 3,
    "Backery": 3,
    "Another": 4,
  },
  {
    "Meat": 5,
    "Vegetables": 3,
    "Fruit": 4,
    "Drinks": 3,
    "Dairy": 2,
    "Backery": 1,
    "Another": 5,
  },
  {
    "Meat": 2,
    "Vegetables": 5,
    "Fruit": 6,
    "Drinks": 1,
    "Dairy": 2,
    "Backery": 4,
    "Another": 4,
  },
];

final List<FoodThrownSeries> data = [
  FoodThrownSeries(
    year: " 09/05 \n 16/05 ",
    weight: 600,
    index: 0,
  ),
  FoodThrownSeries(
    year: " 17/05 \n 23/05 ",
    weight: 500,
    index: 1,
  ),
  FoodThrownSeries(
    year: " 24/05 \n 30/05 ",
    weight: 460,
    index: 2,
  ),
  FoodThrownSeries(
    year: " 31/06 \n 06/06 ",
    weight: 520,
    index: 3,
  ),
  FoodThrownSeries(
    year: "This week",
    weight: 275,
    index: 4,
  ),
];

class WeekWraper extends StatelessWidget {
  const WeekWraper({
    Key? key,
    required this.index,
    required this.label,
  }) : super(key: key);

  final String label;
  final ValueNotifier<int> index;

  void _increment() => index.value = index.value + 1;

  void _decrement() => index.value = index.value - 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: index.value > 0 ? _decrement : null,
            icon: const Icon(Icons.arrow_back),
          ),
          Text(
            label.replaceAll("\n", " - "),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
          IconButton(
            onPressed: index.value < 4 ? _increment : null,
            icon: const Icon(Icons.arrow_forward),
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
