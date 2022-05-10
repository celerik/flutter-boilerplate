// @scripts
import 'package:flutter_boilerplate/business_logic/utils/validators/validators.dart';
import 'package:test/test.dart';

void main() {
  test('Invalid Email Test', () {
    final result = CustomValidators().validateEmail('');
    expect(result, false);
  });
}
