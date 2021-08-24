import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebr/blocs/auth_cubit/auth_cubit.dart';
import 'package:hebr/ui/pages/login_page.dart';

class AuthenticatedPages extends StatelessWidget {
  const AuthenticatedPages({Key? key, required this.page}) : super(key: key);
  final Widget page;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..init(),
      child: Builder(builder: (_) {
        return BlocBuilder<AuthCubit, bool>(
          builder: (context, isAuthenticated) {
            return isAuthenticated ? page : LoginPage();
          },
        );
      }),
    );
  }
}
