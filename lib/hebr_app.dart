import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './common/bloc/theme_cubit.dart';
import './common/ui/pages/main_page.dart';
import './common/utils/hebr_theme.dart';
import './features/search/bloc/search_cubit.dart';
import './features/splash/splash_page.dart';
import './features/splash/splash_page_cubit.dart';
import './generated/locale_keys.g.dart';

class HebrApp extends StatelessWidget {
  const HebrApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashPageCubit>(
          create: (context) => SplashPageCubit()..isFirstTime(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
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
          );
        },
      ),
    );
  }
}
