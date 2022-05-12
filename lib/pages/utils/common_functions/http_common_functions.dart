import 'package:dio/dio.dart';

extension UriMapper on String {
  Uri parseToUri() {
    return Uri.parse(this);
  }
}

extension IsOk on Response<dynamic> {
  bool get ok {
    return (statusCode! ~/ 100) == 2;
  }
}

extension Retry<T> on Future<T> Function() {
  Future<T> withRetries(int count, {int delayInSeconds = 0}) async {
    while (true) {
      try {
        final future = this();
        return await future;
      } catch (e) {
        await Future<void>.delayed(Duration(seconds: delayInSeconds));

        if (count > 0) {
          count--;
        } else {
          rethrow;
        }
      }
    }
  }
}
