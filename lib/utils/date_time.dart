import 'package:intl/intl.dart';

final dateFormatter = DateFormat("yyyy-MM-dd");

extension ForMatter on DateTime {
  String format() {
    return dateFormatter.format(this);
  }
}
