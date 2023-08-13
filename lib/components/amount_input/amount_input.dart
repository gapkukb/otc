import 'package:flutter/material.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_text_form_field.dart';
import 'package:otc/utils/formatter.dart';

enum AmountInputType {
  transfer("转账"),
  widthraw("提币"),
  ;

  const AmountInputType(this.text);

  final String text;
}

class AmountInput extends UiTextFormField {
  final Cryptocurrency coin;
  final double? maxAmount;
  final double? minAmount;
  final String? hintText;
  final AmountInputType amountInputType;

  AmountInput({
    super.key,
    super.name,
    super.formState,
    super.labelText,
    super.controller,
    required this.coin,
    this.maxAmount,
    this.minAmount,
    this.hintText,
    super.onChanged,
    this.amountInputType = AmountInputType.widthraw,
  }) : super(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: decimalTextInputFormatter,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UiButton.text(
                    minWidth: 50,
                    size: UiButtonSize.small,
                    onPressed: () {
                      if (controller != null && maxAmount != null) {
                        controller.text = maxAmount.toString();
                        controller.selection = TextSelection.fromPosition(
                          TextPosition(offset: controller.text.length),
                        );
                        onChanged?.call(controller.text);
                      }
                    },
                    label: "全部",
                  ),
                  Text(coin.name),
                  const Gap.small(horizition: true),
                ],
              ),
            ),
            validator: (value) {
              final val = double.tryParse(value!);
              if (val == null) {
                return "您的输入格式不正确";
              }

              if (maxAmount != null && val > maxAmount) {
                return "最大${amountInputType.text}额度：$maxAmount USDT";
              }

              if (minAmount != null && val < minAmount) {
                return "最小${amountInputType.text}额度：$minAmount USDT";
              }
              return null;
            });
}
