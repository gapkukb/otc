part of http;

var cacheInterceptor = InterceptorsWrapper(
  onRequest: (options, handler) {},
  onResponse: (e, handler) {},
  onError: (e, handler) {},
);
