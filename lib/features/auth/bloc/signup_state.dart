part of 'signup_cubit.dart';

class SignupState {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  final bool agreePolicy;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final FormSubmissionStatus status;
  bool get isValidUsername => username.length > 2;
  bool get isValidEmail => email.length > 5;
  bool get isValidPassword => password.length > 4;
  bool get isValidConfirmPassword => confirmPassword == password;
  SignupState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.agreePolicy = false,
    this.isPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
    this.status = const FormInitial(),
  });
  SignupState copyWith({
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
    bool? agreePolicy,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    FormSubmissionStatus? status,
  }) {
    return SignupState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      agreePolicy: agreePolicy ?? this.agreePolicy,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
      status: status ?? this.status,
    );
  }
}
