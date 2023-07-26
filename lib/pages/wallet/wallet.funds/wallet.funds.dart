import 'package:data_table_2/data_table_2.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/global/global.dart';
import 'package:otc/models/currency.dart';
import 'package:otc/models/wallet.balance/wallet.balance.dart';
import 'package:otc/pages/async_builder/async_builder.dart';
import 'package:otc/providers/coin.provider.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/providers/wallet.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/utils/number.dart';
import 'package:otc/utils/predication.dart';
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
      okButtonText: "去认证",
      onOk: () {
        GoRouter.of(navigatorKey.currentContext!).go('/topup');
      },
    );
    return false;
  }

  return true;
}

class WalletFunds extends ConsumerStatefulWidget {
  const WalletFunds({super.key});

  @override
  ConsumerState<WalletFunds> createState() => _WalletFundsState();
}

class _WalletFundsState extends ConsumerState<WalletFunds> {
  static final List<_Item> actions = [
    _Item(
      name: "充值",
      hanlder: (context, coin) {},
    ),
    _Item(
      name: "提币",
      hanlder: (context, coin) {},
    ),
    _Item(
      name: "站内转账",
      hanlder: (context, coin) {},
    ),
    _Item(
      name: "购买",
      hanlder: (context, coin) {},
    ),
    _Item(
      name: "出售",
      hanlder: (context, coin) {},
    ),
    _Item(
      name: "划转",
      hanlder: (context, coin) {},
    ),
  ];

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
      "onPressed": () {
        if (ifNotKYC1(0)) {
          GoRouter.of(navigatorKey.currentContext!).push(Routes.transfer);
        }
      },
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
          "资金钱包 ",
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
                "可以使用链上交易，平台好友转账",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: buttons.map(
                  (e) {
                    return UiButton(
                      shape: UiButtonShape.rounded,
                      variant: e['variant'],
                      onPressed: e['onPressed'],
                      label: e['child'],
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
              fixedWidth: 120,
            ),
          ],
          rows: coins.map((coin) {
            final Detail? current = wallet.detail.firstWhere((element) => element.currency == coin.name);
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
                DataCell(Text((current?.balance ?? 0).decimalize())),
                DataCell(Text((current?.canUsd ?? 0).decimalize())),
                DataCell(Text(((current?.balance ?? 0) - (current?.canUsd ?? 0)).decimalize())),
                DataCell(
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: actions
                        .map(
                          (action) => UiButton(
                            variant: UiButtonVariant.text,
                            size: UiButtonSize.mini,
                            onPressed: () async {
                              if (coin.name == Coins.USDT.name) {
                                if (await predication(
                                  context: context,
                                  types: [Predication.kyc1],
                                )) {
                                  action.hanlder(context, coin);
                                }
                              } else {
                                Modal.alert(content: "此功能正在紧急修复中。");
                              }
                            },
                            child: Text(action.name),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}

class _Item {
  final String name;
  final Function(BuildContext context, Coins coin) hanlder;
  _Item({
    required this.name,
    required this.hanlder,
  });
}
