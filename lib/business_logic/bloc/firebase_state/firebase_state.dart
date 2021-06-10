part of 'firebase_bloc.dart';

class FirebaseState {
  final bool isEditing;
  final String text;

  FirebaseState({this.isEditing = false, this.text = ''});

  FirebaseState copyWith({bool? isEditing, String? text}) {
    return FirebaseState(isEditing: isEditing ?? this.isEditing, text: text ?? this.text);
  }
}
