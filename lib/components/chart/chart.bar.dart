import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'chart.base.dart';

class ChartBar extends ChartBase {
  final double spacing;
  final double barSpacing;

  ChartBar({
    super.key,
    required super.config,
    this.spacing = 12,
    this.barSpacing = 4,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.center,
          // maxY: 1,
          // groupsSpace: spacing,
          barGroups: config[0].data.asMap().entries.map((item) {
            return BarChartGroupData(
              x: item.key,
              barsSpace: barSpacing,
              barRods: config.asMap().entries.map(
                (sub) {
                  return BarChartRodData(
                    toY: sub.value.data[item.key].yAisx.toDouble(),
                    width: sub.value.barWidth,
                    color: sub.value.color,
                  );
                },
              ).toList(),
            );
          }).toList(),
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              fitInsideVertically: true,
              fitInsideHorizontally: true,
            ),
          ),
          titlesData: titlesData,
          gridData: gridData,
          borderData: borderData,
        ),
      ),
    );
  }
}
