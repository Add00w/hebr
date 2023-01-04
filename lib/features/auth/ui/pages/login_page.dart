import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './signup_page.dart';
import '../../../../common/common.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../bloc/bloc.dart';
import '../../data/data.dart';
import '../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(
          authRepo: context.read<AuthRepository>(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    LocaleKeys.login,
                  ).tr(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 50,
                    ),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SigninTextFormField(),
                            const SizedBox(height: 10),
                            const SigninTextFormField(isObscureText: true),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    BlocBuilder<LoginCubit, LoginState>(
                                      builder: (context, state) {
                                        return Checkbox(
                                          value: state.isRemember,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          onChanged: (isRemember) {
                                            context
                                                .read<LoginCubit>()
                                                .loginRememberChanged(
                                                  isRemember ??
                                                      state.isRemember,
                                                );
                                          },
                                        );
                                      },
                                    ),
                                    Text(
                                      LocaleKeys.remember.tr(),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  LocaleKeys.forget_password.tr(),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                        if (state.status is FormSubmissionFailed) {
                          // show error
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: Text(
                                  (state.status as FormSubmissionFailed)
                                      .exception
                                      .toString(),
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.red,
                              ),
                            );
                        }
                      }, builder: (context, state) {
                        return state.status is FormSubmitting
                            ? const CircularProgressIndicatorWidget()
                            : ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<LoginCubit>().login();
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.green.shade900,
                                  ),
                                  side: MaterialStateProperty.all(
                                      BorderSide.none),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ),
                                child: Text(
                                  LocaleKeys.continue_to.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(color: Colors.white),
                                ),
                              );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SignupPage(),
                  ),
                );
              },
              child: RichText(
                text: TextSpan(
                  text: LocaleKeys.do_not_have_account.tr(),
                  style: Theme.of(context).textTheme.bodyText1,
                  children: [
                    TextSpan(
                      text: LocaleKeys.join_now.tr(),
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.green,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
