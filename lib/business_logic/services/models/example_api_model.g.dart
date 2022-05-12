// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExampleApiModel _$ExampleApiModelFromJson(Map<String, dynamic> json) =>
    ExampleApiModel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$ExampleApiModelToJson(ExampleApiModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
