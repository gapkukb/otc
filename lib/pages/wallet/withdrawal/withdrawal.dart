import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/amount_input/amount_input.dart';
import 'package:otc/components/blockchain_selector/blockchain_selector.dart';
import 'package:otc/components/currency_selector/currency_selector.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/components/wallet_address.input/wallet_address.input.dart';
import 'package:otc/constants/blockchain.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/pages/wallet/withdrawal/withdrawal.book.dart';
import 'package:otc/pages/wallet/withdrawal/withdrawal.order.dart';
import 'package:otc/providers/lowest_limit.provider.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/providers/wallet.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/navigator.dart';
import 'package:otc/widgets/ui_button.dart';

class Withdrawal extends ConsumerStatefulWidget {
  const Withdrawal({super.key});

  @override
  ConsumerState<Withdrawal> createState() => _WithdrawalState();
}

class _WithdrawalState extends ConsumerState<Withdrawal> with SingleTickerProviderStateMixin {
  late final TabController controller;
  String amount = "";
  final Map<String, dynamic> formState = {};
  final formKey = GlobalKey<FormState>();
  Protocal? protocal;
  final amountController = TextEditingController();

  num fee = 0;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lowestLimit = ref.watch(lowestLimitProvider);
    final balance = ref.watch(balanceProvider);
    return Form(
      key: formKey,
      child: ModalPageTemplate(
        legend: "钱包",
        title: "数字货币提币",
        iconData: Icons.wallet,
        filledButton: true,
        okButtonText: "提币",
        onCompelete: (context) async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();

            final next = await showDialog(
              context: context,
              builder: (context) {
                return WithdrawalOrder(
                  formState: {
                    ...formState,
                    "fee": fee,
                  },
                );
              },
            );
            if (next == null) return;
            final data = await openCaptchaWindow(CaptchaWindowOptions(
              legend: "安全验证",
              context: context,
              session: CaptchaSession.funds,
            ));
            if (data == null) return;

            formState.addAll({
              "payPassword": data['payPassword'],
            });

            if (controller.index == 0) {
              await apis.wallet.withdrawWithoutBook(formState);
            } else {
              await apis.wallet.withdrawWithBook(formState);
            }
            context.pop();
            Modal.alert(content: "提币申请成功");
            provider.read(userProvider.notifier).updateUser();
          }
        },
        children: [
          CurrencySelector(
            name: "currency",
            formState: formState,
            initialValue: Cryptocurrency.USDT.name,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabBar(
                controller: controller,
                isScrollable: true,
                physics: const NeverScrollableScrollPhysics(),
                dividerColor: Colors.transparent,
                onTap: (value) {
                  setState(() {});
                },
                tabs: const [
                  Tab(text: "使用新地址"),
                  Tab(text: "提币地址簿"),
                ],
              ),
              UiButton.text(
                onPressed: () {
                  context
                    ..pop()
                    ..push(
                      Routes.walletMethod,
                      extra: 1,
                    );
                },
                label: "地址管理",
              )
            ],
          ),
          const Divider(height: 1),
          const Gap.medium(),
          if (controller.index == 0)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlockchainSelector(
                  name: "blockchain",
                  formState: formState,
                  onChanged: (selectedItem) {
                    setState(() {
                      fee = lowestLimit.gas[selectedItem!.value] ?? 0;
                    });
                  },
                  validator: (value) {
                    protocal = value?.extra;
                    return value == null ? "请选择转账网络" : null;
                  },
                ),
                const Gap.medium(),
                WalletAddressInput(
                  name: "wallet",
                  formState: formState,
                  protocal: protocal,
                ),
              ],
            )
          else
            WithdrawalBook(
              formState: formState,
              name: "book",
              onChange: (address, coin) {
                setState(() {
                  fee = lowestLimit.gas[coin] ?? 0;
                  formState.addAll({
                    "wallet": address,
                    "blockchain": coin,
                  });
                });
              },
            ),
          const Gap.medium(),
          AmountInput(
            controller: amountController,
            coin: Cryptocurrency.USDT,
            labelText: "提币数量 可用余额:${balance.valid}",
            // hintText: "${} USDT可用",
            formState: formState,
            name: "amount",
            maxAmount: min(balance.valid, lowestLimit.maxWithdrawDaily.toDouble()),
            minAmount: lowestLimit.minWithdraw.toDouble(),
            onChanged: (value) {
              setState(() {
                amount = value;
              });
            },
          ),
          const Gap.medium(),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "到账数量：${(amount == "" ? 0 : double.parse(amount) - fee)} USDT",
              style: Font.x2largeBold,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "$fee USDT网络费用",
              style: Font.miniGrey,
            ),
          ),
        ],
      ),
    );
  }
}
