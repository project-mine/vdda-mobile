// To parse this JSON data, do
//
//     final loginModelResponse = loginModelResponseFromJson(jsonString);

import 'dart:convert';

LoginModelResponse loginModelResponseFromJson(String str) =>
    LoginModelResponse.fromJson(json.decode(str));

String loginModelResponseToJson(LoginModelResponse data) =>
    json.encode(data.toJson());

class LoginModelResponse {
  LoginModelResponse({
    this.key,
  });

  String key;

  factory LoginModelResponse.fromJson(Map<String, dynamic> json) =>
      LoginModelResponse(
        key: json["key"] == null ? null : json["key"],
      );

  Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
      };
}
