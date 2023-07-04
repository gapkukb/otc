part of http;

enum DataType {
  json,
  form,
  lencode,
  file,
}

class DataTypeInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(options, handler) {
    if (options.extra['dataType'] == DataType.form) {
      options.data = FormData.fromMap(options.data);
    }
    super.onRequest(options, handler);
  }
}
