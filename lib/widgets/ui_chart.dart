import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class UiChartItem {
  String legend;
  Color color;
  List<dynamic> data;

  UiChartItem({
    this.legend = "",
    this.color = Colors.transparent,
    this.data = const [],
  });
}

class UiChart extends StatelessWidget {
  final List<UiChartItem> items;

  const UiChart({super.key, required this.items});

  static const _line = FlLine(
    color: Color(0xff4F4F4F),
    strokeWidth: 0.1,
    dashArray: [2],
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: _buildChart(),
      subtitle: Row(
        children: items.map(
          (item) {
            return Container(
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  LineChart _buildChart() {
    return LineChart(
      LineChartData(
        minY: 0,
        // minX: 1,
        lineTouchData: LineTouchData(
          getTouchLineEnd: (barData, spotIndex) {
            return 1000;
          },
          getTouchedSpotIndicator: (barData, spotIndexes) {
            var lineColor = barData.gradient?.colors.first ?? barData.color!;
            return spotIndexes.map((e) {
              return TouchedSpotIndicatorData(
                FlLine(
                  color: lineColor,
                  strokeWidth: 1.0,
                ),
                const FlDotData(show: true),
              );
            }).toList();
          },
        ),
        gridData: FlGridData(
          getDrawingHorizontalLine: (value) {
            return _line;
          },
          getDrawingVerticalLine: (value) {
            return _line;
          },
        ),
        titlesData: const FlTitlesData(
          show: false,
        ),
        borderData: FlBorderData(
          show: false,
        ),
        lineBarsData: items.map((item) {
          return LineChartBarData(
            show: true,
            spots: item.data
                .map(
                  (e) => FlSpot(
                    (e['x'] as num).toDouble(),
                    (e['y'] as num).toDouble(),
                  ),
                )
                .toList(),
            isCurved: true,
            color: item.color,
            barWidth: 2.0,
            belowBarData: BarAreaData(
              show: true,
              color: item.color.withOpacity(0.3),
            ),
          );
        }).toList(),
      ),
    );
  }
}
