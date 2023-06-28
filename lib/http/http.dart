import 'dart:developer';

import 'package:dio/dio.dart';

enum DataType {
  json,
  form,
  lencode,
  file,
}

class MethodFunction<T> {
  late Function abort;
  late Function request;

  Future<T> call([
    Map<dynamic, dynamic>? data,
    T? model,
  ]) {
    return request() as dynamic;
  }

  MethodFunction({
    required this.abort,
    required this.request,
  });
}

class HttpOptions extends BaseOptions {
  // 静默模式，http拦截器不抛出任何信息，完全由业务控制
  final bool silent;
  // 请求超时重试次数，0表示不重试
  final int retry;
  // 请求是否可取消
  final bool cancelable;
  // 是否允许重复请求,只保留最近的请求，优先级高于cancelable
  final bool repeatable;
  // 传递到服务器的数据类型
  final DataType dataType;

  HttpOptions({
    super.baseUrl,
    super.connectTimeout,
    super.contentType,
    super.extra,
    super.followRedirects,
    super.headers,
    super.listFormat,
    super.maxRedirects,
    super.method,
    super.persistentConnection,
    super.queryParameters,
    super.receiveDataWhenStatusError,
    super.receiveTimeout,
    super.requestEncoder,
    super.responseDecoder,
    super.responseType,
    super.sendTimeout,
    super.validateStatus,
    this.silent = false,
    this.dataType = DataType.json,
    this.cancelable = false,
    this.repeatable = false,
    this.retry = 0,
  });
}

typedef HttpFunc<T, R> = R Function(
  T path, {
  Duration? connectTimeout,
  Duration? receiveTimeout,
  Duration? sendTimeout,
  String? baseUrl,
  Map<String, dynamic>? queryParameters,
  Map<String, dynamic>? extra,
  Map<String, dynamic>? headers,
  ResponseType? responseType,
  String? contentType,
  ValidateStatus? validateStatus,
  bool? receiveDataWhenStatusError,
  bool? followRedirects,
  int? maxRedirects,
  bool? persistentConnection,
  RequestEncoder? requestEncoder,
  ResponseDecoder? responseDecoder,
  ListFormat? listFormat,
});

final _defaultOptions = HttpOptions(
  baseUrl: '/',
  sendTimeout: const Duration(seconds: 30),
  connectTimeout: const Duration(seconds: 30),
  receiveTimeout: const Duration(seconds: 30),
);

class Http {
  late final Dio dio;

  Http(HttpOptions options) {
    dio = Dio(options);
  }

  HttpFunc<String, HttpFunc<dynamic, MethodFunction>> newMethod(String method) {
    return (
      path, {
      connectTimeout,
      receiveTimeout,
      sendTimeout,
      baseUrl,
      queryParameters,
      extra,
      headers,
      responseType,
      contentType,
      validateStatus,
      receiveDataWhenStatusError,
      followRedirects,
      maxRedirects,
      persistentConnection,
      requestEncoder,
      responseDecoder,
      listFormat,
    }) {
      Options options = Options(
        method: method,
        contentType: contentType,
        followRedirects: followRedirects,
        extra: extra,
        headers: headers,
        listFormat: listFormat,
        maxRedirects: maxRedirects,
        persistentConnection: persistentConnection,
        receiveDataWhenStatusError: receiveDataWhenStatusError,
        receiveTimeout: receiveTimeout,
        requestEncoder: requestEncoder,
        responseDecoder: responseDecoder,
        responseType: responseType,
        sendTimeout: sendTimeout,
        validateStatus: validateStatus,
      );

      return (
        data, {
        connectTimeout,
        receiveTimeout,
        sendTimeout,
        baseUrl,
        queryParameters,
        extra,
        headers,
        responseType,
        contentType,
        validateStatus,
        receiveDataWhenStatusError,
        followRedirects,
        maxRedirects,
        persistentConnection,
        requestEncoder,
        responseDecoder,
        listFormat,
      }) {
        final token = CancelToken();
        options = options.copyWith(
          receiveTimeout: receiveTimeout,
          sendTimeout: sendTimeout,
          extra: extra,
          headers: headers,
          responseType: responseType,
          contentType: contentType,
          validateStatus: validateStatus,
          receiveDataWhenStatusError: receiveDataWhenStatusError,
          followRedirects: followRedirects,
          maxRedirects: maxRedirects,
          persistentConnection: persistentConnection,
          requestEncoder: requestEncoder,
          responseDecoder: responseDecoder,
          listFormat: listFormat,
        );
        return MethodFunction(
          request: () {
            dio.get(
              path,
            );
            return dio.request(
              path,
              cancelToken: token,
              data: data,
              options: options,
            );
          },
          abort: () {
            token.cancel("requstion was aborted!");
          },
        );
      };
    };
  }
}

void main() {
  var http = Http(HttpOptions(
    baseUrl: "https://segmentfault.com",
    headers: {
      'X-RapidAPI-Key': 'SIGN-UP-FOR-KEY',
      'X-RapidAPI-Host': 'imdb8.p.rapidapi.com',
    },
  ));
  var get = http.newMethod("get");

  var fetch = get("/a/1190000020416153");

  fetch({"q": 'game of thr'})().then((value) {});
}
