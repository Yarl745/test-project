import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:olearistest/base_widgets/buttons/back_app_bar_button.dart';
import 'package:olearistest/base_widgets/buttons/icon_app_bar_button.dart';
import 'package:olearistest/core/style/text_style.dart';
import 'package:olearistest/core/translations/local_keys.g.dart';

class MarkupControlAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MarkupControlAppBar({
    Key? key,
    required this.onPlusTap,
    required this.onMinusTap,
  }) : super(key: key);

  final Function() onPlusTap;
  final Function() onMinusTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text(LocaleKeys.markupTest.tr(), style: textStyle.s18.w400),
      leading: const BackAppBarButton(),
      actions: [
        IconAppBarButton(iconData: Icons.remove, onTap: onMinusTap),
        IconAppBarButton(iconData: Icons.add, onTap: onPlusTap),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
