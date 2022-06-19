import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'legend_widget.dart';

// Credit: https://dribbble.com/shots/10072126-Heeded-Dashboard
class ReasonBarChart extends StatelessWidget {
  const ReasonBarChart({Key? key}) : super(key: key);

  static const changePlanColor = Color(0xff632af2);
  static const toBigGroceriesColor = Color(0xffffb3ba);
  static const eventColor = Color(0xff578eff);
  static const shortExpirationColor = Color.fromARGB(255, 137, 255, 87);
  static const noneColor = Color.fromARGB(255, 255, 202, 87);
  static const boughtColor = Color.fromARGB(255, 200, 125, 165);
  static const eatUnexpectedColor = Color.fromARGB(255, 255, 87, 93);
  static const peelingsColor = Color.fromARGB(255, 132, 255, 87);
  static const keepingColor = Color.fromARGB(255, 255, 171, 87);
  static const rotenColor = Color.fromARGB(255, 87, 185, 255);
  static const betweenSpace = 0.05;

  BarChartGroupData generateGroupData(
      int x, double pilates, double quickWorkout, double cycling) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: pilates,
          color: changePlanColor,
          width: 15,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout,
          color: toBigGroceriesColor,
          width: 15,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace + quickWorkout + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout + betweenSpace + cycling,
          color: eventColor,
          width: 15,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff787694),
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = " 09/05 \n 16/05 ";
        break;
      case 1:
        text = " 17/05 \n 23/05 ";
        break;
      case 2:
        text = " 24/05 \n 30/05 ";
        break;
      case 3:
        text = " 31/06 \n 06/06 ";
        break;
      case 4:
        text = "This week";
        break;
      case 5:
        text = "JUN";
        break;
      case 6:
        text = "JUL";
        break;
      case 7:
        text = "AUG";
        break;
      case 8:
        text = "SEP";
        break;
      case 9:
        text = "OCT";
        break;
      case 10:
        text = "NOV";
        break;
      case 11:
        text = "DEC";
        break;
      default:
        text = "";
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 14),
            AspectRatio(
              aspectRatio: 1.5,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceEvenly,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(),
                    rightTitles: AxisTitles(),
                    topTitles: AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 40,
                      ),
                    ),
                  ),
                  barTouchData: BarTouchData(enabled: true),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: false),
                  barGroups: [
                    generateGroupData(0, 28.6,42.7,28.6),
                    generateGroupData(1, 23.0,57.4,19.5),
                    generateGroupData(2, 18.1,43.1,38.7),
                    generateGroupData(3, 28.3,36.7,34.9),
                    generateGroupData(4, 19.4,38.8,41.7),
                    // generateGroupData(5, 2, 5.6, 1.8),
                    // generateGroupData(6, 1.3, 3.2, 2),
                    // generateGroupData(7, 2.3, 3.2, 3),
                    // generateGroupData(8, 2, 4.8, 2.5),
                    // generateGroupData(9, 1.2, 3.2, 2.5),
                    // generateGroupData(10, 1, 4.8, 3),
                    // generateGroupData(11, 2, 4.4, 2.8),
                  ],
                  maxY: 100 + (betweenSpace * 3),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Legend:',
              style: TextStyle(
                color: Color(0xff171547),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            LegendsListWidget(
              legends: [
                Legend("Change cooking plan", changePlanColor),
                Legend("Too big groceries", toBigGroceriesColor),
                Legend("Events (parties, holidays)", eventColor),
                // Legend("Short expiration date", shortExpirationColor),
                // Legend("None, just throwing without any reason", noneColor),
                // Legend("Bought but didn't like it", boughtColor),
                // Legend("Eat out unexpected", eatUnexpectedColor),
                // Legend("Peelings and stale vegetable parts", peelingsColor),
                // Legend("Keeping too long", keepingColor),
                // Legend("Rotten food", rotenColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
