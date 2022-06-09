import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Statistics extends StatelessWidget {
  Statistics({super.key});
  final Map<String, double> dataMap = {
    "Meat": 5,
    "Vegetables": 3,
    "Fruit": 2,
    "Drinks": 6,
    "Dairy": 1,
    "Backery": 4,
    "Another": 5,
  };

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
      body: Column(
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
          Center(
            child: Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                  const Text(
                    'This week',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward),
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'The amount of food thrown',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // SimpleBarChart.withRandomData(),
        ],
      ),
    );
  }
}
