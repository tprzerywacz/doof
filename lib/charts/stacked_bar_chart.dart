// /// Bar chart example
// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// class StackedBarChart extends StatelessWidget {
//   final List<charts.Series<OrdinalSales, String>> 
// seriesList;
//   const StackedBarChart({super.key, required this.seriesList});

//   /// Creates a stacked [BarChart] with sample data and no transition.
//   factory StackedBarChart.withSampleData() {
//     return StackedBarChart(
//       seriesList: _createSampleData(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return charts.BarChart(
//       seriesList,
//       animate: true,
//       barGroupingType: charts.BarGroupingType.stacked,
//     );
//   }

//   /// Create series list with multiple series
//   static List<charts.Series<OrdinalSales, String>> _createSampleData() {
//     final desktopSalesData = [
//       OrdinalSales('2014', 5),
//       OrdinalSales('2015', 25),
//       OrdinalSales('2016', 100),
//       OrdinalSales('2017', 75),
//     ];

//     final tableSalesData = [
//       OrdinalSales('2014', 25),
//       OrdinalSales('2015', 50),
//       OrdinalSales('2016', 10),
//       OrdinalSales('2017', 20),
//     ];

//     final mobileSalesData = [
//       OrdinalSales('2014', 10),
//       OrdinalSales('2015', 15),
//       OrdinalSales('2016', 50),
//       OrdinalSales('2017', 45),
//     ];

//     return [
//       charts.Series<OrdinalSales, String>(
//         id: 'Desktop',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: desktopSalesData,
//       ),
//       charts.Series<OrdinalSales, String>(
//         id: 'Tablet',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: tableSalesData,
//       ),
//       charts.Series<OrdinalSales, String>(
//         id: 'Mobile',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: mobileSalesData,
//       ),
//     ];
//   }
// }

// /// Sample ordinal data type.
// class OrdinalSales {
//   final String year;
//   final int sales;

//   OrdinalSales(this.year, this.sales);
// }
