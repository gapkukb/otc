part of http;

var retryInterceptor = InterceptorsWrapper(
  onRequest: (options, handler) {},
  onResponse: (e, handler) {},
  onError: (e, handler) {},
);
