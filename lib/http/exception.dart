part of http;

class ExceptionInterceptor extends Interceptor {
  @override
  void onResponse(response, handler) {
    print('----------ExceptionInterceptor onResponse-----------');
    inspect(response);
    // 这里处理业务错误
    // 解析格式 {int code,String msg,bool success}
    if (response.data['success']) {
      super.onResponse(response, handler);
    } else {
      var e = DioException(
        requestOptions: response.requestOptions,
        error: BizException(response.data['code'], response.data['msg']),
        message: null,
        response: response,
        // ignore: invalid_use_of_internal_member
        stackTrace:
            response.requestOptions.sourceStackTrace ?? StackTrace.current,
        type: DioExceptionType.badResponse,
      );

      super.onError(e, ErrorInterceptorHandler());
    }
  }

  @override
  void onError(err, handler) async {
    print('----------ExceptionInterceptor onError-----------');
    // 这里处理http错误
    HttpException exception = HttpException.create(err);

    // dio默认错误，进一步判断是否无网络状态
    if (err.type == DioExceptionType.unknown) {
      if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
        exception = HttpException(-100, "网络开小差了,请检查网络");
      }
    }
    super.onError(err.copyWith(error: exception), handler);

    Modal.showText(text: exception.msg);
  }
}

class HttpException implements Exception {
  final int code;
  final String msg;

  HttpException([
    this.code = -1,
    this.msg = 'unknow error',
  ]);

  @override
  String toString() {
    return "Http error [$code]:$msg";
  }

  factory HttpException.create(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return HttpException(-1, "服务器连接超时");
      case DioExceptionType.sendTimeout:
        return HttpException(-1, "发送请求超时");
      case DioExceptionType.receiveTimeout:
        return HttpException(-1, "服务器响应超时");
      case DioExceptionType.badResponse:
        {
          try {
            int statusCode = e.response?.statusCode ?? 0;
            switch (statusCode) {
              case 400:
                return HttpException(statusCode, "请求语法出错");
              case 401:
                return HttpException(statusCode, "请登录账户");
              case 403:
                return HttpException(statusCode, "权限不足，服务器拒绝执行");
              case 404:
                return HttpException(statusCode, "访问的资源不存在");
              case 405:
                return HttpException(statusCode, "不支持的请求方式");
              case 500:
                return HttpException(statusCode, "服务器内部错误");
              case 502:
                return HttpException(statusCode, "无效请求");
              case 503:
                return HttpException(statusCode, "系统正在维护，请稍后再试");
              default:
                return HttpException(
                    statusCode, e.response?.statusMessage ?? '未知错误');
            }
          } on Exception catch (_) {
            return HttpException(-1, '未知错误');
          }
        }
      default:
        return HttpException(-1, e.message ?? "未知错误");
    }
  }
}

class BizException implements Exception {
  final int code;
  final String msg;

  BizException([
    this.code = -1,
    this.msg = 'unknow error',
  ]);

  @override
  String toString() {
    return "Http error [$code]:$msg";
  }

  factory BizException.create(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return BizException(-1, "服务器连接超时");
      case DioExceptionType.sendTimeout:
        return BizException(-1, "发送请求超时");
      case DioExceptionType.receiveTimeout:
        return BizException(-1, "服务器响应超时");
      default:
        return BizException(-1, e.message!);
    }
  }
}
