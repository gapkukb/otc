import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/pages/wallet/wallet.method/bank.provider.dart';
import 'package:otc/providers/bank.provider.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_chip.dart';
import 'package:otc/widgets/ui_text_form_field.dart';
import 'dart:math' as math;

class WalletMethodBankAddition extends StatefulWidget {
  const WalletMethodBankAddition({super.key});

  @override
  State<WalletMethodBankAddition> createState() => _WalletMethodBankAdditionState();
}

class _WalletMethodBankAdditionState extends State<WalletMethodBankAddition> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formState = {};

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ModalPageTemplate(
        iconData: Icons.credit_card_outlined,
        legend: "新增收款方式",
        title: "添加银行卡",
        onCompelete: (_) async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            await apis.wallet.addBankCard({
              "account": _formState['cardNumber'],
              ..._formState,
            });
            context.pop(true);
            Modal.showText(text: "添加成功");
            provider.refresh(bankProvider);
          }
        },
        children: [
          UiTextFormField(
            formState: _formState,
            name: "name",
            decoration: const InputDecoration(label: Text("姓名"), hintText: "请输入银行卡户主姓名"),
            validator: (value) {
              return value!.trim().isNotEmpty ? null : "姓名不能为空";
            },
          ),
          const SizedBox(height: 16),
          Consumer(
            builder: (context, ref, child) {
              final future = ref.watch(banksProvider);
              return Dropdown(
                formState: _formState,
                name: "bank",
                labelText: "开户银行",
                searchHintText: "请输入银行名称或银行代码",
                asyncItems: (text) async {
                  final Completer<List<DropdownItem>> completer = Completer();
                  future.whenData((value) => {
                        completer.complete(value.map((val) {
                          return DropdownItem(title: val['name']!, value: val['code'], trailing: val['code']);
                        }).toList())
                      });
                  return await completer.future;
                },
                validator: (value) {
                  return value == null ? "请选择开户行" : null;
                },
              );
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
              return value!.length >= 16 && value.length <= 19 ? null : "银行卡号输入有误";
            },
          ),
          const SizedBox(height: 16),
          UiTextFormField(
            name: "bankBranch",
            formState: _formState,
            decoration: const InputDecoration(
              label: Text("开户支行"),
            ),
            validator: (value) {
              return value!.isNotEmpty ? null : "请填写开户支行";
            },
          ),
          const SizedBox(height: 16),
          UiTextFormField(
            name: "title",
            formState: _formState,
            decoration: const InputDecoration(
              label: Text("备注"),
              hintText: "添加备注方便您更容易甄别银行卡信息",
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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                UiChip(
                  icon: Icons.error,
                  text: "特别提示",
                  iconSize: 20,
                ),
                SizedBox(height: 8),
                Text(
                  "请确保添加您的银行卡号以进行即时付款。请勿包含其他银行或付款方式的详细信息。您必须添加所选银行的付款/收款信息。",
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
