import 'package:hydrated_bloc/hydrated_bloc.dart';

class SplashPageCubit extends HydratedCubit<bool> {
  SplashPageCubit() : super(true);
  void isFirstTime() => emit(state);
  @override
  bool? fromJson(Map<String, dynamic> json) => json['isFirstTime'] as bool;

  @override
  Map<String, dynamic>? toJson(bool state) => {'isFirstTime': state};

  void updateState() async {
    await Future.delayed(const Duration(seconds: 3));
    emit(!state);
  }
}
