import 'dart:convert';

import 'package:argonovo/business_logic/services/models/example_api_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ExampleApi {
  Dio client;

  ExampleApi({required this.client});

  Future<ExampleApiModel> exampleFetch() async {
    final response = await client.get<dynamic>(dotenv.get('BASE_URL'));
    final parsedData = ExampleApiModel.fromJson(json.decode(response.data));
    return parsedData;
  }
}
