import 'package:bloc/bloc.dart';
import 'package:hebr/blocs/form_submission_status.dart';
import 'package:hebr/repositories/auth_repository_impl.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo}) : super(LoginState());
  final AuthRepositoryImpl authRepo;

  void login() async {
    emit(
      state.copyWith(
        status: FormSubmitting(),
      ),
    );
    await authRepo.login(
      username: state.username,
      password: state.password,
      isRemember: state.isRemember,
    );
    emit(
      state.copyWith(
        status: Formsubmitted(),
      ),
    );
  }

  void loginUsernameChanged(String username) {
    emit(state.copyWith(username: username));
  }

  void loginPasswordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  void loginRememberChanged(bool isRemember) {
    emit(state.copyWith(isRemember: isRemember));
  }

  void passwordVisibilityChanged(bool isVisible) {
    emit(state.copyWith(isVisible: isVisible));
  }
}
