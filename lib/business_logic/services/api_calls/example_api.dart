// @packages
import 'dart:convert';
import 'package:http_interceptor/http_client_with_interceptor.dart';

// @scripts
import 'package:flutter_boilerplate/business_logic/services/models/example_api.dart';

// @constants
import 'package:flutter_boilerplate/business_logic/utils/constants.dart';

class ExampleApi {
  HttpClientWithInterceptor client;

  ExampleApi({this.client});

  Future<ExampleApiModel> exampleFetch() async {
    final response = await client.get(Uri.parse(Constants().apiUrl));
    final parsedData = ExampleApiModel.fromJson(json.decode(response.body));
    return parsedData;
  }
}
