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
  DateTime date;
  DateTime publishedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory TodoList.fromJson(Map<String, dynamic> json) => TodoList(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "date": date.toIso8601String(),
        "published_at": publishedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
