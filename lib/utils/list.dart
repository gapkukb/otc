extension Extend<E> on List<E> {
  List<E> slice([int begin = 0, int? end]) {
    if (begin < 0) {
      begin = length + begin;
    }
    if (end == null) {
      end = length;
    } else if (end < 0) {
      end = length + end;
    }
    if (begin < 0 || end < 0) {
      throw RangeError('Index out of range');
    }
    if (begin >= length || end > length) {
      throw RangeError('Index out of range');
    }
    return sublist(begin, end);
  }
}
