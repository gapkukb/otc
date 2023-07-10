// library http;

// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:dio/dio.dart';
// import 'package:otc/components/modal/modal.dart';
// import 'package:otc/models/wallet_all_balance.dart';
// import '../router/router.dart';
// import 'package:go_router/go_router.dart';
// import 'package:logging/logging.dart';
// import 'package:otc/global/global.dart';

// part 'loading.dart';
// part 'retry.dart';
// part 'cache.dart';
// part 'exception.dart';
// part 'log.dart';
// part 'refresh.dart';
// part 'data_type.dart';

// typedef ModelFactory<T> = T Function(Map<String, dynamic> json);

// typedef HttpFunc<T, R> = R Function(
//   T path, {
//   Duration? connectTimeout,
//   Duration? receiveTimeout,
//   Duration? sendTimeout,
//   String? baseUrl,
//   Map<String, dynamic>? queryParameters,
//   Map<String, dynamic>? extra,
//   Map<String, dynamic>? headers,
//   ResponseType? responseType,
//   String? contentType,
//   ValidateStatus? validateStatus,
//   bool? receiveDataWhenStatusError,
//   bool? followRedirects,
//   int? maxRedirects,
//   bool? persistentConnection,
//   RequestEncoder? requestEncoder,
//   ResponseDecoder? responseDecoder,
//   ListFormat? listFormat,
// });

// class Request<T> {
//   Function abort = () {};
//   late Function request;
//   late HttpOptions options;
//   late Dio dio;

//   Future<Response<dynamic>> call(
//     dynamic data, {
//     String? path,
//     Duration? connectTimeout,
//     Duration? receiveTimeout,
//     Duration? sendTimeout,
//     String? baseUrl,
//     Map<String, dynamic>? queryParameters,
//     Map<String, dynamic>? extra,
//     Map<String, dynamic>? headers,
//     ResponseType? responseType,
//     String? contentType,
//     ValidateStatus? validateStatus,
//     bool? receiveDataWhenStatusError,
//     bool? followRedirects,
//     int? maxRedirects,
//     bool? persistentConnection,
//     RequestEncoder? requestEncoder,
//     ResponseDecoder? responseDecoder,
//     ListFormat? listFormat,
//   }) async {
//     options = options.copyWith(
//       path: path,
//       connectTimeout: connectTimeout,
//       receiveTimeout: receiveTimeout,
//       sendTimeout: sendTimeout,
//       baseUrl: baseUrl,
//       queryParameters: queryParameters,
//       extra: extra,
//       headers: headers,
//       responseType: responseType,
//       contentType: contentType,
//       validateStatus: validateStatus,
//       receiveDataWhenStatusError: receiveDataWhenStatusError,
//       followRedirects: followRedirects,
//       maxRedirects: maxRedirects,
//       persistentConnection: persistentConnection,
//       requestEncoder: requestEncoder,
//       responseDecoder: responseDecoder,
//       listFormat: listFormat,
//     );

//     final token = CancelToken();
//     abort = token.cancel;
//     try {
//       return dio.request(
//         options.path!,
//         cancelToken: token,
//         data: data,
//         options: Options(
//           method: options.method,
//           sendTimeout: options.sendTimeout,
//           receiveTimeout: options.receiveTimeout,
//           extra: options.extra,
//           headers: options.headers,
//           responseType: options.responseType,
//           contentType: options.contentType,
//           validateStatus: options.validateStatus,
//           receiveDataWhenStatusError: options.receiveDataWhenStatusError,
//           followRedirects: options.followRedirects,
//           maxRedirects: options.maxRedirects,
//           persistentConnection: options.persistentConnection,
//           requestEncoder: options.requestEncoder,
//           responseDecoder: options.responseDecoder,
//           listFormat: options.listFormat,
//         ),
//       );
//     } catch (e) {
//       return Future.value();
//     }
//   }

//   Request({
//     required this.options,
//     required this.dio,
//   });
// }

// class HttpOptions extends BaseOptions {
//   // 静默模式，http拦截器不抛出任何信息，完全由业务控制
//   final bool silent;
//   // 请求超时重试次数，0表示不重试
//   final int retry;
//   // 请求是否可取消
//   final bool cancelable;
//   // 是否允许重复请求,只保留最近的请求，优先级高于cancelable
//   final bool repeatable;
//   // 传递到服务器的数据类型
//   final DataType dataType;
//   final String? path;

//   HttpOptions({
//     super.baseUrl,
//     super.connectTimeout,
//     super.contentType,
//     super.extra,
//     super.followRedirects,
//     super.headers,
//     super.listFormat,
//     super.maxRedirects,
//     super.method,
//     super.persistentConnection,
//     super.queryParameters,
//     super.receiveDataWhenStatusError,
//     super.receiveTimeout,
//     super.requestEncoder,
//     super.responseDecoder,
//     super.responseType,
//     super.sendTimeout,
//     super.validateStatus,
//     this.silent = false,
//     this.dataType = DataType.json,
//     this.cancelable = false,
//     this.repeatable = false,
//     this.retry = 0,
//     this.path,
//   });

//   @override
//   HttpOptions copyWith({
//     method,
//     baseUrl,
//     queryParameters,
//     path,
//     connectTimeout,
//     receiveTimeout,
//     sendTimeout,
//     extra,
//     headers,
//     responseType,
//     contentType,
//     validateStatus,
//     receiveDataWhenStatusError,
//     followRedirects,
//     maxRedirects,
//     persistentConnection,
//     requestEncoder,
//     responseDecoder,
//     listFormat,
//     silent,
//     dataType,
//     cancelable,
//     repeatable,
//     retry,
//   }) {
//     return HttpOptions(
//       method: method ?? this.method,
//       baseUrl: baseUrl ?? this.baseUrl,
//       queryParameters: queryParameters ?? this.queryParameters,
//       connectTimeout: connectTimeout ?? this.connectTimeout,
//       receiveTimeout: receiveTimeout ?? this.receiveTimeout,
//       sendTimeout: sendTimeout ?? this.sendTimeout,
//       extra: extra ?? Map.from(this.extra),
//       headers: headers ?? Map.from(this.headers),
//       responseType: responseType ?? this.responseType,
//       contentType: contentType ?? this.contentType,
//       validateStatus: validateStatus ?? this.validateStatus,
//       receiveDataWhenStatusError:
//           receiveDataWhenStatusError ?? this.receiveDataWhenStatusError,
//       followRedirects: followRedirects ?? this.followRedirects,
//       maxRedirects: maxRedirects ?? this.maxRedirects,
//       persistentConnection: persistentConnection ?? this.persistentConnection,
//       requestEncoder: requestEncoder ?? this.requestEncoder,
//       responseDecoder: responseDecoder ?? this.responseDecoder,
//       listFormat: listFormat ?? this.listFormat,
//       path: path ?? this.path,
//       silent: silent ?? this.silent,
//       dataType: dataType ?? this.dataType,
//       cancelable: cancelable ?? this.cancelable,
//       repeatable: repeatable ?? this.repeatable,
//       retry: retry ?? this.retry,
//     );
//   }
// }

// class Http {
//   late final Dio dio;

//   Http(BaseOptions options) {
//     dio = Dio(options);
//     dio.interceptors
//       ..add(DataTypeInterceptor())
//       ..add(ExceptionInterceptor());
//     // ..add(LoadingInterceptor());
//   }

//   Request<T> get<T>(String path,
//       [ModelFactory<T>? json, HttpOptions? options]) {
//     return Request<T>(
//       options: options,
//       dio: dio,
//     );
//   }

//   T post<T>(String path, [ModelFactory<T>? json, HttpOptions? options]) {
//     return "s" as T;
//   }

//   HttpFunc<String, Request> createMethod(
//     String method,
//   ) {
//     return (
//       path, {
//       connectTimeout,
//       receiveTimeout,
//       sendTimeout,
//       baseUrl,
//       queryParameters,
//       extra,
//       headers,
//       responseType,
//       contentType,
//       validateStatus,
//       receiveDataWhenStatusError,
//       followRedirects,
//       maxRedirects,
//       persistentConnection,
//       requestEncoder,
//       responseDecoder,
//       listFormat,
//     }) {
//       var data = get("path", WalletAllBalance.fromJson);

//       var options = HttpOptions(
//         path: path,
//         method: method,
//         contentType: contentType,
//         followRedirects: followRedirects,
//         extra: extra,
//         headers: headers,
//         listFormat: listFormat,
//         maxRedirects: maxRedirects,
//         persistentConnection: persistentConnection,
//         receiveDataWhenStatusError: receiveDataWhenStatusError,
//         receiveTimeout: receiveTimeout,
//         requestEncoder: requestEncoder,
//         responseDecoder: responseDecoder,
//         responseType: responseType,
//         sendTimeout: sendTimeout,
//         validateStatus: validateStatus,
//       );

//       return Request(
//         options: options,
//         dio: dio,
//       );
//     };
//   }
// }

library http;

import 'package:dio/dio.dart';
import 'package:otc/http/options.dart';

typedef ModelFactory<T> = T Function(Map<String, dynamic> json);

enum Method {
  get,
  post,
  put,
  delete,
  update,
}

class Http {
  late final Dio dio;

  Http([BaseOptions? options]) {
    dio = Dio(options);
  }

  Request<T> Function(
    String path, [
    ModelFactory<T>? json,
    HttpOptions? options,
  ]) createMethod<T>(Method method) {
    return (path, [json, options]) {
      return Request<T>(
        path: path,
        options: options ?? HttpOptions(),
        dio: dio,
      );
    };
  }
}

_abort() {
  var h = Http();
  var get = h.createMethod(Method.get);
  var user = get("/");
  user().then((value) => null);
}

class Request<T> {
  final HttpOptions _options;
  final Dio dio;

  const Request({
    required HttpOptions options,
    required this.dio,
  }) : _options = options;

  Future<T> call([
    Map<String, dynamic>? data,
    HttpOptions? options,
  ]) {
    final __options = _options.copyWith(
      baseUrl: options?.baseUrl,
      connectTimeout: options?.connectTimeout,
      contentType: options?.contentType,
      data: options?.data,
      extra: options?.extra,
      followRedirects: options?.followRedirects,
      headers: options?.headers,
      listFormat: options?.listFormat,
      maxRedirects: options?.maxRedirects,
      method: options?.method,
      onReceiveProgress: options?.onReceiveProgress,
      onSendProgress: options?.onSendProgress,
      path: options?.path,
      persistentConnection: options?.persistentConnection,
      queryParameters: options?.queryParameters,
      receiveDataWhenStatusError: options?.receiveDataWhenStatusError,
      receiveTimeout: options?.receiveTimeout,
      requestEncoder: options?.requestEncoder,
      responseDecoder: options?.responseDecoder,
      responseType: options?.responseType,
      sendTimeout: options?.sendTimeout,
      setRequestContentTypeWhenNoPayload:
          options?.setRequestContentTypeWhenNoPayload,
      validateStatus: options?.validateStatus,
    );

    return dio
        .request(
          __options.path,
          queryParameters: __options.queryParameters,
          data: __options.data,
          onReceiveProgress: __options.onReceiveProgress,
          onSendProgress: __options.onSendProgress,
          options: Options(
            contentType: __options.contentType,
            extra: {
              ...__options.extra,
              "_options": InnerOptions(
                cancelable: __options.cancelable,
                dataType: __options.dataType,
                repeatable: __options.repeatable,
                retry: __options.retry,
                silent: __options.silent,
              )
            },
            followRedirects: __options.followRedirects,
            headers: __options.headers,
            listFormat: __options.listFormat,
            maxRedirects: __options.maxRedirects,
            method: __options.method,
            persistentConnection: __options.persistentConnection,
            receiveDataWhenStatusError: __options.receiveDataWhenStatusError,
            receiveTimeout: __options.receiveTimeout,
            requestEncoder: __options.requestEncoder,
            responseDecoder: __options.responseDecoder,
            responseType: __options.responseType,
            sendTimeout: __options.sendTimeout,
            validateStatus: __options.validateStatus,
          ),
        )
        .then((response) => response.data as T);
  }
}
