// @packages
import 'package:flutter_boilerplate/business_logic/services/http_interceptors.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';

// @packages
import 'package:flutter_boilerplate/business_logic/services/api_calls/example_api.dart';

class ApiCall {
  ExampleApi? exampleApi;

  ApiCall() {
    final client = HttpClientWithInterceptor.build(interceptors: [
      ExampleInterceptor(),
    ]);
    exampleApi = ExampleApi(client: client);
  }
}
