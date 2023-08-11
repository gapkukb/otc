import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/modal/modal.dart';
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
            final urls = await controller.upload();
            _formState.addAll({
              "content": urls[0],
              "paymentMethod": widget.addType.type,
            });

            await apis.wallet.addQRcode(_formState);
            context.pop(true);
            Modal.showText(text: "添加成功");
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
            name: "title",
            formState: _formState,
            maxLength: 20,
            labelText: "备注",
            validator: (value) {
              return value!.trim().isNotEmpty ? null : "姓名不能为空";
            },
          ),
          Upload(
            titles: const ["收款二维码"],
            controller: controller,
            itemSize: 150,
            max: 1,
            validator: (files) {
              return files.isEmpty ? "请上传二维码" : null;
            },
          ),
          const SizedBox(height: 16),
          const Text(
            "温馨提示：上传的二维码是账号二维码，非收款二维码。\n微信和支付宝交易最好先加好友再进行交易。",
            style: Font.miniGrey,
          )
        ],
      ),
    );
  }
}
