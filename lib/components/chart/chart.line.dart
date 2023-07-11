import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:otc/components/chart/chart.config.dart';
import 'dart:math' as math;
import 'chart.base.dart';

class ChartLine extends ChartBase {
  ChartLine({
    super.key,
    required super.config,
    super.simple,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: LineChart(
        LineChartData(
          // minY: minY + bound,
          // maxY: maxY - bound,
          lineBarsData: config
              .map(
                (item) => LineChartBarData(
                  barWidth: item.barWidth,
                  spots: item.data
                      .map(
                        (each) => FlSpot(
                          each.index.toDouble(),
                          each.yAisx.toDouble(),
                        ),
                      )
                      .toList(),
                  isCurved: true,
                  color: item.color,
                  gradient: item.gradient == null
                      ? null
                      : LinearGradient(colors: item.gradient!),
                  isStrokeCapRound: true,
                  dotData: const FlDotData(
                    show: false,
                  ),
                  belowBarData: item.belowAreaGradient == null
                      ? null
                      : BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            begin: Alignment(0, simple ? 0 : -1),
                            end: const Alignment(0, 1),
                            stops: [0.1, simple ? 0.5 : -1],
                            colors: item.belowAreaGradient!,
                          ),
                        ),
                ),
              )
              .toList(),
          lineTouchData: LineTouchData(
            enabled: false,
            touchSpotThreshold: 100,
            getTouchLineEnd: (barData, spotIndex) {
              return 1000.0;
            },
            getTouchedSpotIndicator: (barData, spotIndexes) {
              var lineColor = barData.gradient?.colors.first ?? barData.color!;
              return spotIndexes.map((e) {
                return TouchedSpotIndicatorData(
                  FlLine(
                    color: lineColor,
                    strokeWidth: 0.5,
                  ),
                  const FlDotData(show: false),
                );
              }).toList();
            },
            touchTooltipData: const LineTouchTooltipData(
              fitInsideHorizontally: true,
              fitInsideVertically: true,
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
