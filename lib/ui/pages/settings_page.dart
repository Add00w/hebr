import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebr/blocs/theme_cubit/theme_cubit.dart';
import 'package:hebr/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            LocaleKeys.app_title,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ).tr(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await context.setLocale(Locale('en'));
                },
                child: Text(
                  'English',
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await context.setLocale(Locale('ar'));
                },
                child: Text(
                  'العربية',
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
          BlocBuilder<ThemeCubit, bool>(
            builder: (context, isDark) {
              return Switch.adaptive(
                value: isDark,
                onChanged: context.read<ThemeCubit>().toggleTheme,
              );
            },
          )
        ],
      ),
    );
  }
}
