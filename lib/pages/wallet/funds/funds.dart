import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/utils/responsive.dart';
import 'package:otc/widgets/ui_chip.dart';
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

  static final List<dynamic> actions = [
    {
      "name": "充值",
      "action": () {},
    },
    {
      "name": "提币",
      "action": () {},
    },
    {
      "name": "站内转账",
      "action": () {},
    },
    {
      "name": "购买",
      "action": () {},
    },
    {
      "name": "出售",
      "action": () {},
    },
    {
      "name": "划转",
      "action": () {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildTop(),
          UiFlex2(
            data: items,
            itemBuilder: _buildCard,
          ),
          Panel(
            title: "资金账户",
            child: SizedBox(
              width: double.infinity,
              child: _buildTable(),
            ),
          ),
        ],
      ),
    );
  }

  _buildTop() {
    return Card(
      child: ListTile(
        title: const Text("资金钱包"),
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        subtitle: Wrap(
          spacing: 8.0,
          children: [
            MaterialButton(
              shape: const StadiumBorder(),
              textColor: Colors.white,
              color: Colors.cyan,
              child: const Text("充值"),
              onPressed: () {
                Modal.confirm(
                  title: "交易资格",
                  okText: "去认证",
                  content: "您必须完成至少KYC1级别的身份认证才能开启收款方式功能。",
                  onOk: () {},
                );
              },
            ),
            MaterialButton(
              shape: const StadiumBorder(side: BorderSide(width: 1)),
              child: const Text("提现"),
              onPressed: () {
                Modal.confirm(
                  title: "交易资格",
                  okText: "去认证",
                  content: "您必须完成至少KYC1级别的身份认证才能开启收款方式功能。",
                  onOk: () {},
                );
              },
            ),
            MaterialButton(
              shape: const StadiumBorder(side: BorderSide(width: 1)),
              child: const Text("站内转账"),
              onPressed: () {
                Modal.confirm(
                  okText: "去认证",
                  content: "此功能正在紧急修复中。",
                  onOk: () {},
                );
              },
            ),
          ],
        ),
        trailing: TextButton(
          child: const Text("充值提现记录"),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildCard(dynamic item, int index) {
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
    Widget Function(dynamic item) action;

    if (context.md) {
      action = (dynamic item) {
        return IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            Modal.showBottomSheet(
              items: actions.map(
                (e) {
                  return BottomSheetItem(
                    label: e['name'],
                  );
                },
              ).toList(),
              onSelected: (value, item) {},
            );
          },
        );
      };
    } else {
      action = (dynamic item) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: actions
              .map(
                (e) => TextButton(
                  onPressed: e['action'],
                  child: Text(e['name']),
                ),
              )
              .toList(),
        );
      };
    }

    return DataTable(
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
            "     操作",
          ),
          fixedWidth: 120,
        ),
      ],
      rows: List.generate(100, (index) {
        return DataRow(
          cells: [
            DataCell(
              UiChip(
                icon: Icons.abc,
                text: "USDT",
              ),
            ),
            DataCell(Text("是狗鸡啊")),
            DataCell(Text("是狗鸡啊")),
            DataCell(Text("是狗鸡啊")),
            DataCell(action({})),
          ],
        );
      }).toList(),
    );
  }
}
