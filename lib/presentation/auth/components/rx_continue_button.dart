import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:olearistest/base_widgets/buttons/primary_action_button.dart';
import 'package:olearistest/core/translations/local_keys.g.dart';

class RxContinueButton extends StatelessWidget {
  const RxContinueButton({Key? key, required this.onPressed}) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return PrimaryActionButton(
      text: LocaleKeys.continueText.tr(),
      onPressed: onPressed,
      enabled: false,
    );
  }
}
