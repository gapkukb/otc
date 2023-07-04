part of http;

String? token;

class Refresh extends InterceptorsWrapper {
  final Dio dio;
  Refresh({required this.dio});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (token == null) {}
    super.onRequest(options, handler);
  }
}
