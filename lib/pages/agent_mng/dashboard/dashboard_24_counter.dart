import 'dart:developer';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:otc/widgets/ui_button.dart';

final data = List.generate(24, (index) {
  return {
    "label": "0$index:00",
    "value": Random().nextDouble(),
    "index": index
  };
});

class Dashboard24Counter extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  const Dashboard24Counter({
    super.key,
    required this.data,
  });

  @override
  State<Dashboard24Counter> createState() => _Dashboard24CounterState();
}

class _Dashboard24CounterState extends State<Dashboard24Counter> {
  final double width = 5.0;

  int touchedGroupIndex = -1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          children: [
            Row(
              children: [
                Text("24小时交易数量"),
                DropdownButton(
                  items: [
                    DropdownMenuItem(child: Text("dasf"), value: 0),
                    DropdownMenuItem(child: Text("dasf"), value: 1),
                    DropdownMenuItem(child: Text("dasf"), value: 2),
                    DropdownMenuItem(child: Text("dasf"), value: 3),
                  ],
                  onChanged: (value) {},
                ),
                const Spacer(),
                UiButton(
                  variant: UiButtonVariant.text,
                  size: UiButtonSize.small,
                  icon: const Icon(
                    Icons.fiber_manual_record,
                    size: 12,
                  ),
                  label: "24小时卖币订单",
                  onPressed: () {},
                ),
                UiButton(
                  variant: UiButtonVariant.text,
                  size: UiButtonSize.small,
                  icon: const Icon(
                    Icons.fiber_manual_record,
                    size: 12,
                  ),
                  label: "24小时买币订单",
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            const Divider(
              height: 0,
              thickness: 0.5,
            ),
            _Chart()
          ],
        ),
      ),
    );
  }
}

class _Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.center,
          // maxY: 1,
          groupsSpace: 24,
          barGroups: data.map((item) {
            return BarChartGroupData(
              x: item['index'] as int,
              barsSpace: 4,
              barRods: [
                BarChartRodData(
                  toY: item['value'] as double,
                  width: 8,
                  color: Colors.amber,
                ),
                BarChartRodData(
                  toY: item['value'] as double,
                  width: 8,
                  color: Colors.blue,
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    color: Colors.grey,
                  ),
                ),
              ],
            );
          }).toList(),

          titlesData: FlTitlesData(
            show: true,
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
                      data[value.toInt()]['label'] as String,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              fitInsideVertically: true,
              fitInsideHorizontally: true,
            ),
          ),
          gridData: const FlGridData(
            drawVerticalLine: false,
          ),
          borderData: FlBorderData(
            show: false,
          ),
        ),
      ),
    );
  }
}
