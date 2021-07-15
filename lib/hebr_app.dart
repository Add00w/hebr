import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebr/blocs/splash_page_cubit/splash_page_cubit.dart';
import 'package:hebr/blocs/theme_cubit/theme_cubit.dart';
import 'package:hebr/ui/pages/main_page.dart';
import 'package:hebr/ui/pages/splash_page.dart';
import 'package:hebr/utils/hebr_theme.dart';

import 'generated/locale_keys.g.dart';
import 'ui/pages/home_page.dart';

class HebrApp extends StatelessWidget {
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
            title: LocaleKeys.app_title,
            home: BlocBuilder<SplashPageCubit, bool>(
              builder: (context, isFirstTime) {
                if (isFirstTime) {
                  return SplashPage();
                }
                return MainPage();
              },
            ),
          );
        },
      ),
    );
  }
}
