import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartConfig {
  String legend;
  Color color;
  List<dynamic> data;

  ChartConfig({
    this.legend = "",
    this.color = Colors.transparent,
    this.data = const [],
  });
}

class C2cChartCommission extends StatelessWidget {
  List<List<dynamic>> dataList;
  List<Color> colors;

  C2cChartCommission({
    super.key,
    required this.dataList,
    required this.colors,
  });

  static const _line = FlLine(
    color: Color(0xff4F4F4F),
    strokeWidth: 1,
    dashArray: [2],
  );

  @override
  Widget build(BuildContext context) {
    int i = 0;

    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 1.70,
          child: DottedBorder(
            dashPattern: const [2],
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  getTouchLineEnd: (barData, spotIndex) {
                    return 1000;
                  },
                  getTouchedSpotIndicator: (barData, spotIndexes) {
                    var lineColor =
                        barData.gradient?.colors.first ?? barData.color!;
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
                lineBarsData: dataList.map((data) {
                  Color color = colors[i++];
                  return LineChartBarData(
                    show: false,
                    spots: data
                        .map(
                          (e) => FlSpot(
                            (e['x'] as num).toDouble(),
                            (e['y'] as num).toDouble(),
                          ),
                        )
                        .toList(),
                    isCurved: true,
                    color: color,
                    barWidth: 2.0,
                    belowBarData: BarAreaData(
                      show: true,
                      color: color.withOpacity(0.3),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        Row(
          children: [
            _buildLegend(
              label: "买单成交额",
              color: colors[0],
              onPressed: () {},
            ),
            _buildLegend(
              label: "卖单成交额",
              color: colors[1],
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }

  _buildLegend({
    required void Function() onPressed,
    required String label,
    required Color color,
  }) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: color,
        ),
      ),
      label: Text(label),
    );
  }
}
