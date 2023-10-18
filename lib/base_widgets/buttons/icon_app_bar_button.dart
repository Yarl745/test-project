import 'package:flutter/material.dart';

class IconAppBarButton extends StatelessWidget {
  const IconAppBarButton({Key? key, required this.iconData, required this.onTap}) : super(key: key);

  final IconData iconData;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData,
        color: Colors.white,
      ),
      onPressed: onTap,
    );
  }
}
