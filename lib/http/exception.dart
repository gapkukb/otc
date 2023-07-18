part of http;

// 客户端自定义的错误码
class ClientErrorCode {
  static const weakNetwork = 90000;
  static const unknown = 90001;
  static const cancel = 90002;
  static const connectionTimeout = 90003;
  static const sendTimeout = 90004;
  static const receiveTimeout = 90005;
  static const badResponse = 90006;
}

class ExceptionInterceptor extends InterceptorsWrapper {
  @override
  onResponse(response, handler) {
    if (response.data['success']) {
      super.onResponse(response, handler);

      global.logger.i(response);
    } else {
      final err = DioException(
        requestOptions: response.requestOptions,
        error: BizException(response.data['code'], response.data['message']),
        message: null,
        response: response,
        // ignore: invalid_use_of_internal_member
        stackTrace: StackTrace.current,
        type: DioExceptionType.badResponse,
      );

      throw err;
    }
  }

  @override
  onError(err, handler) async {
    if (err.error is! BizException) {
      // 这里处理http错误
      HttpException exception = HttpException.create(err);

      // dio默认错误，进一步判断是否无网络状态
      if (err.type == DioExceptionType.unknown) {
        if (await Connectivity().checkConnectivity() ==
            ConnectivityResult.none) {
          exception =
              HttpException(ClientErrorCode.weakNetwork, "网络开小差了,请检查网络");
        }
      }
      err = err.copyWith(error: exception);
    }

    final String? msg = (err.error as _Exception).message;

    if (msg != null && msg.isNotEmpty) {
      Modal.showText(text: msg);
    }

    super.onError(err, handler);
  }
}

abstract class _Exception implements Exception {
  final int code;
  final String? message;

  _Exception([
    this.code = ClientErrorCode.unknown,
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
        return HttpException(ClientErrorCode.cancel, "请求取消");
      case DioExceptionType.connectionTimeout:
        return HttpException(
            ClientErrorCode.connectionTimeout, "您的网络信号弱，连接服务器超时");
      case DioExceptionType.sendTimeout:
        return HttpException(ClientErrorCode.sendTimeout, "请求服务器超时");
      case DioExceptionType.receiveTimeout:
        return HttpException(ClientErrorCode.receiveTimeout, "服务器响应超时");
      case DioExceptionType.badResponse:
        {
          try {
            int statusCode = e.response?.statusCode ?? 0;
            switch (statusCode) {
              case 400:
                return HttpException(statusCode, "请求语法出错");
              case 401:
                GoRouter.of(navigatorKey.currentContext!).replace('/login');
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
            return HttpException(ClientErrorCode.unknown, '未知错误');
          }
        }
      default:
        return HttpException(
          ClientErrorCode.unknown,
          e.message ?? e.error.toString(),
        );
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
