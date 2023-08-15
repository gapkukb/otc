import 'dart:math';

import 'package:intl/intl.dart';

final _formatter = NumberFormat("0.00", "en_US");

extension Formatter on num {
  String decimalize([bool? floor]) {
    if (floor == true) {
      return ((this * 100).floor() / 100).toString();
    }
    return _formatter.format(this);
  }

  num toFixed([int decimal = 2, bool? floor]) {
    final scale = pow(10, decimal);
    return (this * scale).truncate() / scale;
  }
}

extension StringNumberFormatter on String {
  String decimalize() {
    num n = 0;
    try {
      n = double.parse(this);
    } finally {}
    return _formatter.format(n);
  }
}
