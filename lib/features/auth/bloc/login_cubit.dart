import 'package:bloc/bloc.dart';
import 'package:hebr/common/bloc/form_submission_status.dart';

import '../data/data.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo}) : super(LoginState());
  final AuthRepository authRepo;

  void login() async {
    emit(
      state.copyWith(
        status: FormSubmitting(),
      ),
    );
    try {
      await authRepo.signInWithEmailAndPassword(
        username: state.username,
        password: state.password,
        isRemember: state.isRemember,
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FormSubmissionFailed(e as Exception),
        ),
      );
    }
    emit(
      state.copyWith(
        status: Formsubmitted(),
      ),
    );
  }

  void logout() async {
    emit(
      state.copyWith(
        status: FormSubmitting(),
      ),
    );
    await authRepo.signout();
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
