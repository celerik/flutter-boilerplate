// @packages
import 'dart:convert';
import 'package:http_interceptor/http_client_with_interceptor.dart';

// @constants
import 'package:flutter_boilerplate/business_logic/utils/constants.dart';

class ExampleApi {
  HttpClientWithInterceptor client;

  ExampleApi({this.client});

  Future<Map<String, dynamic>> exampleFetch() async {
    Map<String, dynamic> parsedData;
    try {
      final response = await client.get(Uri.parse(Constants().apiUrl));
      if (response.statusCode == 200) {
        parsedData = json.decode(response.body);
      } else {
        print(response.body);
      }
    } catch (error) {
      print(error);
    }
    return parsedData;
  }
}
