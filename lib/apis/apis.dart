library apis;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:otc/constants/base_url.dart';
import 'package:otc/global/global.dart';
import 'package:otc/models/ad.my/ad.my.model.dart';
import 'package:otc/models/user_base/user_base.model.dart';
import 'package:otc/models/wallet.transfer.history/wallet.transfer.history.model.dart';
import 'package:otc/pages/merchant/income/model.dart';
import 'package:otc/pages/merchant/invitation/model.dart';
import 'package:otc/pages/merchant/setting/model.dart';
import 'package:otc/pages/user/invitation/model.dart';
import '../http/http.dart';
import '../models/user/user.model.dart';
import '../models/otc/otc.model.dart';
import '../models/ad.all/ad.all.model.dart';
import '../models/wallet.blockchain.history/wallet.blockchain.history.model.dart';
import '../models/pagination/pagination.model.dart';
import '../http/http.datatype.dart';
part 'app.api.dart';
part 'user.api.dart';
part 'security.api.dart';
part 'wallet.api.dart';
part 'agent.api.dart';
part 'kyc.api.dart';
part 'otc.api.dart';

const duration = Duration(seconds: 15);

final http = Http(BaseOptions(
  receiveTimeout: duration,
  sendTimeout: duration,
  connectTimeout: duration,
  baseUrl: baseUrl,
  headers: {
    global.keys.authorization: global.authorization,
    if (!kIsWeb) "Referer": "APP",
  },
));

final get = http.createMethod(Method.get);
final post = http.createMethod(Method.post);

class _Apis {
  final app = appApi;
  final user = userApi;
  final security = securityApi;
  final wallet = walletApi;
  final merchant = agentApi;
  final kyc = kycApi;
  final otc = otcApi;
}

var apis = _Apis();
