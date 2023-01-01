import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/auth/bloc/auth_cubit.dart';
import '../../../features/auth/ui/pages/login_page.dart';

class AuthenticatedPages extends StatelessWidget {
  const AuthenticatedPages({Key? key, required this.page}) : super(key: key);
  final Widget page;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (_) {
      return BlocBuilder<AuthCubit, User?>(
        builder: (context, user) {
          return user != null ? page : LoginPage();
        },
      );
    });
  }
}
