class HttpResponseModel<T> {
  String? whether;
  int? code;
  String? message;
  T data;
  bool? success;

  HttpResponseModel({
    this.whether,
    this.code,
    this.message,
    required this.data,
    this.success,
  });

  factory HttpResponseModel.fromJson(Map<String, dynamic> json) {
    return HttpResponseModel(
      whether: json['whether'] as String?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] as T,
      success: json['success'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'whether': whether,
        'code': code,
        'message': message,
        'data': data,
        'success': success,
      };
}
