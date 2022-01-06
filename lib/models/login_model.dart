
import 'dart:convert';

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
    UserLogin({
        this.success,
        this.data,
        this.message,
    });

    bool? success;
    Data? data;
    String? message;

    factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success ,
        "data": data?.toJson(),
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
