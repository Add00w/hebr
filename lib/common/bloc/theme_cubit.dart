import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<bool> {
  ThemeCubit() : super(false);
  void toggleTheme(bool isDark) => emit(isDark);

  @override
  bool? fromJson(Map<String, dynamic> json) {
    return json['isDark'] as bool;
  }

  @override
  Map<String, dynamic>? toJson(bool state) {
    return {'isDark': state};
  }
}
