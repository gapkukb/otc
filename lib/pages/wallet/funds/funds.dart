import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/pages/components/modal/modal.dart';
import 'package:otc/pages/components/panel/panel.dart';
import 'package:otc/utils/responsive.dart';
import 'package:otc/widgets/ui_empty_view.dart';
import 'package:otc/widgets/ui_flex.dart';

class Funds extends StatefulWidget {
  const Funds({super.key});

  @override
  State<Funds> createState() => _FundsState();
}

class _FundsState extends State<Funds> {
  static List<Map<String, dynamic>> items = [
    {
      "label": "账户余额",
      "value": "5935999.00",
      "unit": "USD",
    },
    {
      "label": "可用余额",
      "value": "5935999.00",
      "unit": "USD",
    },
    {
      "label": "冻结余额",
      "value": "5935999.00",
      "unit": "USD",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SizedBox();
        },
      ),
    );
  }

  _buildCard(dynamic item) {
    return Card(
      child: ListTile(
        titleTextStyle: const TextStyle(fontSize: 16),
        title: Text(item['label']),
        subtitleTextStyle:
            const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text.rich(TextSpan(
            text: item['value'],
            children: [
              TextSpan(
                text: " ${item['unit']}",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          )),
        ),
      ),
    );
  }

  _buildTable() {
    return DataTable2(
      columnSpacing: 8,
      horizontalMargin: 8,
      dividerThickness: 0.01,
      headingTextStyle: const TextStyle(color: Colors.grey),
      columns: const [
        DataColumn2(label: Text("币种"), fixedWidth: 48),
        DataColumn2(label: Text("全部")),
        DataColumn2(label: Text("可用")),
        DataColumn2(label: Text("冻结")),
        DataColumn2(
            label: Text(
              "\t\t\t操作",
              style: TextStyle(),
            ),
            fixedWidth: 120),
      ],
      rows: List.generate(
        10,
        (index) => DataRow(
          cells: [
            DataCell(Text("是狗鸡啊")),
            DataCell(Text("是狗鸡啊")),
            DataCell(Text("是狗鸡啊")),
            DataCell(Text("是狗鸡啊")),
            DataCell(
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    child: const Text("查看"),
                    onPressed: () {},
                  ),
                  TextButton(
                    onPressed: () {
                      Modal.confirm(
                        content: "确认要删除改收款地址吗",
                        onOk: () {},
                      );
                    },
                    child: const Text("删除"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ).toList(),
      empty: const UiEmptyView(),
    );
  }
}
