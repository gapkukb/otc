import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:otc/components/chart/chart.config.dart';

abstract class ChartBase extends StatelessWidget {
  final List<ChartConifg> config;
  final bool simple;
  ChartBase({
    super.key,
    required this.config,
    this.simple = false,
  });

  get titlesData {
    return FlTitlesData(
      show: !simple,
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            return Transform.translate(
              offset: const Offset(0, 16),
              child: Text(
                config[0]?.data[value.toInt()].xAisx.toString() ?? "",
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  get gridData {
    return FlGridData(
      show: !simple,
      drawVerticalLine: false,
    );
  }

  final borderData = FlBorderData(
    show: false,
  );
}
