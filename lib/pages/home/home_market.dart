import 'dart:math';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/components/chart/chart.config.dart';
import 'package:otc/components/chart/chart.line.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';

class HomeMarket extends StatelessWidget {
  const HomeMarket({super.key});

  DataColumn col(String text) {
    return DataColumn(
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xff666666),
        ),
      ),
    );
  }

  row() {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text('Sarah')),
        DataCell(Text('19')),
        DataCell(Text('Student')),
        DataCell(
          SizedBox(
            height: 30,
            child: ChartLine(
              simple: true,
              config: [
                ChartConifg(
                  color: Colors.green,
                  barWidth: 1.5,
                  belowAreaGradient: [
                    Colors.green.withAlpha(50),
                    Colors.transparent,
                  ],
                  data: List.generate(
                    12,
                    (index) => ChartDataItem(
                      xAisx: index.toString(),
                      yAisx: Random().nextDouble(),
                      index: index,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        DataCell(
          const Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.keyboard_arrow_right_outlined),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 6,
      shadowColor: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 400,
            child: DataTable2(
              headingTextStyle: Font.smallGrey,
              dividerThickness: 0.01,
              dataRowHeight: 70,
              columns: const [
                DataColumn2(label: Text('币种')),
                DataColumn2(label: Text('成交均价')),
                DataColumn2(label: Text('24H涨跌')),
                DataColumn2(label: Text('走势')),
                DataColumn2(label: Text(''), fixedWidth: 80.0),
              ],
              rows: [
                row(),
                row(),
                row(),
              ],
            ),
          ),
          const SizedBox(height: 24),
          UiButton(
            onPressed: () {},
            shape: UiButtonShape.rounded,
            size: UiButtonSize.medium,
            child: const MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(
                "查看更多",
                style: TextStyle(),
              ),
            ),
          ),
          const SizedBox(height: 29),
        ],
      ),
    );
  }
}
