part of http;

final log = Logger();

class LogInterceptor extends Interceptor {
  Function close = () {};

  @override
  void onRequest(options, handler) {
    try {
      // log.d(jsonEncode(options));
    } catch (e) {
      log.d(options);
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(err, handler) {
    inspect(err);

    super.onError(err, handler);
  }

  @override
  void onResponse(response, handler) {
    log.i(response.data);
    super.onResponse(response, handler);
  }
}
