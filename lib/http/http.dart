import 'dart:async';
import 'package:dio/dio.dart';

int num = 0;

enum DataType {
  json,
  form,
  lencode,
  file,
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

class BindAbort<T> {
  Function abort = () {};
  late Function request;
  late HttpOptions options;
  late Dio dio;

  Future<Response<dynamic>> call(
    dynamic data, {
    String? path,
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
  }) async {
    options = options.copyWith(
      path: path,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      baseUrl: baseUrl,
      queryParameters: queryParameters,
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

    final token = CancelToken();
    abort = token.cancel;

    return dio.request(
      options.path!,
      cancelToken: token,
      data: data,
      options: Options(
        method: options.method,
        sendTimeout: options.sendTimeout,
        receiveTimeout: options.receiveTimeout,
        extra: options.extra,
        headers: options.headers,
        responseType: options.responseType,
        contentType: options.contentType,
        validateStatus: options.validateStatus,
        receiveDataWhenStatusError: options.receiveDataWhenStatusError,
        followRedirects: options.followRedirects,
        maxRedirects: options.maxRedirects,
        persistentConnection: options.persistentConnection,
        requestEncoder: options.requestEncoder,
        responseDecoder: options.responseDecoder,
        listFormat: options.listFormat,
      ),
    );
  }

  BindAbort({
    required this.options,
    required this.dio,
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
  final String? path;

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
    this.path,
  });

  @override
  HttpOptions copyWith({
    method,
    baseUrl,
    queryParameters,
    path,
    connectTimeout,
    receiveTimeout,
    sendTimeout,
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
    return HttpOptions(
      method: method ?? this.method,
      baseUrl: baseUrl ?? this.baseUrl,
      queryParameters: queryParameters ?? this.queryParameters,
      connectTimeout: connectTimeout ?? this.connectTimeout,
      receiveTimeout: receiveTimeout ?? this.receiveTimeout,
      sendTimeout: sendTimeout ?? this.sendTimeout,
      extra: extra ?? Map.from(this.extra),
      headers: headers ?? Map.from(this.headers),
      responseType: responseType ?? this.responseType,
      contentType: contentType ?? this.contentType,
      validateStatus: validateStatus ?? this.validateStatus,
      receiveDataWhenStatusError:
          receiveDataWhenStatusError ?? this.receiveDataWhenStatusError,
      followRedirects: followRedirects ?? this.followRedirects,
      maxRedirects: maxRedirects ?? this.maxRedirects,
      persistentConnection: persistentConnection ?? this.persistentConnection,
      requestEncoder: requestEncoder ?? this.requestEncoder,
      responseDecoder: responseDecoder ?? this.responseDecoder,
      listFormat: listFormat ?? this.listFormat,
      path: path ?? this.path,
    );
  }
}

final _defaultOptions = HttpOptions(
  baseUrl: '/',
  sendTimeout: const Duration(seconds: 30),
  connectTimeout: const Duration(seconds: 30),
  receiveTimeout: const Duration(seconds: 30),
);

class Http {
  static late final Dio dio;

  Http(HttpOptions options) {
    dio = Dio(options);
  }

  HttpFunc<String, BindAbort> newMethod(
    String method,
  ) {
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
      final token = CancelToken();

      var options = HttpOptions(
        path: path,
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

      return BindAbort(
        options: options,
        dio: dio,
      );
    };
  }
}
