import 'package:data_table_2/data_table_2.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/models/currency.dart';
import 'package:otc/router/router.dart';
import 'package:otc/utils/number.dart';
import 'package:otc/utils/responsive.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_chip.dart';
import 'package:otc/widgets/ui_empty_view.dart';
import 'package:otc/widgets/ui_flex.dart';

bool ifUsdt(String currencyName) {
  if (currencyName == CurrencyCollection.USDT.name) {
    return true;
  }
  Modal.alert(content: "此功能正在紧急修复中。");
  return false;
}

bool ifNotKYC1(int kyc) {
  if (kyc == 1) {
    Modal.confirm(
      title: "交易资格",
      content: "您必须完成至少初级KYC认证才能开启该功能。",
      okText: "去认证",
      onOk: () {
        GoRouter.of(navigatorKey.currentContext!).go('/topup');
      },
    );
    return false;
  }

  return true;
}

class WalletFutures extends StatefulWidget {
  const WalletFutures({super.key});

  @override
  State<WalletFutures> createState() => _WalletFuturesState();
}

class _WalletFuturesState extends State<WalletFutures>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  static final List<Map<String, dynamic>> statics = [
    {
      "label": "保证金余额",
      "value": 0,
    },
    {
      "label": "余额",
      "value": 0,
    },
    {
      "label": "冻结余额",
      "value": 0,
    },
  ];

  static final List<Map<String, dynamic>> buttons = [
    {
      "child": "划转",
      "onPressed": () {
        Modal.alert(content: "此功能正在紧急修复中。");
      },
    },
    {
      "child": "划转记录",
      "variant": UiButtonVariant.outline,
      "onPressed": () {},
    },
  ];

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    controller.addListener(updateView);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(updateView);
    controller.dispose();
    super.dispose();
  }

  updateView() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildTop(),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(
                      Icons.priority_high,
                      color: Colors.red,
                    ),
                    Text("向合约账户转入保证金资产，即可开始交易。")
                  ],
                ),
              ),
            ),
          ),
          _buildStatics(context),
          Panel(
            titleWidget: TabBar(
              controller: controller,
              isScrollable: true,
              labelPadding: const EdgeInsets.all(16.0),
              tabs: const [
                Text("仓位"),
                Text("资产"),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: controller.index == 0
                  ? SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: _buildTable(),
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: _buildTable(),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  _buildTop() {
    return Card(
      child: ListTile(
        isThreeLine: true,
        title: const Text(
          "合约钱包",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "可以在平台使用合约交易",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: buttons.map(
                  (e) {
                    return HitTestBlocker(
                      up: false,
                      child: UiButton(
                        shape: UiButtonShape.rounded,
                        variant: e['variant'],
                        onPressed: e['onPressed'],
                        label: e['child'],
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ),
        trailing: TextButton(
          child: const Text("充值提现记录"),
          onPressed: () {},
        ),
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
                text: " USD",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ])),
      ),
    );
  }

  _buildTable() {
    return DataTable(
      columnSpacing: 8,
      horizontalMargin: 8,
      dividerThickness: 0.01,
      headingTextStyle: const TextStyle(color: Colors.grey),
      columns: const [
        DataColumn2(label: Text("资产")),
        DataColumn2(label: Text("余额")),
        DataColumn2(label: Text("未实现盈亏")),
        DataColumn2(label: Text("保证金余额")),
        DataColumn2(label: Text("  操作")),
      ],
      rows: CurrencyCollection.values
          .map(
            (e) => DataRow(
              cells: [
                DataCell(Text(e.name)),
                DataCell(Text("data")),
                DataCell(Text("data")),
                DataCell(Text("data")),
                DataCell(
                  UiButton(
                    variant: UiButtonVariant.text,
                    size: UiButtonSize.mini,
                    label: "划转",
                    onPressed: () {
                      if (ifUsdt(e.name)) {}
                    },
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
