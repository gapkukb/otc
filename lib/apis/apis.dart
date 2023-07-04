library apis;

import 'package:otc/globals/globals.dart';

import '../http/http.dart';
part './app_api.dart';
part './user_api.dart';

const duration = Duration(seconds: 30);

final http = Http(HttpOptions(
  receiveTimeout: duration,
  sendTimeout: duration,
  connectTimeout: duration,
  // 开发环境
  // baseUrl: "http://otc.737.com/api",
  // ath 本地环境
  baseUrl: "http://10.92.21.1:8082",

  headers: {
    globals.keys.authorization: globals.prefs.getString(globals.keys.token),
  },
));

final get = http.newMethod("get");
final post = http.newMethod("post");

class _Apis {
  final user = userApi;
}

var apis = _Apis();
