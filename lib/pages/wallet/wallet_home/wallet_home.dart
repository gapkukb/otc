import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/components/tip/tip.dart';
import 'package:otc/utils/number.dart';
import 'package:otc/utils/responsive.dart';
import 'package:otc/widgets/ui_button.dart';

class WalletHome extends StatefulWidget {
  const WalletHome({super.key});

  @override
  State<WalletHome> createState() => _WalletHomeState();
}

class _WalletHomeState extends State<WalletHome> {
  static final List<Map<String, dynamic>> buttons = [
    {
      "child": "充值",
      "onPressed": () {},
    },
    {
      "child": "提现",
      "variant": UiButtonVariant.outline,
      "onPressed": () {},
    },
    {
      "child": "站内转账",
      "variant": UiButtonVariant.outline,
      "onPressed": () {},
    },
  ];

  static final List<Map<String, dynamic>> statics = [
    {
      "label": "账户余额",
      "value": 0,
    },
    {
      "label": "可用余额",
      "value": 0,
    },
    {
      "label": "冻结余额",
      "value": 0,
    },
  ];

  static final List<Map<String, dynamic>> wallets = [
    {
      "label": "资金",
      "balance": 0,
      "validBalance": 0,
      "invalidBalance": 0,
      "path": "/",
    },
    {
      "label": "现货",
      "balance": 0,
      "validBalance": 0,
      "invalidBalance": 0,
      "path": "/",
    },
    {
      "label": "合约",
      "balance": 0,
      "validBalance": 0,
      "invalidBalance": 0,
      "path": "/",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTop(),
          _buildStatics(context),
          _buildDataBoard(),
        ],
      ),
    );
  }

  Widget _buildStatics(BuildContext context) {
    return GridView.builder(
      itemCount: statics.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        height: 100,
      ),
      itemBuilder: (context, index) {
        return _buildStaticsItem(statics[index]);
      },
      cacheExtent: 100.0,
    );
  }

  Card _buildTop() {
    return Card(
      child: ListTile(
        isThreeLine: true,
        title: const Text(
          "钱包总览",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Wrap(
            spacing: 8,
            children: buttons.map((e) {
              return HitTestBlocker(
                up: false,
                child: UiButton(
                  shape: UiButtonShape.rounded,
                  variant: e['variant'],
                  onPressed: e['onPressed'],
                  label: e['child'],
                ),
              );
            }).toList(),
          ),
        ),
        trailing: TextButton(
          onPressed: () {},
          child: const Text("充值提现记录"),
        ),
      ),
    );
  }

  _buildStaticsItem(Map<String, dynamic> item) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 32,
        ),
        title: Text(item['label']),
        subtitle: Text.rich(TextSpan(
            text: (item['value'] as num).decimalize(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            children: const [
              TextSpan(
                text: " usdt",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ])),
      ),
    );
  }

  _buildDataBoard() {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: DataTable(
          headingTextStyle: const TextStyle(fontSize: 12, color: Colors.grey),
          dividerThickness: 0.01,
          columns: const [
            DataColumn(
              label: Text("类型"),
            ),
            DataColumn(
              label: Text("账户余额"),
            ),
            DataColumn(
              label: Text("可用余额"),
            ),
            DataColumn(
              label: Text("冻结余额"),
            ),
            DataColumn(
              label: Text("操作"),
            ),
          ],
          rows: wallets.map(_buildDashboardItem).toList(),
        ),
      ),
    );
  }

  DataRow _buildDashboardItem(Map<String, dynamic> item) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              Text(
                item['label'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Tip(
                iconSize: 16,
                message: "您的C2C交易钱包",
              )
            ],
          ),
        ),
        DataCell(
          Text("${(item['balance'] as num).decimalize()} USDT"),
        ),
        DataCell(
          Text("${(item['validBalance'] as num).decimalize()} USDT"),
        ),
        DataCell(
          Text("${(item['invalidBalance'] as num).decimalize()} USDT"),
        ),
        DataCell(
          UiButton(
            label: "查看",
            size: UiButtonSize.mini,
            variant: UiButtonVariant.text,
            onPressed: () {
              context.go(item['path']);
            },
          ),
        ),
      ],
    );
  }
}
