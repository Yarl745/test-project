import 'package:flutter/material.dart';
import 'package:olearistest/core/style/text_style.dart';

class MarkupItem extends StatelessWidget {
  const MarkupItem({
    Key? key,
    required this.index,
    required this.width,
    required this.height,
  }) : super(key: key);

  final int index;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Text(
        'Item $index',
        style: textStyle.w500.s20.black(context),
      ),
    );
  }
}
