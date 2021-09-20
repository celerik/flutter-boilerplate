// To parse this JSON data, do
//
//     final todoList = todoListFromJson(jsonString);

import 'dart:convert';

List<TodoList> todoListFromJson(String str) =>
    List<TodoList>.from(json.decode(str).map((x) => TodoList.fromJson(x)));

String todoListToJson(List<TodoList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoList {
  TodoList({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.publishedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String title;
  String description;
  String date;
  String publishedAt;
  String createdAt;
  String updatedAt;

  factory TodoList.fromJson(Map<String, dynamic> json) => TodoList(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        date: json["date"],
        publishedAt: json["published_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "date": date,
        "published_at": publishedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
