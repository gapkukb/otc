import 'package:flutter/material.dart';
import 'package:otc/components/address_selector/address_selector.dart';
import 'package:otc/components/blockchain_selector/blockchain_selector.dart';
import 'package:otc/components/cell/cell.dart';
import 'package:otc/components/currency_selector/currency_selector.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/wallet_address.input/wallet_address.input.dart';
import 'package:otc/pages/wallet/recharge/recharge.stepper.dart';
import 'package:otc/pages/wallet/withdrawal/withdrawal.counter.dart';
import 'package:otc/pages/wallet/withdrawal/withdrawal.order.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_chip.dart';
import 'package:otc/widgets/ui_clipboard.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Withdrawal extends StatefulWidget {
  const Withdrawal({super.key});

  @override
  State<Withdrawal> createState() => _WithdrawalState();
}

class _WithdrawalState extends State<Withdrawal>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  final Map<String, dynamic> formState = {};

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('数字货币提币'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 36),
          CurrencySelector(
            name: "currency",
            formState: formState,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabBar(
                controller: controller,
                isScrollable: true,
                physics: const NeverScrollableScrollPhysics(),
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(text: "使用新地址"),
                  Tab(text: "提币地址簿"),
                ],
              ),
              UiButton.text(
                onPressed: () {},
                label: "地址管理",
              )
            ],
          ),
          // controller.index==0?
          const Divider(thickness: 1, height: 1),
          const Gap.medium(),
          WalletAddressInput(
            name: "currency",
            formState: formState,
          ),
          const Gap.medium(),
          BlockchainSelector(
            name: "currency",
            formState: formState,
          ),
          const Gap.medium(),
          ListTile(
            title: Text.rich(TextSpan(text: "提币数量", children: [
              TextSpan(text: "0.00USDT可用"),
            ])),
            subtitle: Text(
              "123123213.00",
              style: Font.x2largeBold,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(onPressed: () {}, child: const Text("全部")),
                const Text("USDT")
              ],
            ),
          ),
          const WithdrawalCounter(),
          AddressSelector(name: ""),

          WithdrawalOrder(),
        ],
      ),
    );
  }
}
