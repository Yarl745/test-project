import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:olearistest/base_widgets/buttons/icon_app_bar_button.dart';

class BackAppBarButton extends StatelessWidget {
  const BackAppBarButton({Key? key}) : super(key: key);

  void onBackTap(BuildContext context) => context.router.pop();
  @override
  Widget build(BuildContext context) {
    return IconAppBarButton(
      iconData: Icons.arrow_back_ios,
      onTap: () => onBackTap(context),
    );
  }
}
