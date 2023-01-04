import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './common/bloc/theme_cubit.dart';
import './common/ui/pages/main_page.dart';
import './common/utils/hebr_theme.dart';
import './features/auth/auth.dart';
import './features/search/bloc/search_cubit.dart';
import './features/splash/splash.dart';
import './generated/locale_keys.g.dart';

class HebrApp extends StatelessWidget {
  const HebrApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SplashPageCubit>(
            create: (context) => SplashPageCubit()..isFirstTime(),
          ),
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit()..init(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, bool>(
          builder: (context, isDark) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
              theme: HebrTheme.lightTheme(),
              darkTheme: HebrTheme.darkTheme(),
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: LocaleKeys.app_title.tr(),
              home: BlocBuilder<SplashPageCubit, bool>(
                builder: (context, isFirstTime) {
                  if (isFirstTime) {
                    return const SplashPage();
                  }
                  return BlocProvider(
                    create: (context) => SearchCubit(),
                    child: const MainPage(),
                  );
                },
              ),
              builder: (_, child) => _Unfocus(child: child!),
            );
          },
        ),
      ),
    );
  }
}

/// A widget that unfocus everything when tapped.
///
/// This implements the "Unfocus when tapping in empty space" behavior for the
/// entire application.
class _Unfocus extends StatelessWidget {
  const _Unfocus({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
