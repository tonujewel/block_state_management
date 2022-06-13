// To parse this JSON data, do
//
//     final errorDm = errorDmFromJson(jsonString);

import 'dart:convert';

ErrorDm errorDmFromJson(String str) => ErrorDm.fromJson(json.decode(str));

String errorDmToJson(ErrorDm data) => json.encode(data.toJson());

class ErrorDm {
  ErrorDm({
    this.success,
    this.message,
  });

  bool? success;
  String? message;

  factory ErrorDm.fromJson(Map<String, dynamic> json) => ErrorDm(
        success: json["success"],
        message: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": message,
      };
}
