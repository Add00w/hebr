part of 'login_cubit.dart';

class LoginState {
  final String username;
  final String password;
  final bool isRemember;
  final bool isVisible;
  final FormSubmissionStatus status;
  bool get isUsernameValid => username.length > 2;
  bool get isPasswordValid => password.length > 4;
  LoginState({
    this.username = '',
    this.password = '',
    this.isRemember = false,
    this.isVisible = false,
    this.status = const FormInitial(),
  });
  LoginState copyWith({
    String? username,
    String? password,
    bool? isRemember,
    bool? isVisible,
    FormSubmissionStatus? status,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      isRemember: isRemember ?? this.isRemember,
      isVisible: isVisible ?? this.isVisible,
      status: status ?? this.status,
    );
  }
}
