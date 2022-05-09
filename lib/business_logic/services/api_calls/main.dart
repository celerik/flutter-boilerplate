// @packages
import 'package:dio/dio.dart';

// @scripts
import 'package:flutter_boilerplate/business_logic/services/api_calls/example_api.dart';
import 'package:flutter_boilerplate/business_logic/services/dio_interceptors.dart';

class ApiCall {
  ExampleApi? exampleApi;

  ApiCall() {
    final dioClient = Dio();

    dioClient.interceptors.add(CustomInterceptors());

    exampleApi = ExampleApi(client: dioClient);
  }
}
