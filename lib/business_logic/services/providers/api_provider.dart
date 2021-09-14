import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiProvider {
  String _baseUrl = '';
  String _jwt = '';
  String get jwt => _jwt;
  String get baseUrl => _baseUrl;
  ApiProvider() {
    _baseUrl = dotenv.env['BASE_URL'].toString();
    _jwt = dotenv.env['JWT'].toString();
  }
}
