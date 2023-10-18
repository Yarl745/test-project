import 'package:flutter/material.dart';
import 'package:olearistest/core/style/text_style.dart';
import 'package:olearistest/features/markup/data/repositories/entities/markup_item_data.dart';

class MarkupItem extends StatelessWidget {
  const MarkupItem({
    Key? key,
    required this.itemData,
    required this.width,
    required this.height,
  }) : super(key: key);

  final MarkupItemData itemData;
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
        itemData.name,
        style: textStyle.w500.s20.black(context),
      ),
    );
  }
}
