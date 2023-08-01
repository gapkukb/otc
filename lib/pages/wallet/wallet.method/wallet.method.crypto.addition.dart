import 'package:flutter/material.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/currency_selector/currency_selector.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/constants/blockchain.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class ModelMethodCryptoAddtion extends StatefulWidget {
  const ModelMethodCryptoAddtion({super.key});

  @override
  State<ModelMethodCryptoAddtion> createState() => _ModelMethodCryptoAddtionState();
}

class _ModelMethodCryptoAddtionState extends State<ModelMethodCryptoAddtion> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formState = {};

  String? _blockchain;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ModalPageTemplate(
        iconData: Icons.credit_card_outlined,
        legend: "提币地址管理",
        title: "添加钱包地址",
        filledButton: true,
        onCompelete: (context) async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            await apis.wallet.addAddress(formState);
            context.pop(true);
            Modal.showText(text: "新增地址成功");
          }
        },
        children: [
          UiTextFormField(
            name: "remark",
            formState: formState,
            labelText: "地址备注",
            validator: (value) {
              return value!.length < 4 || value.length > 20 ? "请输入4~20个字符的备注" : null;
            },
          ),
          const SizedBox(height: 16),
          CurrencySelector(
            name: "currency",
            formState: formState,
          ),
          const SizedBox(height: 16),
          UiTextFormField(
            name: "wallet",
            formState: formState,
            labelText: "提币地址",
            validator: (value) {
              bool isValid = true;
              if (_blockchain == null) {
                isValid = value!.length == 42 || value.length == 34;
              } else if (_blockchain == Blockchain.TRON.name) {
                isValid = value!.startsWith("T") && value.length == 34;
              } else {
                isValid = value!.startsWith("0x") && value.length == 42;
              }
              return isValid ? null : "地址格式错误";
            },
          ),
          const SizedBox(height: 16),
          Dropdown(
            name: "blockchain",
            formState: formState,
            labelText: "转账网络",
            showSearchBox: false,
            data: Blockchain.values
                .map(
                  (item) => DropdownItem(
                    title: item.title,
                    subtitle: item.subTitle,
                    subtitleStyle: Font.miniGrey,
                    value: item.name,
                    trailingWidget: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "≈ ${item.duration} 分钟",
                          style: Font.medium,
                        ),
                        const Text(
                          "平均到达时间",
                          style: Font.miniGrey,
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
            validator: (value) {
              if (value != null) {
                _blockchain = value.value ?? value.title;
              }
              return value == null ? "请选择币种" : null;
            },
            title: const ListTile(
              isThreeLine: true,
              title: Text(
                "选择网络",
                style: Font.largeBold,
              ),
              subtitle: Text(
                "确保您选择的充币网络与您在提币平台使用的网络一致，否则资产可能会丢失。",
                style: Font.miniBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
