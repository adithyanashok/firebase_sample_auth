part of 'register_bloc.dart';

class RegisterState {
  final String username;
  final String email;
  final String password;
  final String rePassword;

  const RegisterState({
    this.email = "",
    this.username = "",
    this.password = "",
    this.rePassword = "",
  });

  RegisterState copyWith({
    String? username,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return RegisterState(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
    );
  }
}
