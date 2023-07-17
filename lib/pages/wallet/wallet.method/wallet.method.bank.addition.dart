import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/constants/banks.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_chip.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class WalletMethodBankAddition extends StatefulWidget {
  const WalletMethodBankAddition({super.key});

  @override
  State<WalletMethodBankAddition> createState() =>
      _WalletMethodBankAdditionState();
}

var _currencies = [
  "Food",
  "Transport",
  "Personal",
  "Shopping",
  "Medical",
  "Rent",
  "Movie",
  "Salary"
];

class _WalletMethodBankAdditionState extends State<WalletMethodBankAddition> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formState = {};

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ModalPageTemplate(
        icon: Icons.credit_card_outlined,
        legend: "新增收款方式",
        title: "添加银行卡",
        onCompelete: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            await apis.wallet.addBankCard({
              "account": _formState['cardNumber'],
              ..._formState,
            });
            context.pop(true);
          }
        },
        children: [
          UiTextFormField(
            formState: _formState,
            name: "name",
            decoration: const InputDecoration(
                label: Text("姓名"), hintText: "请输入银行卡户主姓名"),
            validator: (value) {
              return value!.trim().isNotEmpty ? null : "姓名不能为空";
            },
          ),
          const SizedBox(height: 16),
          UiTextFormField(
            name: "cardNumber",
            formState: _formState,
            maxLength: 30,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text("银行卡号"),
              hintText: "请输入银行账号/卡号",
            ),
            validator: (value) {
              return value!.trim().isNotEmpty ? null : "银行卡号不能为空";
            },
          ),
          const SizedBox(height: 16),
          Dropdown(
            formState: _formState,
            name: "bank",
            labelText: "开户银行",
            searchHintText: "请输入银行名称或银行代码",
            selectedItem: null,
            data: Banks.values
                .map(
                  (e) => DropdownItem(
                    title: e.chinese,
                    trailing: e.name,
                    value: e.name,
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
          UiTextFormField(
            name: "title",
            formState: _formState,
            decoration: const InputDecoration(
              label: Text("备注"),
              hintText: "添加备注方便您更容易甄别银行卡信息",
            ),
            validator: (value) {
              return value!.trim().isNotEmpty ? null : "银行卡号不能为空";
            },
          ),
          const SizedBox(height: 16),
          UiTextFormField(
            name: "bankBranch",
            formState: _formState,
            decoration: const InputDecoration(
              label: Text("开户支行（选填）"),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xfff5f5f5),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                UiChip(
                  icon: Icons.error,
                  text: "特别提示",
                  iconSize: 20,
                ),
                const SizedBox(height: 8),
                const Text(
                  "秘钥可用于找回谷歌验证器，请勿透露给他人并妥善备份保存",
                  style: Font.miniGrey,
                )
              ],
            ),
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
