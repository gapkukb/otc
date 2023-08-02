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
import 'package:otc/global/global.dart';
import 'package:otc/models/kyc/kyc.model.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/providers/wallet.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/utils/navigator.dart';
import 'package:otc/utils/number.dart';
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
  late final TextEditingController controller;
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> formState = {};

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wallet = ref.watch(walletProvider);
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
            labelText: "转账数量",
            coin: Cryptocurrency.USDT,
            name: "amount",
            formState: formState,
            controller: controller,
            maxAmount: wallet.balance.usdt.toDouble(),
          ),
          const Gap.small(),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text("${wallet.balance.usdt.decimalize()} USDT 可用"),
          ),
        ],
        // TransferOrder(),
      ),
    );
  }

  apply(BuildContext context) async {
    if (global.user.kyc?.lv1Status != KycStatus.pass) {
      Modal.confirm(
        okButtonText: "去认证",
        title: "交易资格",
        content: "您必须完成至少KYC1级别的身份认证才能使用此功能。",
        onOk: () {
          context.goNamed(Routes.authPrimary);
        },
      );
      return;
    }
    if (!global.user.base.hasPaymentPassword) {
      Modal.alert(
        title: "提币提醒",
        content: "您尚未设置资金密码",
        okButtonText: "去设置",
        onOk: () {
          context
            ..pop()
            ..push(Routes.updateFundsPwd);
        },
      );
      return;
    }
    if (!await predication(
      context: context,
      types: [
        Predication.funds,
        Predication.kyc1,
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
      "payPass": result['funds'],
    });

    context.pop();
    provider.read(walletProvider.notifier).updateWallet();
    Modal.alert(content: "划转成功");
  }
}
