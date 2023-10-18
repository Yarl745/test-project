import 'package:flutter/material.dart';
import 'package:olearistest/base_widgets/text_fields/styled_login_text_field.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({Key? key, required this.onInput, required this.hintText}) : super(key: key);

  final String hintText;
  final Function(String) onInput;

  @override
  Widget build(BuildContext context) {
    return StyledLoginTextField(
      hintText: hintText,
      onInput: onInput,
    );
  }
}
