library apis;

import 'package:dio/dio.dart';
import 'package:otc/constants/base_url.dart';
import 'package:otc/global/global.dart';
import 'package:otc/models/agent_setting/agent_setting.dart';
import 'package:otc/models/user_base/user_base.model.dart';
import '../http/http.dart';
import '../models/user/user.model.dart';
import '../models/otc/otc.model.dart';
import '../http/http.datatype.dart';
part 'app.api.dart';
part 'user.api.dart';
part 'security.api.dart';
part 'wallet.api.dart';
part 'agent.api.dart';

const duration = Duration(seconds: 30);

final http = Http(BaseOptions(
  receiveTimeout: duration,
  sendTimeout: duration,
  connectTimeout: duration,
  baseUrl: baseUrl,
  headers: {
    global.keys.authorization: global.authorization,
    "Referer": "APP",
  },
));

final get = http.createMethod(Method.get);
final post = http.createMethod(Method.post);

class _Apis {
  final app = appApi;
  final user = userApi;
  final security = securityApi;
  final wallet = walletApi;
  final agent = agentApi;
}

var apis = _Apis();
