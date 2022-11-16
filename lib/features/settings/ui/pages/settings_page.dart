import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebr/common/bloc/theme_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomDivider(height: 10, child: SizedBox.shrink()),
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
          const CustomDivider(
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
          const CustomDivider(height: 1, child: SizedBox()),
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
                BlocBuilder<ThemeCubit, bool>(
                  builder: (context, isDark) {
                    return Switch.adaptive(
                      value: isDark,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: context.read<ThemeCubit>().toggleTheme,
                    );
                  },
                ),
              ],
            ),
          ),
          const CustomDivider(height: 1, child: SizedBox()),
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
      padding: const EdgeInsets.only(left: 10),
    );
  }
}
