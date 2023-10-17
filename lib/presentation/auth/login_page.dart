import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:olearistest/base_widgets/images/logo_widget.dart';
import 'package:olearistest/base_widgets/scroll_widgets/expanded_scroll_view.dart';
import 'package:olearistest/core/style/padding_consts.dart';
import 'package:olearistest/core/translations/local_keys.g.dart';
import 'package:olearistest/presentation/auth/components/login_text_field.dart';
import 'package:olearistest/presentation/auth/components/rx_continue_button.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void onContinuePressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(LocaleKeys.signIn.tr()),
      ),
      body: ExpandedScrollView(
        hasScrollBody: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Expanded(flex: 1, child: SizedBox(height: 30)),
            const LogoWidget(maxWidth: 375),
            const Expanded(flex: 1, child: SizedBox(height: 30)),
            Container(
              margin: CPadding.horizontal20,
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                children: [
                  LoginTextField(hintText: LocaleKeys.login.tr(), onInput: (_) {}),
                  LoginTextField(hintText: LocaleKeys.password.tr(), onInput: (_) {}),
                ],
              ),
            ),
            const Expanded(flex: 2, child: SizedBox(height: 30)),
            RxContinueButton(onPressed: onContinuePressed),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
