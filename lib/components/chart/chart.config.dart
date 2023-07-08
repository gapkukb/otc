import 'package:flutter/material.dart';

class ChartDataItem {
  final String xAisx;
  final num yAisx;
  final int index;

  const ChartDataItem({
    required this.xAisx,
    required this.yAisx,
    required this.index,
  });
}

class ChartConifg {
  final double barWidth;
  final Color color;
  final List<Color>? gradient;
  final Color? belowAreaColor;
  final List<Color>? belowAreaGradient;
  final List<ChartDataItem> data;

  const ChartConifg({
    required this.color,
    required this.data,
    required this.barWidth,
    this.belowAreaColor,
    this.belowAreaGradient,
    this.gradient,
  });
}
