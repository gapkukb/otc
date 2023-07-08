import 'dart:developer';
import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:otc/components/chart/chart.config.dart';
import 'package:otc/components/chart/chart.line.dart';
import 'package:otc/widgets/ui_button.dart';

final data = List.generate(24, (index) {
  return {
    "label": "0$index:00",
    "value": math.Random().nextDouble(),
    "index": index
  };
});

class Dashboard24Amount extends StatefulWidget {
  const Dashboard24Amount({
    super.key,
  });

  @override
  State<Dashboard24Amount> createState() => _Dashboard24AmountState();
}

class _Dashboard24AmountState extends State<Dashboard24Amount> {
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
  get minY {
    return data.map((e) => e['value'] as double).reduce(math.min);
  }

  get maxY {
    return data.map((e) => e['value'] as double).reduce(math.max);
  }

  get bound {
    return (maxY - minY) / data.length / 10;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ChartLine(
        config: [
          ChartConifg(
            color: Colors.green,
            barWidth: 3,
            belowAreaGradient: [
              Colors.green.withAlpha(50),
              Colors.transparent,
            ],
            data: List.generate(
              24,
              (index) => ChartDataItem(
                xAisx: index.toString(),
                yAisx: math.Random().nextDouble(),
                index: index,
              ),
            ),
          ),
          ChartConifg(
            color: Colors.pink,
            barWidth: 3,
            belowAreaGradient: [
              Colors.pink.withAlpha(50),
              Colors.transparent,
            ],
            data: List.generate(
              24,
              (index) => ChartDataItem(
                xAisx: index.toString(),
                yAisx: math.Random().nextDouble(),
                index: index,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
