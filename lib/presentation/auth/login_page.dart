import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:olearistest/base_widgets/images/logo_widget.dart';
import 'package:olearistest/base_widgets/scroll_widgets/expanded_scroll_view.dart';
import 'package:olearistest/core/style/padding_consts.dart';
import 'package:olearistest/core/style/text_style.dart';
import 'package:olearistest/core/translations/local_keys.g.dart';
import 'package:olearistest/features/auth/cubits/login_cubit/login_cubit.dart';
import 'package:olearistest/features/auth/cubits/user_session_cubit/user_session_cubit.dart';
import 'package:olearistest/injection_container.dart';
import 'package:olearistest/presentation/auth/components/login_text_field.dart';
import 'package:olearistest/presentation/auth/components/rx_continue_button.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void onContinuePressed() async {
    final jwtToken = await sl<LoginCubit>().loginToApp();
    if (jwtToken == null) return;
    sl<UserSessionCubit>().saveTokenAndAuthorize(token: jwtToken);
  }

  void onEmailInput(String text) => sl<LoginCubit>().enterCredentials(email: text);

  void onPasswordInput(String text) => sl<LoginCubit>().enterCredentials(password: text);

  void navigateToHomePage(BuildContext context) {
    context.router.root.pushNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserSessionCubit, UserSessionState>(
      bloc: sl<UserSessionCubit>(),
      listener: (context, state) {
        if (state is UserAuthorized) {
          navigateToHomePage(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(LocaleKeys.signIn.tr(), style: textStyle.s18.w400),
        ),
        body: SafeArea(
          child: KeyboardDismissOnTap(
            child: ExpandedScrollView(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Expanded(flex: 1, child: SizedBox(height: 30)),
                  const Padding(
                    padding: CPadding.horizontal20,
                    child: LogoWidget(maxWidth: 375),
                  ),
                  const Expanded(flex: 1, child: SizedBox(height: 30)),
                  Container(
                    margin: CPadding.horizontal20,
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: Column(
                      children: [
                        LoginTextField(hintText: LocaleKeys.login.tr(), onInput: onEmailInput),
                        LoginTextField(hintText: LocaleKeys.password.tr(), onInput: onPasswordInput),
                      ],
                    ),
                  ),
                  const Expanded(flex: 2, child: SizedBox(height: 30)),
                  RxContinueButton(onPressed: onContinuePressed),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
