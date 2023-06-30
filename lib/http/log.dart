part of http;

final log = Logger('Api')..level = Level.ALL;

class LogInterceptor extends Interceptor {
  Function close = () {};

  @override
  void onRequest(options, handler) {
    log.info(options);
    super.onRequest(options, handler);
  }

  @override
  void onError(err, handler) {
    log.severe(err);
    super.onError(err, handler);
  }

  @override
  void onResponse(response, handler) {
    log.info(response);
    super.onResponse(response, handler);
  }
}
