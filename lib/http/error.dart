part of http;

var errorInterceptor = InterceptorsWrapper(
  onRequest: (options, handler) {},
  onResponse: (e, handler) {},
  onError: (e, handler) {
    // e.response.statusCode == 401;
    GoRouter.of(navigatorKey.currentContext!).push('/');
  },
);
