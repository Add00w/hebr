import 'package:bloc/bloc.dart';

import '../../../common/bloc/form_submission_status.dart';
import '../data/data.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.authRepo}) : super(SignupState());

  final AuthRepository authRepo;

  void signup() async {
    try {
      emit(
        state.copyWith(
          status: FormSubmitting(),
        ),
      );
      await authRepo.createUserWithEmailAndPassword(
        username: state.username,
        email: state.email,
        password: state.password,
        confirmPassword: state.confirmPassword,
        agreePolicy: state.agreePolicy,
      );
      emit(
        state.copyWith(
          status: Formsubmitted(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FormSubmissionFailed(e as Exception),
        ),
      );
    }
  }

  void usernameChanged(String username) {
    emit(state.copyWith(username: username));
  }

  void emailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  void confirmPasswordChanged(String confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword));
  }

  void agreePolicyChanged(bool agreePolicy) {
    emit(state.copyWith(agreePolicy: agreePolicy));
  }

  void passwordVisibilityChanged(bool isVisible) {
    emit(state.copyWith(isPasswordVisible: isVisible));
  }

  void confirmPasswordVisibilityChanged(bool isVisible) {
    emit(state.copyWith(isConfirmPasswordVisible: isVisible));
  }
}
