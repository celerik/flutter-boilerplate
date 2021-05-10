part of 'user_auth_state_bloc.dart';

class UserAuthStateInitial {
  final String userName;
  final String email;

  UserAuthStateInitial({this.userName = '', this.email});

  UserAuthStateInitial copyWith({String userName, String email}) {
    return UserAuthStateInitial(
      userName: userName ?? this.userName,
      email: email ?? this.email,
    );
  }
}
