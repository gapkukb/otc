extension WordBreakUtil on String {
  String get breakWord {
    String breakWord = '';
    runes.forEach((element) {
      breakWord += String.fromCharCode(element);
      breakWord += '\u200B';
    });
    return breakWord;
  }
}
