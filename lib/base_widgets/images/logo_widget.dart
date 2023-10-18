import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:olearistest/core/helper/asset_paths.dart';
import 'package:olearistest/core/style/colors/colors.dart';
import 'package:olearistest/core/style/padding_consts.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key, this.maxWidth = 375, this.withBorders = false}) : super(key: key);

  final double maxWidth;
  final bool withBorders;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Container(
        width: maxWidth,
        padding: withBorders ? CPadding.all10 : null,
        decoration: withBorders
            ? BoxDecoration(
                border: Border.all(color: Clr.of(context).black, width: 1),
                borderRadius: BorderRadius.circular(14),
              )
            : null,
        child: SvgPicture.asset(
          Assets.logo,
          width: maxWidth,
        ),
      ),
    );
  }
}
