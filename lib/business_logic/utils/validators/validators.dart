import '../regex.dart';

class CustomValidators {
  bool validateEmail(email) {
    final regex = RegExp(RegexExpressions().emailPattern);
    if (!regex.hasMatch(email)) {
      return false;
    }
    return true;
  }
}
