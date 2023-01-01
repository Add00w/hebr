import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../bloc/signup_cubit.dart';

//Todo Temporary until we unite the textfields
class SignupTextFormField extends StatelessWidget {
  const SignupTextFormField({
    Key? key,
    this.isObscureText = false,
    this.isConfirmPassword = false,
    required this.labelText,
    this.isUserName = false,
  }) : super(key: key);
  final bool isObscureText;
  final bool isConfirmPassword;
  final String labelText;
  final bool isUserName;
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
                : const SizedBox.shrink(),
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
