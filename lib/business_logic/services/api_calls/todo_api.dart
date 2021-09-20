// @packages
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/business_logic/services/interceptors/platformInterceptor.dart';
import 'package:flutter_boilerplate/business_logic/services/models/todolist.dart';
import 'package:flutter_boilerplate/business_logic/services/providers/api_provider.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';

// @scripts
import 'package:flutter_boilerplate/business_logic/services/models/example_api.dart';

// @constants
import 'package:flutter_boilerplate/business_logic/utils/constants.dart';

class TodoApi {
  Client client = HttpClientWithInterceptor.build(interceptors: [
    PlatformApiInterceptor(),
  ]);

  TodoApi();
  String baseUrl = ApiProvider().baseUrl;

  Future<List<TodoList>> getTodoList() async {
    final response = await client.get(Uri.parse('${baseUrl}/to-do-lists'));

    if (response.statusCode == 200) {
      List<TodoList> listOfTodo(String str) => List<TodoList>.from(
          json.decode(str).map((x) => TodoList.fromJson(x)));

      return listOfTodo(response.body);
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<bool> addTodoList(title, description) async {
    final response = await client.post(
      Uri.parse('${baseUrl}to-do-lists'),
      body: json.encode({
        'title': title,
        'description': description,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
