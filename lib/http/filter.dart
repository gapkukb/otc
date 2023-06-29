part of http;

var filterInterceptor = InterceptorsWrapper(
  onRequest: (options, handler) {},
  onResponse: (e, handler) {},
  onError: (e, handler) {},
);
