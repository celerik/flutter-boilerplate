class ExampleApiModel {
  int? _userId;
  int? _id;
  String? _title;
  bool? _completed;

  ExampleApiModel.fromJson(Map<String, dynamic> parsedJson) {
    _userId = parsedJson['userId'];
    _id = parsedJson['id'];
    _title = parsedJson['title'];
    _completed = parsedJson['completed'];
  }

  bool? get completed => _completed;

  String? get title => _title;

  int? get id => _id;

  int? get userId => _userId;
}
