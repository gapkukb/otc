part of http;

int loadingCounter = 0;

class LoadingInterceptor extends Interceptor {
  Function close = () {};

  @override
  void onRequest(options, handler) {
    if ((options.extra['_options'] as InnerOptions).loading) {
      if (loadingCounter++ == 0) {
        close = Modal.showLoading();
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(err, handler) {
    if (loadingCounter-- == 0) {
      close();
    }

    super.onError(err, handler);
  }

  @override
  void onResponse(response, handler) {
    if (loadingCounter-- == 0) {
      close();
    }
    super.onResponse(response, handler);
  }
}
