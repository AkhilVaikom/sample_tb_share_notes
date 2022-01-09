// To parse this JSON data, do
//
//     final userSignUp = userSignUpFromJson(jsonString);

import 'dart:convert';

UserSignUp userSignUpFromJson(String str) => UserSignUp.fromJson(json.decode(str));

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
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "data": data == null ? null : data!.toJson(),
        "message": message == null ? null : message,
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
        token: json["token"] == null ? null : json["token"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "token": token == null ? null : token,
        "name": name == null ? null : name,
    };
}
