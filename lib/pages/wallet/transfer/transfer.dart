import 'package:flutter/material.dart';
import 'package:otc/components/amount_input/amount_input.dart';
import 'package:otc/components/currency_selector/currency_selector.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/pages/wallet/transfer/transfer.counter.dart';
import 'package:otc/pages/wallet/transfer/transfer.order.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class WalletTransfer extends StatefulWidget {
  const WalletTransfer({super.key});

  @override
  State<WalletTransfer> createState() => _WalletTransferState();
}

class _WalletTransferState extends State<WalletTransfer>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  final Map<String, dynamic> formState = {};

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    //用户未完成身份认证，进入该页面，会出现弹框提示。
    // if (global.user.kyc?.lv1Status != KycStatus.pass) {
    //   Modal.confirm(
    //     clickClose: false,
    //     content: "您必须完成初级身份认证或以上才可以使用提币功能",
    //     okButtonText: "去认证",
    //     onOk: () {
    //       navigatorKey.currentContext!.go("/");
    //     },
    //     onDecline: () {
    //       Navigator.of(context).maybePop();
    //     },
    //   );
    // }
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
        title: const Text('平台转账'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 36),
          CurrencySelector(
            name: "currency",
            formState: formState,
          ),
          const Gap.medium(),
          UiTextFormField(
            labelText: "好友ID",
            formState: formState,
          ),
          AmountInput(
            coin: Coins.USDT,
            controller: TextEditingController(),
          ),
          TransferCounter(
            onSubmit: () {},
          ),
          TransferOrder(),
        ],
      ),
    );
  }
}
