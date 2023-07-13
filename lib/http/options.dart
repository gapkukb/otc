//ignore_for_file: dead_null_aware_expression

part of http;

noop() {}

class InnerOptions {
  /// 静默模式，http拦截器不抛出任何信息，完全由业务控制
  final bool silent;

  /// 请求超时重试次数，0表示不重试
  final int retry;

  /// 请求是否可取消
  final bool cancelable;

  /// 是否允许重复请求,只保留最近的请求，优先级高于cancelable
  final bool repeatable;

  /// 传递到服务器的数据类型
  final HttpDataType? dataType;

  /// 是否开启loading
  final bool loading;

  const InnerOptions({
    this.silent = false,
    this.retry = 0,
    this.cancelable = true,
    this.repeatable = false,
    this.dataType = HttpDataType.json,
    this.loading = false,
  });
}

class HttpOptions extends RequestOptions implements InnerOptions {
  /// 静默模式，http拦截器不抛出任何信息，完全由业务控制
  @override
  final bool silent;

  /// 请求超时重试次数，0表示不重试
  @override
  final int retry;

  /// 请求是否可取消
  @override
  final bool cancelable;

  /// 是否允许重复请求,只保留最近的请求，优先级高于cancelable
  @override
  final bool repeatable;

  /// 传递到服务器的数据类型
  @override
  final HttpDataType? dataType;

  /// 是否开启loading
  @override
  final bool loading;

  final Map<String, String>? pathParams;

  HttpOptions({
    super.contentType,
    super.extra,
    super.followRedirects,
    super.headers,
    super.listFormat,
    super.maxRedirects,
    super.method,
    super.persistentConnection,
    super.receiveDataWhenStatusError,
    super.receiveTimeout,
    super.requestEncoder,
    super.responseDecoder,
    super.responseType,
    super.sendTimeout,
    super.validateStatus,
    super.baseUrl,
    super.cancelToken,
    super.connectTimeout,
    super.data,
    super.onReceiveProgress,
    super.onSendProgress,
    super.path,
    super.queryParameters,
    super.sourceStackTrace,
    this.silent = false,
    this.retry = 0,
    this.cancelable = true,
    this.repeatable = false,
    this.dataType = HttpDataType.json,
    this.pathParams,
    this.loading = true,
  });

  HttpOptions merge(HttpOptions? options) {
    if (options != null) {
      if (data != null && options.data != null) {
        options.data = {...data as Map, ...options.data};
      } else if (options.data == null) {
        options.data = data;
      }
      if (headers != null && options.headers != null) {
        options.headers = {...headers, ...options.headers};
      } else if (options.headers == null) {
        options.headers = headers;
      }

      return HttpOptions(
        pathParams: map.merge(options.pathParams, pathParams),
        contentType: options.contentType ?? contentType,
        extra: options.extra ?? extra,
        followRedirects: options.followRedirects ?? followRedirects,
        headers: options.headers,
        listFormat: options.listFormat ?? listFormat,
        maxRedirects: options.maxRedirects ?? maxRedirects,
        method: options.method ?? method,
        persistentConnection:
            options.persistentConnection ?? persistentConnection,
        receiveDataWhenStatusError:
            options.receiveDataWhenStatusError ?? receiveDataWhenStatusError,
        receiveTimeout: options.receiveTimeout ?? receiveTimeout,
        requestEncoder: options.requestEncoder ?? requestEncoder,
        responseDecoder: options.responseDecoder ?? responseDecoder,
        responseType: options.responseType ?? responseType,
        sendTimeout: options.sendTimeout ?? sendTimeout,
        validateStatus: options.validateStatus ?? validateStatus,
        baseUrl: options.baseUrl ?? baseUrl,
        cancelToken: options.cancelToken ?? cancelToken,
        connectTimeout: options.connectTimeout ?? connectTimeout,
        data: options.data,
        onReceiveProgress: options.onReceiveProgress ?? onReceiveProgress,
        onSendProgress: options.onSendProgress ?? onSendProgress,
        path: options.path.isEmpty ? path : options.path,
        queryParameters: options.queryParameters ?? queryParameters,
        silent: options.silent ?? silent,
        retry: options.retry ?? retry,
        cancelable: options.cancelable ?? cancelable,
        repeatable: options.repeatable ?? repeatable,
        dataType: options.dataType ?? dataType,
      );
    }
    return this;
  }
}

String replacePathParams(String path, Map<String, String>? mapper) {
  if (mapper == null) return path;
  return path.replaceAllMapped(pathReplacer, (match) {
    final matched = match.group(0)!;
    final subMatched = matched.substring(1, matched.length - 1);

    return mapper[subMatched]?.toString() ?? matched;
  });
}
