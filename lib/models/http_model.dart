// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class HttpResponseModel<T> {
  final String whether;
  final int code;
  final String message;
  final T data;
  final bool success;

  HttpResponseModel({
    required this.whether,
    required this.code,
    required this.message,
    required this.data,
    required this.success,
  });

  HttpResponseModel copyWith({
    String? whether,
    int? code,
    String? message,
    T? data,
    bool? success,
  }) =>
      HttpResponseModel(
        whether: whether ?? this.whether,
        code: code ?? this.code,
        message: message ?? this.message,
        data: data ?? this.data,
        success: success ?? this.success,
      );

  factory HttpResponseModel.fromRawJson(String str) =>
      HttpResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HttpResponseModel.fromJson(Map<String, dynamic> json) =>
      HttpResponseModel(
        whether: json["whether"],
        code: json["code"],
        message: json["message"],
        data: json["data"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "whether": whether,
        "code": code,
        "message": message,
        "data": data,
        "success": success,
      };
}
