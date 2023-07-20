// 只允许输入一个小数点的数字

import 'package:flutter/services.dart';

final List<TextInputFormatter> decimalTextInputFormatter = [
  FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
  TextInputFormatter.withFunction((oldValue, newValue) {
    final text = newValue.text;
    return text.isEmpty
        ? newValue
        : double.tryParse(text) == null
            ? oldValue
            : newValue;
  }),
];
