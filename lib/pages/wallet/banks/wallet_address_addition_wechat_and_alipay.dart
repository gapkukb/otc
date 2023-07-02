import 'package:flutter/material.dart';
import 'package:otc/pages/wallet/banks/wallet_address_addition.dart';
import 'package:otc/widgets/ui_file_picker.dart';

class WalletAddressAdditionWechatAndAlipay extends StatelessWidget {
  final AddType addType;
  final _formKey = GlobalKey<FormState>();

  WalletAddressAdditionWechatAndAlipay({
    super.key,
    required this.addType,
  });

  String get addTypeText {
    if (addType == AddType.alipay) return "支付宝";
    return "微信";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            maxLength: 10,
            decoration: const InputDecoration(
              label: Text("姓名"),
            ),
            validator: (value) {
              return value!.trim().isNotEmpty ? null : "姓名不能为空";
            },
          ),
          TextFormField(
            maxLength: 10,
            decoration: InputDecoration(
              label: Text("$addTypeText账号"),
            ),
            validator: (value) {
              return value!.trim().isNotEmpty ? null : "$addTypeText账号不能为空";
            },
          ),
          const Text("收款二维码（选填）"),
          const SizedBox(height: 8),
          FormField(
            builder: (field) {
              return const SizedBox(
                width: 100,
                child: UiFilePicker(),
              );
            },
            validator: (value) {},
          )
        ],
      ),
    );
  }
}
