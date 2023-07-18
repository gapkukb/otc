import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/components/upload/upload.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.hepler.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_file_picker.dart';
import 'package:otc/widgets/ui_text_form_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WalletMethodQRcodeAddition extends StatefulWidget {
  final AddType addType;

  const WalletMethodQRcodeAddition({
    super.key,
    required this.addType,
  });

  @override
  State<WalletMethodQRcodeAddition> createState() =>
      _WalletMethodQRcodeAdditionState();
}

class _WalletMethodQRcodeAdditionState
    extends State<WalletMethodQRcodeAddition> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formState = {};

  String get addTypeText {
    return widget.addType.chinese;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ModalPageTemplate(
        legend: "新增收款方式",
        title: "添加$addTypeText",
        iconData: widget.addType == AddType.alipay
            ? FontAwesomeIcons.alipay
            : FontAwesomeIcons.weixin,
        onCompelete: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            apis.wallet.addQRcode({"paymentMethod": addTypeText});
          }
        },
        children: [
          UiTextFormField(
            formState: _formState,
            name: "name",
            maxLength: 10,
            decoration: const InputDecoration(
              label: Text("姓名"),
            ),
            validator: (value) {
              return value!.trim().isNotEmpty ? null : "姓名不能为空";
            },
          ),
          const SizedBox(height: 16),
          UiTextFormField(
            name: "account",
            maxLength: 10,
            decoration: InputDecoration(
              label: Text("$addTypeText账号"),
            ),
            validator: (value) {
              return value!.trim().isNotEmpty ? null : "$addTypeText账号不能为空";
            },
          ),
          const SizedBox(height: 16),
          const Text("收款二维码（选填）"),
          // const SizedBox(height: 16),
          Upload(),
          const SizedBox(height: 16),
          const Text(
            "温馨提示：当您出售数字货币时，您选择的收款方式将向买方展示，请确认信息填写准确无误。",
            style: Font.miniGrey,
          )
        ],
      ),
    );
  }
}

// SizedBox(
//                 width: 100,
//                 child: UiFilePicker(
//                   onPicked: (file) {},
//                 ),
//               );
