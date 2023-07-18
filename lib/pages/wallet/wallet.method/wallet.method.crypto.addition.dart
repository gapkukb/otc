import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/enums/blockchain.dart';
import 'package:otc/enums/currency.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class CryptoAddtion {
  String name;
  String protocol;
  num deadline;
  CryptoAddtion({
    required this.name,
    required this.protocol,
    required this.deadline,
  });

  factory CryptoAddtion.fromJson(Map<String, dynamic> json) {
    return CryptoAddtion(
      name: json["name"],
      protocol: json["protocol"],
      deadline: json["deadline"],
    );
  }
}

class ModelMethodCryptoAddtion extends StatefulWidget {
  static List<Map<String, dynamic>> items = [
    {
      "name": "Ethereum (ERC20)",
      "protocol": "Ethereum (ETH)",
      "deadline": 5,
    },
    {
      "name": "BNB Smart Chain (BEP20)",
      "protocol": "Binance Smart Chain",
      "deadline": 1,
    },
    {
      "name": "Tron (TRC20)",
      "protocol": "Tron (TRX)",
      "deadline": 1,
    },
  ];

  const ModelMethodCryptoAddtion({super.key});

  @override
  State<ModelMethodCryptoAddtion> createState() =>
      _ModelMethodCryptoAddtionState();
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
        onCompelete: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            inspect(formState);
            await apis.wallet.addAddress(formState);
          }
        },
        children: [
          UiTextFormField(
            name: "remark",
            formState: formState,
            labelText: "地址备注",
            validator: (value) {
              return value!.length < 4 && value.length > 20
                  ? "请输入4~20个字符的备注"
                  : null;
            },
          ),
          const SizedBox(height: 16),
          Dropdown(
            name: "currency",
            formState: formState,
            labelText: "币种选择",
            showSearchBox: false,
            data: Cryptocurrency.values
                .map((e) => DropdownItem(title: e.name))
                .toList(),
            validator: (value) {
              return value == null ? "请选择币种" : null;
            },
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
              } else if (_blockchain == BlockChain.TRON.name) {
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
            data: BlockChain.values
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
