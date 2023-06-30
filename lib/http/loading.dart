part of http;

class LoadingInterceptor extends Interceptor {
  Function close = () {};

  @override
  void onRequest(options, handler) {
    close = Modal.showLoading();
    super.onRequest(options, handler);
  }

  @override
  void onError(err, handler) {
    close();
    super.onError(err, handler);
  }

  @override
  void onResponse(response, handler) {
    close();
    super.onResponse(response, handler);
  }
}
