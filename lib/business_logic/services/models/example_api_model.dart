import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'example_api_model.g.dart';

@JsonSerializable()
class ExampleApiModel {
  @JsonKey(name: 'userId')
  final int userId;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'completed')
  final bool completed;

  ExampleApiModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory ExampleApiModel.fromJson(Map<String, dynamic> json) => _$ExampleApiModelFromJson(json);

  String toJson() => json.encode(_$ExampleApiModelToJson(this));
}
