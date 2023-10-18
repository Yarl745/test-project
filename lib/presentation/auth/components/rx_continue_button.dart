import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olearistest/base_widgets/buttons/primary_action_button.dart';
import 'package:olearistest/core/translations/local_keys.g.dart';
import 'package:olearistest/features/auth/cubits/login_cubit/login_cubit.dart';
import 'package:olearistest/injection_container.dart';

class RxContinueButton extends StatelessWidget {
  const RxContinueButton({Key? key, required this.onPressed}) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      bloc: sl<LoginCubit>(),
      builder: (context, state) {
        bool isLoading = false;
        bool enabled = false;

        if (state is LoginToAccountLoading) {
          isLoading = true;
          enabled = false;
        } //
        else if (state is LoginCredentialsCorrect) {
          isLoading = false;
          enabled = true;
        }

        return PrimaryActionButton(
          text: LocaleKeys.continueText.tr(),
          onPressed: onPressed,
          width: 90,
          enabled: enabled,
          isLoading: isLoading,
        );
      },
    );
  }
}
