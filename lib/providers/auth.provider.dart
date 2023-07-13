import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/global/global.dart';

final authProvider = StateProvider<bool>((ref) {
  return global.authorization != null;
});
