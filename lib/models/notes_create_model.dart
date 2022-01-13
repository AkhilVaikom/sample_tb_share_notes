// To parse this JSON data, do
//
//     final noteCreate = noteCreateFromJson(jsonString);

import 'dart:convert';

NoteCreate noteCreateFromJson(String str) =>
    NoteCreate.fromJson(json.decode(str));

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
        id: json["id"],
        title: json["title"],
        description: json["description"],
        createdAt: json["created_at"] ,
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title ,
        "description": description,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
