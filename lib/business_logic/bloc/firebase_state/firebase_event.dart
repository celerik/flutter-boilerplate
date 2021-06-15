part of 'firebase_bloc.dart';

@immutable
abstract class FirebaseEvent {}

class AddFireBaseState extends FirebaseEvent {
  final bool? isEditing;
  final String? text;

  AddFireBaseState({this.isEditing, this.text});
}