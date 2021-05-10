/// Checks if a list of strings has an empty element
/// Returns {bool}
bool checkTextControllers([List<String> args]) {
  var checkStatus = true;
  for(final arg in args) {
    checkStatus = checkStatus && arg.trim().isNotEmpty;
  }
  return checkStatus;
}