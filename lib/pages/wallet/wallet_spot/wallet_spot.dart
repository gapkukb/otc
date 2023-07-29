import 'package:data_table_2/data_table_2.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/models/currency.dart';
import 'package:otc/models/wallet.balance/wallet.balance.dart';
import 'package:otc/providers/coin.provider.dart';
import 'package:otc/providers/wallet.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/utils/number.dart';
import 'package:otc/utils/responsive.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_chip.dart';

class WalletSpot extends ConsumerStatefulWidget {
  const WalletSpot({super.key});

  @override
  ConsumerState<WalletSpot> createState() => _WalletSpotState();
}

class _WalletSpotState extends ConsumerState<WalletSpot> {
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

  hanlder() {
    Modal.alert(content: "此功能正在紧急修复中。");
  }

  @override
  Widget build(context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildTop(),
          _buildStatics(context),
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
        isThreeLine: true,
        title: const Text(
          "现货钱包",
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
                "可以在平台使用币币交易",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  UiButton(
                    shape: UiButtonShape.rounded,
                    variant: UiButtonVariant.filled,
                    label: "Trade",
                    onPressed: hanlder,
                  ),
                  UiButton(
                    shape: UiButtonShape.rounded,
                    variant: UiButtonVariant.outline,
                    label: "划转",
                    onPressed: hanlder,
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
        subtitle: Text.rich(
          TextSpan(
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
            ],
          ),
        ),
      ),
    );
  }

  _buildTable() {
    final response = ref.watch(coinProvider);
    final wallet = ref.watch(walletProvider);
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
            DataColumn2(label: Text("币种"), fixedWidth: 48),
            DataColumn2(label: Text("全部")),
            DataColumn2(label: Text("可用")),
            DataColumn2(label: Text("冻结")),
            DataColumn2(
              label: Text(
                "  操作",
              ),
              fixedWidth: 140,
            ),
          ],
          rows: coins.map((coin) {
            return DataRow(
              cells: [
                DataCell(
                  UiChip(
                    iconWidget: SizedBox(
                      width: 20,
                      child: coin.icon,
                    ),
                    text: coin.name,
                  ),
                ),
                const DataCell(Text("0")),
                const DataCell(Text("0")),
                const DataCell(Text("0")),
                DataCell(Row(
                  children: [
                    UiButton.text(
                      label: "Trade",
                      size: UiButtonSize.mini,
                      onPressed: hanlder,
                    ),
                    UiButton.text(
                      label: "划转",
                      size: UiButtonSize.mini,
                      onPressed: hanlder,
                    )
                  ],
                )),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
