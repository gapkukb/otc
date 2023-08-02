part of http;

int loadingCounter = 0;

class LoadingInterceptor extends Interceptor {
  Function close = () {};

  @override
  void onRequest(options, handler) {
    final opt = (options.extra['_options'] as InnerOptions);
    if (opt.loading != false && loadingCounter++ == 0) {
      close = Modal.showLoading();
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(err, handler) {
    off(err);
    super.onError(err, handler);
  }

  @override
  void onResponse(response, handler) {
    off(response);
    super.onResponse(response, handler);
  }

  off(dynamic result) {
    final opt = (result.requestOptions.extra['_options'] as InnerOptions);
    if (opt.loading != false && --loadingCounter == 0) {
      close();
    }
  }
}
