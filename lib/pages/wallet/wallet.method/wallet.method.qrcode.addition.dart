import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/components/upload/upload.dart';
import 'package:otc/pages/wallet/wallet.method/bank.provider.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.hepler.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_text_form_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WalletMethodQRcodeAddition extends StatefulWidget {
  final AddType addType;

  const WalletMethodQRcodeAddition({
    super.key,
    required this.addType,
  });

  @override
  State<WalletMethodQRcodeAddition> createState() => _WalletMethodQRcodeAdditionState();
}

class _WalletMethodQRcodeAdditionState extends State<WalletMethodQRcodeAddition> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formState = {};
  final controller = UploadController();

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
        iconData: widget.addType == AddType.alipay ? FontAwesomeIcons.alipay : FontAwesomeIcons.weixin,
        onCompelete: (_) async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            final formData = FormData.fromMap({
              "file": (_formState['qrcode'] as List<File>).map((file) {
                return MultipartFile.fromFileSync(file.path);
              }).toList(),
            });

            final urls = (await apis.app.uploadImage(formData)).cast<String>();
            _formState.remove("qrcode");
            _formState.addAll({
              "content": urls[0],
              "paymentMethod": widget.addType.type,
            });

            await apis.wallet.addQRcode(_formState);

            provider.refresh(qrcodeProvider(widget.addType));
          }
        },
        children: [
          UiTextFormField(
            formState: _formState,
            name: "name",
            maxLength: 10,
            labelText: "姓名",
            validator: (value) {
              return value!.trim().isNotEmpty ? null : "姓名不能为空";
            },
          ),
          const Gap.small(),
          UiTextFormField(
            name: "account",
            formState: _formState,
            maxLength: 10,
            labelText: "$addTypeText账号",
            validator: (value) {
              return value!.trim().isNotEmpty ? null : "$addTypeText账号不能为空";
            },
          ),
          const Gap.small(),
          UiTextFormField(
            formState: _formState,
            name: "title",
            maxLength: 20,
            labelText: "备注",
            validator: (value) {
              return value!.trim().isNotEmpty ? null : "姓名不能为空";
            },
          ),
          Upload(
            name: "qrcode",
            titles: const ["收款二维码（选填）"],
            controller: controller,
            itemSize: 150,
            max: 1,
            formStore: _formState,
            validator: (files) {
              return files.isEmpty ? "请上传二维码" : null;
            },
          ),
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
