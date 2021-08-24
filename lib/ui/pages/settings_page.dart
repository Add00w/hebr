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
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        automaticallyImplyLeading: false,
        elevation: 0.0,
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDivider(height: 10, child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Become a member',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.green),
            ),
          ),
          CustomDivider(
            height: 40,
            child: Text('Configure Medium'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5, bottom: 8),
            child: Text(
              'Customize your interests',
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15),
            ),
          ),
          CustomDivider(height: 1, child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark mode',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 15),
                ),
                Text(
                  'System default',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.green),
                ),
              ],
            ),
          ),
          CustomDivider(height: 1, child: SizedBox()),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    required this.height,
    required this.child,
  }) : super(key: key);
  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).dividerColor,
      height: height,
      child: child,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10),
    );
  }
}
/*

  BlocBuilder<ThemeCubit, bool>(
            builder: (context, isDark) {
              return Switch.adaptive(
                value: isDark,
                onChanged: context.read<ThemeCubit>().toggleTheme,
              );
            },
          )


          await context.setLocale(Locale('en'));
*/
