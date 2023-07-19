import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/blockchain_selector/blockchain_selector.dart';
import 'package:otc/components/currency_selector/currency_selector.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/wallet_address.input/wallet_address.input.dart';
import 'package:otc/global/global.dart';
import 'package:otc/models/kyc/kyc.model.dart';
import 'package:otc/pages/wallet/transfer/transfer.counter.dart';
import 'package:otc/pages/wallet/transfer/transfer.order.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class Transfer extends StatefulWidget {
  const Transfer({super.key});

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  final Map<String, dynamic> formState = {};

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    //用户未完成身份认证，进入该页面，会出现弹框提示。
    if (global.user.kyc?.lv1Status != KycStatus.pass) {
      Modal.confirm(
        content: "您必须完成初级身份认证或以上才可以使用提币功能",
        okButtonText: "去认证",
        onOk: () {
          navigatorKey.currentContext!.go("/");
        },
        onDecline: () {
          Navigator.of(context).maybePop();
        },
      );
    }
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
          UiTextFormField(
            labelText: "转账数量",
            formState: formState,
            decoration: InputDecoration(
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UiButton.text(
                    minWidth: 50,
                    size: UiButtonSize.small,
                    onPressed: () {},
                    label: "全部",
                  ),
                  Text("USDT"),
                  const Gap.small(horizition: true),
                ],
              ),

              // suffixText: "USDT",
            ),
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
