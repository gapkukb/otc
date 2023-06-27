import 'package:dio/dio.dart';

class Extra {
  // 静默模式，http拦截器不抛出任何信息，完全由业务控制
  bool silent = false;

  // 请求超时重试次数，0表示不重试
  int retry = 0;

  // 请求是否可取消
  bool cancelable = true;

  // 是否允许重复请求,只保留最近的请求，优先级高于cancelable

  bool repeatable = false;
}

// class Options {
//   static final BaseOptions _defaultOptions = BaseOptions(
//       baseUrl: '/',
//       sendTimeout: const Duration(seconds: 30),
//       connectTimeout: const Duration(seconds: 30),
//       receiveTimeout: const Duration(seconds: 30),
//       contentType: Headers.jsonContentType,
//       responseType: ResponseType.json,
//       validateStatus: (status) => status == HttpStatus.ok,
//       extra: {});

//   static late final BaseOptions _baseOptions;

//   // static final Http _internal =
//   Options(BaseOptions? baseOptions) {}

//   extend(BaseOptions? baseOptions) {}
// }

class HttpOptions extends BaseOptions {
  // 静默模式，http拦截器不抛出任何信息，完全由业务控制
  bool silent = false;

  // 请求超时重试次数，0表示不重试
  int retry = 0;

  // 请求是否可取消
  bool cancelable = true;

  // 是否允许重复请求,只保留最近的请求，优先级高于cancelable

  bool repeatable = false;
}
