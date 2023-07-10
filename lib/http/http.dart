library http;

import 'package:dio/dio.dart';
import 'package:otc/http/options.dart';
import 'package:otc/models/user_model.dart';

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

  Request<T> Function<T>(String, [ModelFactory<T>?, HttpOptions?]) request2(
    Method method,
  ) {
    return <T>(path, [data, options]) {
      final opt = options ?? HttpOptions();
      opt.path = path;
      opt.method = method.name;
      return Request(
        options: opt,
        dio: dio,
      );
    };
  }
}

_abort() {
  var h = Http();
  var post = h.request2(Method.post);
  var test = post("/", UserModel.fromJson);
  test().then((value) => null);
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
    final opt = _options.merge(options);
    CancelToken? cancelToken;

    if (opt.cancelable) {
      cancelToken = CancelToken();
    }

    return dio
        .request(
          replacePathParams(
            opt.path,
            opt.pathParams,
          ),
          cancelToken: cancelToken,
          queryParameters: opt.queryParameters,
          data: opt.data,
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
              )
            },
            followRedirects: opt.followRedirects,
            headers: opt.headers,
            listFormat: opt.listFormat,
            maxRedirects: opt.maxRedirects,
            method: opt.method,
            persistentConnection: opt.persistentConnection,
            receiveDataWhenStatusError: opt.receiveDataWhenStatusError,
            receiveTimeout: opt.receiveTimeout,
            requestEncoder: opt.requestEncoder,
            responseDecoder: opt.responseDecoder,
            responseType: opt.responseType,
            sendTimeout: opt.sendTimeout,
            validateStatus: opt.validateStatus,
          ),
        )
        .then((response) => response.data as T);
  }
}
