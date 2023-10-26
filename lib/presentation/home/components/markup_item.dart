import 'package:flutter/material.dart';
import 'package:olearistest/core/style/text_style.dart';
import 'package:olearistest/features/markup/data/repositories/entities/markup_item_data.dart';

class MarkupItem extends StatelessWidget {
  const MarkupItem({
    Key? key,
    required this.itemData,
    this.width,
    this.height,
  }) : super(key: key);

  final MarkupItemData itemData;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: width ?? double.infinity,
        maxHeight: height ?? double.infinity,
      ),
      // width: width,
      // height: height,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Text(
          itemData.name,
          style: textStyle.w500.s20.black(context),
        ),
      ),
    );
  }
}
