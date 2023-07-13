library apis;

import 'package:dio/dio.dart';
import 'package:otc/global/global.dart';
import '../http/http.dart';
import '../models/user/user.model.dart';
import '../enums/http.datatype.dart';
part 'app.api.dart';
part 'user.api.dart';
part 'security.api.dart';
part 'wallet.api.dart';

const duration = Duration(seconds: 30);

final http = Http(BaseOptions(
  receiveTimeout: duration,
  sendTimeout: duration,
  connectTimeout: duration,
  // 开发环境
  // baseUrl: "http://otc.737.com/api",
  // ath 本地环境
  baseUrl: "http://10.92.21.1:8082",

  headers: {
    global.keys.authorization: global.authorization,
    "Referer": "APP",
  },
));

final get = http.createMethod(Method.get);
final post = http.createMethod(Method.post);

class _Apis {
  final user = userApi;
  final security = securityApi;
  final wallet = walletApi;
}

var apis = _Apis();
