import 'package:data_table_2/data_table_2.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/models/currency.dart';
import 'package:otc/providers/coin.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/utils/number.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_chip.dart';

class WalletFutures extends ConsumerStatefulWidget {
  const WalletFutures({super.key});

  @override
  ConsumerState<WalletFutures> createState() => _WalletFuturesState();
}

class _WalletFuturesState extends ConsumerState<WalletFutures> with SingleTickerProviderStateMixin {
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
                  ? const SizedBox.shrink()
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
                children: [
                  UiButton(
                    shape: UiButtonShape.rounded,
                    variant: UiButtonVariant.filled,
                    label: "划转",
                    onPressed: () {
                      Modal.alert(content: "此功能正在紧急修复中。");
                    },
                  ),
                  UiButton(
                    shape: UiButtonShape.rounded,
                    variant: UiButtonVariant.outline,
                    label: "划转记录",
                    onPressed: () {
                      context.push(Routes.walletHistory, extra: 2);
                    },
                  ),
                ],
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
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
    final response = ref.watch(coinProvider);
    return response.when(
      error: (_, __) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
      data: (coins) {
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
          rows: coins
              .map(
                (e) => DataRow(
                  cells: [
                    DataCell(UiChip(
                      text: e.name,
                      iconWidget: SizedBox(
                        width: 20,
                        child: e.icon,
                      ),
                    )),
                    DataCell(Text(0.decimalize())),
                    DataCell(Text(0.decimalize())),
                    DataCell(Text(0.decimalize())),
                    DataCell(
                      UiButton(
                        variant: UiButtonVariant.text,
                        size: UiButtonSize.mini,
                        label: "划转",
                        onPressed: () {
                          Modal.alert(content: "此功能正在紧急修复中。");
                        },
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        );
      },
    );
  }
}
