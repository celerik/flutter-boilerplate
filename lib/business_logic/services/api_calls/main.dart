import 'package:argonovo/business_logic/services/api_calls/example_api.dart';
import 'package:argonovo/config/remote/http_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class ApiCall {
  ExampleApi? exampleApi;

  ApiCall() {
    final dioClient = Dio();

    dioClient.interceptors.add(HttpInterceptor(logger: GetIt.I.get<Logger>()));

    exampleApi = ExampleApi(client: dioClient);
  }
}
