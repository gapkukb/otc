import 'package:flutter/material.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.addition.bank.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.addition.wechat_and_alipay.dart';

enum AddType {
  bank,
  alipay,
  wechat,
}

class WalletAddressAddition extends StatelessWidget {
  final AddType addType;
  final _formKey = GlobalKey<FormState>();

  WalletAddressAddition({
    super.key,
    required this.addType,
  });

  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      legend: "新增收款方式",
      title: _buildTitle(),
      icon: Icons.credit_card,
      onCompelete: () {
        _formKey.currentState!.validate();
      },
      children: [
        _buildForm(),
        const SizedBox(height: 16),
        const Text(
          "温馨提示：当您出售数字货币时，您选择的收款方式将向买方展示，请确认信息填写准确无误。",
          style: TextStyle(
            fontSize: 12,
            color: Color(0xff7c7c7c),
          ),
        ),
      ],
    );
  }

  _buildTitle() {
    if (addType == AddType.bank) return "添加银行卡";
    if (addType == AddType.alipay) return "添加支付宝";
    return "添加微信";
  }

  _buildForm() {
    if (addType == AddType.bank) {
      return BankAdditionAddressWallet();
    }

    if (addType == AddType.alipay) {
      return WalletAddressWechatAndAlipayAddition(
        addType: AddType.alipay,
      );
    }

    return WalletAddressWechatAndAlipayAddition(
      addType: AddType.wechat,
    );
  }
}
