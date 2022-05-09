// @packages
import 'dart:convert';
import 'package:dio/dio.dart';

// @scripts
import 'package:flutter_boilerplate/business_logic/services/models/example_api.dart';

// @constants
import 'package:flutter_boilerplate/business_logic/utils/constants.dart';

class ExampleApi {
  Dio client;

  ExampleApi({required this.client});

  Future<ExampleApiModel> exampleFetch() async {
    final response = await client.get(Constants().apiUrl);
    final parsedData = ExampleApiModel.fromJson(json.decode(response.data));
    return parsedData;
  }
}
