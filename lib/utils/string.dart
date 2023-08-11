
extension WordBreakUtil on String {
  String get breakWord {
    String breakWord = '';
    runes.forEach((element) {
      breakWord += String.fromCharCode(element);
      breakWord += '\u200B';
    });
    return breakWord;
  }

  String repeat(int? length) {
    return runes.string * (length ?? 0);
  }
}

String maskText(String? text, RegExp expression) {
  if (text == null) return "";
  return text.replaceAllMapped(
    expression,
    (match) {
      return "*".repeat(match.group(1)?.length);
    },
  );
}

final _maskPhoneNumberRegexp = RegExp(r"(?<=\w{3})(\w+)(?=\w{4})");
// 手机号码脱敏
String maskPhoneNumber(String? phoneNumber) {
  return maskText(phoneNumber, _maskPhoneNumberRegexp);
}

final _maskEmailRegexp = RegExp(r"(?<=\w{3})(\w+)(?=\w{1}@\w+)");
// 手机号码脱敏
String maskEmail(String? email) {
  return maskText(email, _maskEmailRegexp);
}
