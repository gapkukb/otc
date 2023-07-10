import 'package:dio/dio.dart';
import 'package:otc/enums/http.datatype.dart';

class InnerOptions {
  /// 静默模式，http拦截器不抛出任何信息，完全由业务控制
  final bool? silent;

  /// 请求超时重试次数，0表示不重试
  final int? retry;

  /// 请求是否可取消
  final bool? cancelable;

  /// 是否允许重复请求,只保留最近的请求，优先级高于cancelable
  final bool? repeatable;

  /// 传递到服务器的数据类型
  final HttpDataType? dataType;

  const InnerOptions({
    this.silent = false,
    this.retry = 0,
    this.cancelable = true,
    this.repeatable = false,
    this.dataType = HttpDataType.json,
  });
}

class HttpOptions extends RequestOptions implements InnerOptions {
  /// 静默模式，http拦截器不抛出任何信息，完全由业务控制
  @override
  final bool? silent;

  /// 请求超时重试次数，0表示不重试
  @override
  final int? retry;

  /// 请求是否可取消
  @override
  final bool? cancelable;

  /// 是否允许重复请求,只保留最近的请求，优先级高于cancelable
  @override
  final bool? repeatable;

  /// 传递到服务器的数据类型
  @override
  final HttpDataType? dataType;

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
    super.setRequestContentTypeWhenNoPayload,
    super.sourceStackTrace,
    this.silent = false,
    this.retry = 0,
    this.cancelable = true,
    this.repeatable = false,
    this.dataType = HttpDataType.json,
  });

  HttpOptions merge(HttpOptions? before, after) {
    if (before != null && after != null) {
      return HttpOptions();
    }
    if (before != null && after == null) {
      return before;
    }
    if (before == null && after != null) {
      return after;
    }
    return HttpOptions();
  }
}
