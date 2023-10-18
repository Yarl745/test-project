import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olearistest/presentation/home/components/markup_item.dart';

class RxMarkupDynamicItemsWrap extends StatelessWidget {
  const RxMarkupDynamicItemsWrap({Key? key, this.maxMarkupWidth = 700}) : super(key: key);

  final double maxMarkupWidth;

  @override
  Widget build(BuildContext context) {
    final itemWidth = (min(maxMarkupWidth, MediaQuery.of(context).size.width) / 2) - 10;
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      children: List.generate(
        17,
        (index) => MarkupItem(index: index + 1, width: itemWidth, height: 48),
      ),
    );
  }
}
