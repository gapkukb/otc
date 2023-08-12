import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_text_form_field.dart';
import 'package:otc/utils/formatter.dart';

class AmountInput extends UiTextFormField {
  final Cryptocurrency coin;
  final double? maxAmount;
  final double? minAmount;
  final String? hintText;

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
                return "最大提币额度：$maxAmount USDT";
              }

              if (minAmount != null && val < minAmount) {
                return "最小提币额度：$minAmount USDT";
              }
              return null;
            });
}
