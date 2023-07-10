class HttpResponseModel {
  String? whether;
  int? code;
  String? message;
  dynamic data;
  bool? success;

  HttpResponseModel({
    this.whether,
    this.code,
    this.message,
    this.data,
    this.success,
  });

  factory HttpResponseModel.fromJson(Map<String, dynamic> json) {
    return HttpResponseModel(
      whether: json['whether'] as String?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] as dynamic,
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
