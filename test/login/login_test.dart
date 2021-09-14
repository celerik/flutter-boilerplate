import 'package:flutter_boilerplate/business_logic/utils/regex.dart';
import 'package:flutter_boilerplate/business_logic/utils/validators/validators.dart';
import 'package:test/test.dart';

void main() {
  test('Invalid Email Test', () {
    var result = CustomValidators().validateEmail('');
    expect(result, false);
  });
}
