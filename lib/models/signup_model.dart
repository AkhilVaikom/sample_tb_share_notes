// To parse this JSON data, do
//
//     final userSignUp = userSignUpFromJson(jsonString);

import 'dart:convert';

UserSignUp userSignUpFromJson(String str) =>
    UserSignUp.fromJson(json.decode(str));

String userSignUpToJson(UserSignUp data) => json.encode(data.toJson());

class UserSignUp {
  UserSignUp({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  String? message;

  factory UserSignUp.fromJson(Map<String, dynamic> json) => UserSignUp(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null ? null : data!.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.token,
    this.name,
  });

  String? token;
  String? name;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
      };
}
