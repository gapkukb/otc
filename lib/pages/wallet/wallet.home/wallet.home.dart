import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/components/tip/tip.dart';
import 'package:otc/providers/wallet.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/number.dart';
import 'package:otc/widgets/ui_button.dart';

class WalletHome extends ConsumerWidget {
  const WalletHome({super.key});
  @override
  Widget build(context, ref) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTop(context, ref),
          _buildStatics(context, ref),
          _buildDataBoard(context, ref),
        ],
      ),
    );
  }

  Widget _buildStatics(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(balanceProvider);
    final List<Map<String, dynamic>> statics = [
      {
        "label": "账户余额",
        "value": balance.balance,
      },
      {
        "label": "可用余额",
        "value": balance.valid,
      },
      {
        "label": "冻结余额",
        "value": balance.freezed,
      },
    ];

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

  Card _buildTop(BuildContext context, WidgetRef ref) {
    final List<Map<String, dynamic>> buttons = [
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
        "onPressed": () {
          context.push(Routes.transfer);
        },
      },
    ];
    return Card(
      child: ListTile(
        isThreeLine: true,
        title: const Text(
          "钱包总览",
          style: Font.x3largeBold,
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
          child: const Text("充值提现记录"),
          onPressed: () {
            context.go(Routes.walletHistory);
          },
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
        subtitle: Text.rich(TextSpan(text: (item['value'] as num).decimalize(), style: Font.x2largeBold, children: [
          TextSpan(
            text: " USD",
            style: Font.medium.copyWith(fontWeight: FontWeight.normal),
          ),
        ])),
      ),
    );
  }

  _buildDataBoard(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(balanceProvider);

    final List<Map<String, dynamic>> wallets = [
      {
        "label": "资金",
        "balance": balance.balance,
        "validBalance": balance.valid,
        "invalidBalance": balance.freezed,
        "path": "/wallet_funds",
        "tooltip": "您的C2C交易钱包",
      },
      {
        "label": "现货",
        "balance": 0,
        "validBalance": 0,
        "invalidBalance": 0,
        "path": "/wallet_spot",
        "tooltip": "您的加密货币交易钱包",
      },
      {
        "label": "合约",
        "balance": 0,
        "validBalance": 0,
        "invalidBalance": 0,
        "path": "/wallet_futures",
        "tooltip": "合约账户",
      },
    ];
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
          rows: wallets.map((item) => _buildDashboardItem(context, item)).toList(),
        ),
      ),
    );
  }

  DataRow _buildDashboardItem(BuildContext context, Map<String, dynamic> item) {
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
                message: item['tooltip'],
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
