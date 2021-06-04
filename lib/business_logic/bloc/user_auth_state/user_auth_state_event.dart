part of 'user_auth_state_bloc.dart';

@immutable
abstract class UserAuthStateEvent {}

class AddUserState extends UserAuthStateEvent {
  final String? userName;
  final String? email;

  AddUserState({this.userName, this.email});
}
