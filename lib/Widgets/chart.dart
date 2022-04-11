import '../theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<Color> gradientColors = [primary,black,Colors.yellow,blue];

LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(color: Colors.white,
            strokeWidth: 0.1,
            
          );
        }),
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        getTextStyles: (context, value) =>
             TextStyle(color: black.withOpacity(0.7), fontSize: 12),
        getTitles: (value) {
          switch (value.toInt()) {
            case 2:
              return '1';
            case 5:
              return '11';
            case 8:
              return '21';
          }
          return '';
        },
        margin: 6,
      ),
      leftTitles: SideTitles(
        showTitles: true,
        getTextStyles: (context, value) {
          const TextStyle(
            color: black,
            fontSize: 12,
          );
        },
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '10k';
            case 3:
              return '50k';
            case 5:
              return '100k';
          }
          return '';
        },
        reservedSize: 28,
        margin: 12,
      ),
    ),
    borderData: FlBorderData(
      show: true,
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: [
         const FlSpot(0, 3),
         const FlSpot(2.6, 2),
         const FlSpot(4.9, 5),
         const FlSpot(6.8, 3.1),
         const FlSpot(8, 4),
         const FlSpot(9.5, 3),
         const FlSpot(11, 4),
        ],
        isCurved: true,
        colors: gradientColors,
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
        ),
      ),
    ],
  );
}
