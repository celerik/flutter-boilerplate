import 'package:flutter_boilerplate/providers/api_provider.dart';
import 'package:http_interceptor/http_interceptor.dart';

// it's for is use in request internals of platform
class PlatformApiInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      data.headers['Content-Type'] = 'application/json';
      data.headers['Authorization'] = ApiProvider().jwt;
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async =>
      data;
}
