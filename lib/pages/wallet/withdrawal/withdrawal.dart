import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/address_selector/address_selector.dart';
import 'package:otc/components/amount_input/amount_input.dart';
import 'package:otc/components/blockchain_selector/blockchain_selector.dart';
import 'package:otc/components/cell/cell.dart';
import 'package:otc/components/currency_selector/currency_selector.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/components/wallet_address.input/wallet_address.input.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/global/global.dart';
import 'package:otc/models/kyc/kyc.model.dart';
import 'package:otc/pages/wallet/withdrawal/withdrawal.book.dart';
import 'package:otc/pages/wallet/withdrawal/withdrawal.order.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';

class Withdrawal extends StatefulWidget {
  const Withdrawal({super.key});

  @override
  State<Withdrawal> createState() => _WithdrawalState();
}

class _WithdrawalState extends State<Withdrawal> with SingleTickerProviderStateMixin {
  late final TabController controller;
  String amount = "";
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
    return ModalPageTemplate(
      legend: "钱包",
      title: "数字货币提币",
      iconData: Icons.wallet,
      filledButton: true,
      okButtonText: "提币",
      onCompelete: (context) {},
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
              onPressed: () {},
              label: "地址管理",
            )
          ],
        ),
        const Divider(thickness: 1, height: 1),
        const Gap.medium(),
        if (controller.index == 0)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              WalletAddressInput(
                name: "currency",
                formState: formState,
              ),
              const Gap.medium(),
              BlockchainSelector(
                name: "currency",
                formState: formState,
              ),
            ],
          )
        else
          WithdrawalBook(),
        const Gap.medium(),
        AmountInput(
          coin: Cryptocurrency.USDT,
          labelText: "提币数量",
          hintText: "0.00USDT可用",
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
            "到账数量：$amount USDT",
            style: Font.x2largeBold,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "1.00 USDT网络费用",
            style: Font.miniGrey,
          ),
        ),

        // WithdrawalOrder(),
      ],
    );
  }
}
