import 'package:intl/intl.dart';

final _formatter = NumberFormat("0.00", "en_US");

extension Formatter on num {
  String decimalize() {
    return _formatter.format(this);
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
