// To parse this JSON data, do
//
//     final noteCreate = noteCreateFromJson(jsonString);

import 'dart:convert';

NoteCreate noteCreateFromJson(String str) => NoteCreate.fromJson(json.decode(str));

String noteCreateToJson(NoteCreate data) => json.encode(data.toJson());

class NoteCreate {
    NoteCreate({
        this.success,
        this.data,
        this.message,
    });

    bool? success;
    Data? data;
    String? message;

    factory NoteCreate.fromJson(Map<String, dynamic> json) => NoteCreate(
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
        this.id,
        this.title,
        this.description,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? title;
    String? description;
    String? createdAt;
    String? updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
    };
}
