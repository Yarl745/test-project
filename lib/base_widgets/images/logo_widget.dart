import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:olearistest/core/helper/asset_paths.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key, this.maxWidth = 375}) : super(key: key);

  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: SvgPicture.asset(
        Assets.logo,
        width: maxWidth,
      ),
    );
  }
}
