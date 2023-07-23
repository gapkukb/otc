library http;

import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/global/global.dart';
import 'package:otc/models/http_response_model..t.dart';
import 'package:otc/regexp/regexp.dart';
import 'package:otc/router/router.dart';
import 'package:otc/utils/map.dart' as map;

import 'http.datatype.dart';
part './cache.dart';
part './data_type.dart';
part './exception.dart';
part './loading.dart';
part './log.dart';
part './loop.dart';
part './refresh.dart';
part './retry.dart';
part './options.dart';

typedef ModelFactory<T> = T Function(Map<String, dynamic> json);

enum Method {
  get,
  post,
  put,
  delete,
  update,
}

noop() {}

class Http {
  late final Dio dio;

  Http([BaseOptions? options]) {
    dio = Dio(options);
    dio.interceptors
      ..add(LogInterceptor())
      ..add(ExceptionInterceptor())
      ..add(DataTypeInterceptor())
      ..add(LoadingInterceptor());
  }

  _base<T>(String path, [ModelFactory<T>? model, HttpOptions? outerOptions]) {
    return ([Map<String, dynamic>? data, HttpOptions? innerOptions]) {
      final cancelable = innerOptions?.cancelable ?? outerOptions?.cancelable == true;

      CancelToken? cancelToken = cancelable ? CancelToken() : null;

      final options = Options(
        contentType: innerOptions?.contentType ?? outerOptions?.contentType,
        extra: {
          if (outerOptions != null) ...outerOptions.extra,
          if (innerOptions != null) ...innerOptions.extra,
          "_abort": cancelToken == null
              ? noop
              : () {
                  cancelToken?.cancel();
                  cancelToken = null;
                },
          "_options": InnerOptions(
            cancelable: innerOptions?.cancelable ?? outerOptions?.cancelable,
            dataType: innerOptions?.dataType ?? outerOptions?.dataType,
            repeatable: innerOptions?.repeatable ?? outerOptions?.repeatable,
            retry: innerOptions?.retry ?? outerOptions?.retry,
            silent: innerOptions?.silent ?? outerOptions?.silent,
            loading: innerOptions?.loading ?? outerOptions?.loading,
          )
        },
        followRedirects: innerOptions?.followRedirects ?? outerOptions?.followRedirects,
        headers: innerOptions?.headers ?? outerOptions?.headers,
        listFormat: innerOptions?.listFormat ?? outerOptions?.listFormat,
        maxRedirects: innerOptions?.maxRedirects ?? outerOptions?.maxRedirects,
        method: "post" ?? innerOptions?.method ?? outerOptions?.method,
        persistentConnection: innerOptions?.persistentConnection ?? outerOptions?.persistentConnection,
        receiveDataWhenStatusError: innerOptions?.receiveDataWhenStatusError ?? outerOptions?.receiveDataWhenStatusError,
        receiveTimeout: innerOptions?.receiveTimeout ?? outerOptions?.receiveTimeout,
        requestEncoder: innerOptions?.requestEncoder ?? outerOptions?.requestEncoder,
        responseDecoder: innerOptions?.responseDecoder ?? outerOptions?.responseDecoder,
        responseType: innerOptions?.responseType ?? outerOptions?.responseType,
        sendTimeout: innerOptions?.sendTimeout ?? outerOptions?.sendTimeout,
        validateStatus: innerOptions?.validateStatus ?? outerOptions?.validateStatus,
      );

      return dio.request<Map<String, dynamic>>(
        cancelToken: cancelToken,
        path,
        data: data,
        options: options,
        onReceiveProgress: innerOptions?.onReceiveProgress ?? outerOptions?.onReceiveProgress,
        onSendProgress: innerOptions?.onSendProgress ?? outerOptions?.onSendProgress,
      );
    };
  }

  List<T> Function([Map<String, dynamic>? data, HttpOptions? innerOptions]) post<T>(String path, [ModelFactory<T>? model, HttpOptions? outerOptions]) {
    return _base(path, model, outerOptions)().then((value) {
      final data = value.data!["data"];
      return List.castFrom<dynamic, T>(data);
    });
  }

  Request<T> Function<T>(String, [ModelFactory<T>?, HttpOptions?]) createMethod(
    Method method,
  ) {
    return <T>(path, [data, options]) {
      final opt = options ?? HttpOptions();
      opt.path = path;
      opt.method = method.name;
      return Request(options: opt, dio: dio, model: data);
    };
  }

  updateHeader(String key, dynamic value) {
    if (value == null) {
      dio.options.headers.remove(key);
    } else {
      dio.options.headers.update(
        key,
        (_) => value,
        ifAbsent: () => value,
      );
    }
  }
}

class Request<T> {
  final HttpOptions _options;
  final Dio dio;
  final ModelFactory<T>? model;

  const Request({
    required HttpOptions options,
    required this.dio,
    required this.model,
  }) : _options = options;

  Future<T> call([
    Map<String, dynamic>? data,
    HttpOptions? options,
  ]) async {
    final opt = _options.merge(options);
    CancelToken? cancelToken;

    if (opt.cancelable == true) {
      cancelToken = CancelToken();
    }
    Map<String, dynamic> $data = {};
    if (opt.data != null) {
      $data.addAll(opt.data);
    }
    if (data != null) {
      $data.addAll(data);
    }

    final response = await dio.request(
      replacePathParams(
        opt.path,
        opt.pathParams,
      ),
      cancelToken: cancelToken,
      queryParameters: opt.queryParameters,
      data: $data,
      onReceiveProgress: opt.onReceiveProgress,
      onSendProgress: opt.onSendProgress,
      options: Options(
        contentType: opt.contentType,
        extra: {
          ...opt.extra,
          "_abort": () {
            cancelToken?.cancel();
            cancelToken = null;
          },
          "_options": InnerOptions(
            cancelable: opt.cancelable,
            dataType: opt.dataType,
            repeatable: opt.repeatable,
            retry: opt.retry,
            silent: opt.silent,
            loading: opt.loading,
          )
        },
        followRedirects: opt.followRedirects,
        headers: opt.headers,
        listFormat: opt.listFormat,
        maxRedirects: opt.maxRedirects,
        method: _options.method,
        persistentConnection: opt.persistentConnection,
        receiveDataWhenStatusError: opt.receiveDataWhenStatusError,
        receiveTimeout: opt.receiveTimeout,
        requestEncoder: opt.requestEncoder,
        responseDecoder: opt.responseDecoder,
        responseType: opt.responseType,
        sendTimeout: opt.sendTimeout,
        validateStatus: opt.validateStatus,
      ),
    );
    final resp = response.data!['data'];
    return model == null ? resp : model!(resp);
  }
}

extension Typing<T> on List<T> {
  Type get genericType => T;
}
