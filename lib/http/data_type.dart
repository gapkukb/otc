part of http;

class DataTypeInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(options, handler) {
    if ((options.extra['_options'] as InnerOptions).dataType ==
        HttpDataType.form) {
      options.data = FormData.fromMap(options.data);
    }
    super.onRequest(options, handler);
  }
}
