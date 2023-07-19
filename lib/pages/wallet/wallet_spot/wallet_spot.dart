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

class WalletSpot extends StatefulWidget {
  const WalletSpot({super.key});

  @override
  State<WalletSpot> createState() => _WalletSpotState();
}

class _WalletSpotState extends State<WalletSpot> {
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

  static final List<dynamic> actions = [
    {
      "name": "Trade",
      "action": (String currencyName) {
        if (ifUsdt(currencyName)) {}
      },
    },
    {
      "name": "划转",
      "action": (String currencyName) {
        if (ifUsdt(currencyName) && ifNotKYC1(0)) {}
      },
    }
  ];

  static final List<Map<String, dynamic>> buttons = [
    {
      "child": "Trade",
      "onPressed": () {},
    },
    {
      "child": "划转",
      "variant": UiButtonVariant.outline,
      "onPressed": () {},
    },
  ];

  static final currencyCollection = CurrencyCollection.values;

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
    Widget Function(String name) action;

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
      action = (String item) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: actions
              .map(
                (e) => UiButton(
                  variant: UiButtonVariant.text,
                  size: UiButtonSize.mini,
                  onPressed: () {
                    e['action'](item);
                  },
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
            "  操作",
          ),
          fixedWidth: 140,
        ),
      ],
      rows: currencyCollection.map((currency) {
        return DataRow(
          cells: [
            DataCell(
              UiChip(
                icon: Icons.abc,
                text: currency.name,
              ),
            ),
            DataCell(Text("是狗鸡啊")),
            DataCell(Text("是狗鸡啊")),
            DataCell(Text("是狗鸡啊")),
            DataCell(action(currency.name)),
          ],
        );
      }).toList(),
    );
  }
}
