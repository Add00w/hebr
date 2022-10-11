import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../bloc/login_cubit.dart';

//Todo Temporary until we unite the textfields
class SigninTextFormField extends StatelessWidget {
  const SigninTextFormField({
    Key? key,
    this.isObscureText = false,
  }) : super(key: key);
  final bool isObscureText;
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
