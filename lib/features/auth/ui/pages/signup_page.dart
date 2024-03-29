import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/common.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../bloc/signup_cubit.dart';
import '../../data/data.dart';
import '../widgets/widgets.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider<SignupCubit>(
        create: (context) => SignupCubit(
          authRepo: context.read<AuthRepository>(),
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
                          SignupTextFormField(
                            labelText: LocaleKeys.user_name.tr(),
                          ),
                          const SizedBox(height: 10),
                          SignupTextFormField(
                            labelText: LocaleKeys.email.tr(),
                          ),
                          const SizedBox(height: 10),
                          SignupTextFormField(
                            isObscureText: true,
                            labelText: LocaleKeys.password.tr(),
                          ),
                          const SizedBox(height: 10),
                          SignupTextFormField(
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
                              Text(LocaleKeys.agree_policy.tr())
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
                      child: BlocConsumer<SignupCubit, SignupState>(
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
                        },
                        builder: (context, state) {
                          return state.status is FormSubmitting
                              ? const CircularProgressIndicatorWidget()
                              : ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<SignupCubit>().signup();
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
                                        borderRadius: BorderRadius.circular(20),
                                      ),
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
    );
  }
}
