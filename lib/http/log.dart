part of http;

final log = Logger();

class LogInterceptor extends Interceptor {
  Function close = () {};

  @override
  void onRequest(options, handler) {
    log.i(options);
    super.onRequest(options, handler);
  }

  @override
  void onError(err, handler) {
    log.e(err);
    super.onError(err, handler);
  }

  @override
  void onResponse(response, handler) {
    log.i(response);
    super.onResponse(response, handler);
  }
}
