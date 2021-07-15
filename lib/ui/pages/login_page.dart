import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebr/blocs/form_submission_status.dart';
import 'package:hebr/blocs/login_cubit/login_cubit.dart';
import 'package:hebr/generated/locale_keys.g.dart';
import 'package:hebr/repositories/auth_repository_impl.dart';
import 'package:hebr/ui/pages/signup_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepositoryImpl(),
      child: Scaffold(
        body: BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(
            authRepo: context.read<AuthRepositoryImpl>(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.login,
                    ).tr(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 50),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              HebrTextFormField(),
                              SizedBox(height: 10),
                              HebrTextFormField(isObscureText: true),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      BlocBuilder<LoginCubit, LoginState>(
                                        builder: (context, state) {
                                          return Checkbox(
                                            value: state.isRemember,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
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
                                  Spacer(),
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
                        child: BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                          return state.status is FormSubmitting
                              ? Center(child: CircularProgressIndicator())
                              : ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<LoginCubit>().login();
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Theme.of(context).primaryColor),
                                  ),
                                  child: Text(
                                    LocaleKeys.continue_to.tr(),
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
                              color: Theme.of(context).accentColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HebrTextFormField extends StatelessWidget {
  const HebrTextFormField({
    Key? key,
    this.isObscureText = false,
  }) : super(key: key);
  final isObscureText;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: isObscureText ? !state.isVisible : isObscureText,
          decoration: InputDecoration(
            labelText: isObscureText
                ? LocaleKeys.password.tr()
                : LocaleKeys.user_name.tr(),
            suffixIcon: isObscureText
                ? GestureDetector(
                    onTap: () {
                      context
                          .read<LoginCubit>()
                          .passwordVisibilityChanged(!state.isVisible);
                    },
                    child: Icon(
                      state.isVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  )
                : null,
          ),
          validator: (_) {
            if (isObscureText) {
              return state.isPasswordValid
                  ? null
                  : LocaleKeys.password_is_short.tr();
            }
            return state.isUsernameValid
                ? null
                : LocaleKeys.username_is_short.tr();
          },
          onChanged: (value) {
            if (isObscureText) {
              context.read<LoginCubit>().loginPasswordChanged(value);
            } else {
              context.read<LoginCubit>().loginUsernameChanged(value);
            }
          },
        );
      },
    );
  }
}
