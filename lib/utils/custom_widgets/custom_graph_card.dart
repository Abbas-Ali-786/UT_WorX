import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomGraphCard {
  static Widget graphCard(
    String title, {
    double? fontSize,
    double? graphHeight,
    double? padding,
    bool isSecondGraph = false,
  }) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(padding ?? 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: fontSize ?? 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: graphHeight ?? 200,
              child: isSecondGraph ? _buildSecondGraph() : _buildGraph(),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildGraph() {
    return BarChart(
      BarChartData(
        backgroundColor: Colors.white,
        gridData: FlGridData(drawVerticalLine: false),
        borderData: FlBorderData(
          show: false,
        ),
        barGroups: List.generate(
          12,
          (index) => BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: (index + 1) * 20.0,
                color: Color(0XFF2563EB),
                width: 6,
                borderRadius: BorderRadius.all(Radius.zero),
              ),
              BarChartRodData(
                toY: (index + 1) * 15.0,
                color: Color(0XFF34D399),
                width: 6,
                borderRadius: BorderRadius.all(Radius.zero),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildSecondGraph() {
    return BarChart(
      BarChartData(
        backgroundColor: Colors.white,
        gridData: FlGridData(drawVerticalLine: false),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(
          12,
          (index) => BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: (index + 1) * 20.0,
                color: Color(0XFF2563EB),
                width: 6,
                borderRadius: BorderRadius.all(Radius.zero),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
