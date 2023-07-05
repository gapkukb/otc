part of http;

// 客户端自定义的错误码
class BizErrorCode {
  static const weakNetwork = 90000;
  static const unknown = 90001;
  static const cancel = 90002;
  static const connectionTimeout = 90003;
  static const sendTimeout = 90004;
  static const receiveTimeout = 90005;
  static const badResponse = 90006;
}

class ExceptionInterceptor extends Interceptor {
  @override
  void onResponse(response, handler) {
    if (response.data['success']) {
      // handler.next(response);

      return super.onResponse(response, handler);
    } else {
      var e = DioException(
        requestOptions: response.requestOptions,
        error: BizException(response.data['code'], response.data['message']),
        message: null,
        response: response,
        // ignore: invalid_use_of_internal_member
        // stackTrace: StackTrace.current,
        type: DioExceptionType.badResponse,
      );

      return handler.reject(e);
    }
  }

  @override
  void onError(err, handler) async {
    if (err.error is! BizException) {
      // 这里处理http错误
      HttpException exception = HttpException.create(err);

      // dio默认错误，进一步判断是否无网络状态
      if (err.type == DioExceptionType.unknown) {
        final result = await Connectivity().checkConnectivity();

        if (result == ConnectivityResult.none) {
          exception = HttpException(BizErrorCode.weakNetwork, "网络开小差了,请检查网络");
        }
      }
      err = err.copyWith(error: exception);
    }

    final String? msg = (err.error as _Exception).message;

    if (msg != null && msg.isNotEmpty) {
      Modal.showText(text: msg);
    }

    global.logger.e(err);

    return super.onError(err, handler);
  }
}

abstract class _Exception implements Exception {
  final int code;
  final String? message;

  _Exception([
    this.code = BizErrorCode.unknown,
    this.message = 'unknow error',
  ]);

  @override
  String toString() {
    return "Http error [$code]:$message";
  }
}

class HttpException extends _Exception {
  HttpException([
    super.code,
    super.message,
  ]);

  factory HttpException.create(DioException e) {
    switch (e.type) {
      case DioExceptionType.cancel:
        return HttpException(BizErrorCode.cancel, "请求取消");
      case DioExceptionType.connectionTimeout:
        return HttpException(BizErrorCode.connectionTimeout, "您的网络信号弱，连接服务器超时");
      case DioExceptionType.sendTimeout:
        return HttpException(BizErrorCode.sendTimeout, "请求服务器超时");
      case DioExceptionType.receiveTimeout:
        return HttpException(BizErrorCode.receiveTimeout, "服务器响应超时");
      case DioExceptionType.badResponse:
        {
          try {
            int statusCode = e.response?.statusCode ?? 0;
            switch (statusCode) {
              case 400:
                return HttpException(statusCode, "请求语法出错");
              case 401:
                GoRouter.of(navigatorKey.currentContext!).push('/register');
                return HttpException(statusCode, "请先登录账户");
              case 403:
                return HttpException(statusCode, "您的权限不足，服务器拒绝执行");
              case 404:
                return HttpException(statusCode, "访问的资源不存在");
              case 405:
                return HttpException(statusCode, "不支持的请求方法");
              case 500:
                return HttpException(statusCode, "服务器内部错误");
              case 502:
                return HttpException(statusCode, "无效请求");
              case 503:
                return HttpException(statusCode, "服务器正在维护，请稍后再试");
              default:
                return HttpException(
                  statusCode,
                  e.response?.statusMessage ?? '网络错误-$statusCode',
                );
            }
          } on Exception catch (_) {
            return HttpException(BizErrorCode.unknown, '未知错误');
          }
        }
      default:
        return HttpException(BizErrorCode.unknown, e.message ?? "未知错误");
    }
  }
}

class BizException extends _Exception {
  BizException([
    super.code,
    super.message,
  ]);

  factory BizException.create(DioException e) {
    return BizException(e.response?.data['code'], e.message!);
    // switch (e.type) {
    //   case DioExceptionType.connectionTimeout:
    //     return BizException(bizErrorCode, "服务器连接超时");
    //   case DioExceptionType.sendTimeout:
    //     return BizException(bizErrorCode, "发送请求超时");
    //   case DioExceptionType.receiveTimeout:
    //     return BizException(bizErrorCode, "服务器响应超时");
    //   default:
    //     return BizException(e.response?.data['code'], e.message!);
    // }
  }
}
