import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/amount_input/amount_input.dart';
import 'package:otc/components/currency_selector/currency_selector.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/providers/lowest_limit.provider.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/providers/wallet.provider.dart';
import 'package:otc/utils/navigator.dart';
import 'package:otc/utils/predication.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class WalletTransfer extends ConsumerStatefulWidget {
  final Cryptocurrency coin;
  const WalletTransfer({
    super.key,
    this.coin = Cryptocurrency.USDT,
  });

  @override
  ConsumerState<WalletTransfer> createState() => _WalletTransferState();
}

class _WalletTransferState extends ConsumerState<WalletTransfer> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final Map<String, dynamic> formState = {};

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final balance = ref.watch(balanceProvider);
    final lowestLimit = ref.watch(lowestLimitProvider);
    return Form(
      key: _formKey,
      child: ModalPageTemplate(
        legend: "钱包",
        title: "平台转账",
        iconData: Icons.credit_card_outlined,
        filledButton: true,
        onCompelete: apply,
        okButtonText: "提币",
        children: [
          CurrencySelector(
            name: "currency",
            formState: formState,
            initialValue: widget.coin.name,
          ),
          const Gap.small(),
          UiTextFormField(
            labelText: "用户ID",
            formState: formState,
            name: "username",
            validator: (value) {
              return value!.isEmpty ? "请填写好友ID" : null;
            },
          ),
          const Gap.small(),
          AmountInput(
            controller: amountController,
            amountInputType: AmountInputType.transfer,
            labelText: "转账数量",
            coin: Cryptocurrency.USDT,
            name: "amount",
            formState: formState,
            maxAmount: min(balance.valid, lowestLimit.maxTransferDaily.toDouble()),
            minAmount: lowestLimit.minWithdraw.toDouble(),
          ),
          const Gap.small(),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text("${balance.valid} USDT 可用"),
          ),
        ],
        // TransferOrder(),
      ),
    );
  }

  apply(BuildContext context) async {
    if (!await predication(
      context: context,
      types: [
        Predication.kyc1,
        Predication.funds,
      ],
    )) {
      return;
    }

    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    final result = await openCaptchaWindow(CaptchaWindowOptions(session: CaptchaSession.funds));

    if (result == null) return;

    await apis.wallet.transfer({
      ...formState,
      "payPass": result['payPassword'],
    });

    context.pop();
    provider.read(walletProvider.notifier).updateWallet();
    Modal.alert(content: "划转成功");
  }
}
