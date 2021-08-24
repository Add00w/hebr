import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebr/blocs/form_submission_status.dart';
import 'package:hebr/blocs/signup_cubit/signup_cubit.dart';
import 'package:hebr/generated/locale_keys.g.dart';
import 'package:hebr/repositories/auth_repository_impl.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepositoryImpl(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        resizeToAvoidBottomInset: false,
        body: BlocProvider<SignupCubit>(
          create: (context) => SignupCubit(
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
                      LocaleKeys.join_us.tr(),
                    ),
                    Text(
                      LocaleKeys.join_share_your_ideas_with_us.tr(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 50),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            HebrTextFormField(
                              labelText: LocaleKeys.user_name.tr(),
                            ),
                            SizedBox(height: 10),
                            HebrTextFormField(
                              labelText: LocaleKeys.email.tr(),
                            ),
                            SizedBox(height: 10),
                            HebrTextFormField(
                              isObscureText: true,
                              labelText: LocaleKeys.password.tr(),
                            ),
                            SizedBox(height: 10),
                            HebrTextFormField(
                              isObscureText: true,
                              isConfirmPassword: true,
                              labelText: LocaleKeys.confirm_password.tr(),
                            ),
                            Row(
                              children: [
                                BlocBuilder<SignupCubit, SignupState>(
                                  builder: (context, state) {
                                    return Checkbox(
                                      value: state.agreePolicy,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      side: BorderSide(
                                        color: Colors.grey.shade400,
                                        width: 1.5,
                                      ),
                                      onChanged: (agreed) {
                                        context
                                            .read<SignupCubit>()
                                            .agreePolicyChanged(
                                              agreed ?? state.agreePolicy,
                                            );
                                      },
                                    );
                                  },
                                ),
                                Text(
                                  LocaleKeys.agree_policy.tr(),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: BlocBuilder<SignupCubit, SignupState>(
                          builder: (context, state) {
                            return state.status is FormSubmitting
                                ? Center(child: CircularProgressIndicator())
                                : ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<SignupCubit>().signup();
                                      }
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
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
                          },
                        ),
                      ),
                    ),
                  ],
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
    this.isConfirmPassword = false,
    required this.labelText,
    this.isUserName = false,
  }) : super(key: key);
  final isObscureText;
  final isConfirmPassword;
  final String labelText;
  final isUserName;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: isObscureText ? !state.isPasswordVisible : isObscureText,
          decoration: InputDecoration(
            isDense: true,
            labelText: labelText,
            suffixIcon: isObscureText
                ? GestureDetector(
                    onTap: () {
                      context
                          .read<SignupCubit>()
                          .passwordVisibilityChanged(!state.isPasswordVisible);
                    },
                    child: Icon(
                      state.isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  )
                : null,
          ),
          validator: (_) {
            if (isObscureText && isConfirmPassword) {
              return state.isValidConfirmPassword
                  ? null
                  : LocaleKeys.confirm_password_must_equal_to_password.tr();
            } else if (isObscureText) {
              return state.isValidPassword
                  ? null
                  : LocaleKeys.password_is_short.tr();
            } else if (isUserName) {
              return state.isValidUsername
                  ? null
                  : LocaleKeys.username_is_short.tr();
            }
            return state.isValidEmail ? null : LocaleKeys.invalidEmail.tr();
          },
          onChanged: (value) {
            if (isObscureText && isConfirmPassword) {
              context.read<SignupCubit>().confirmPasswordChanged(value);
            } else if (isObscureText) {
              context.read<SignupCubit>().passwordChanged(value);
            } else if (isUserName) {
              context.read<SignupCubit>().usernameChanged(value);
            } else {
              context.read<SignupCubit>().emailChanged(value);
            }
          },
        );
      },
    );
  }
}
