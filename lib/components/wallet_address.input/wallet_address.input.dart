import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otc/constants/blockchain.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class WalletAddressInput extends UiTextFormField {
  final Protocal? protocal;
  WalletAddressInput({
    super.key,
    super.name,
    super.formState,
    this.protocal,
  }) : super(
          labelText: "输入提币地址",
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9]+")),
          ],
          validator: (value) {
            bool valid = true;
            if (value == null) {
              valid = false;
            } else if (value.length != 34 && value.length != 42) {
              valid = false;
            } else if (protocal == Protocal.BEP20 || protocal == Protocal.ERC20) {
              if (value.length != 42 || value.startsWith("0x")) {
                valid = false;
              }
            } else if (protocal == Protocal.TRC20) {
              if (value.length != 34 || value.startsWith("T")) {
                valid = false;
              }
            }
            return valid ? null : "地址格式错误";
          },
        );
}
