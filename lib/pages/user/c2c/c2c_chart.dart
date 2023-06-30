import 'package:flutter/material.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/utils/responsive.dart';
import 'package:otc/widgets/ui_chart.dart';

class C2cChart extends StatefulWidget {
  const C2cChart({super.key});

  @override
  State<C2cChart> createState() => _C2cChartState();
}

class _C2cChartState extends State<C2cChart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.responsive(
        400,
        lg: 200,
      ),
      child: Flex(
        direction: context.responsive(
          Axis.vertical,
          lg: Axis.horizontal,
        ),
        children: [
          Flexible(
            child: Panel(
              title: "dfad",
              child: Expanded(
                child: UiChart(
                  items: [
                    UiChartItem(
                      legend: "买单成交额",
                      color: const Color(0xffF94144),
                      data: const [
                        {"x": 0, "y": 3},
                        {"x": 2.6, "y": 2},
                        {"x": 4.9, "y": 5},
                        {"x": 6.8, "y": 1},
                        {"x": 8, "y": 4},
                        {"x": 9.5, "y": 3},
                        {"x": 11, "y": 4},
                      ],
                    ),
                    UiChartItem(
                      legend: "卖单成交额",
                      color: const Color(0xffF9C74F),
                      data: const [
                        {"x": 0, "y": 3},
                        {"x": 2.6, "y": 2},
                        {"x": 4.9, "y": 5},
                        {"x": 6.8, "y": 1},
                        {"x": 8, "y": 4},
                        {"x": 9.5, "y": 3},
                        {"x": 11, "y": 4},
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: Panel(
              title: "阿道夫",
              child: Expanded(
                child: UiChart(
                  items: [
                    UiChartItem(
                      legend: "近30日做市佣金",
                      color: const Color(0xffF94144),
                      data: const [
                        {"x": 0, "y": 3},
                        {"x": 2.6, "y": 2},
                        {"x": 4.9, "y": 5},
                        {"x": 6.8, "y": 1},
                        {"x": 8, "y": 4},
                        {"x": 9.5, "y": 3},
                        {"x": 11, "y": 4},
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
