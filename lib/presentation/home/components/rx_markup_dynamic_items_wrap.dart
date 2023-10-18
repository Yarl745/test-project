import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olearistest/features/markup/cubits/markup_generator_cubit/markup_generator_cubit.dart';
import 'package:olearistest/injection_container.dart';
import 'package:olearistest/presentation/home/components/markup_item.dart';

class RxMarkupDynamicItemsWrap extends StatelessWidget {
  const RxMarkupDynamicItemsWrap({Key? key, this.maxMarkupWidth = 700}) : super(key: key);

  final double maxMarkupWidth;

  @override
  Widget build(BuildContext context) {
    final itemWidth = (min(maxMarkupWidth, MediaQuery.of(context).size.width) / 2) - 10;
    return BlocBuilder<MarkupGeneratorCubit, MarkupGeneratorState>(
      bloc: sl<MarkupGeneratorCubit>(),
      builder: (context, state) {
        return Wrap(
          runSpacing: 10,
          spacing: 10,
          children: List.generate(
            state.items.length,
            (index) => MarkupItem(
              itemData: state.items[index],
              width: itemWidth,
              height: 48,
            ),
          ),
        );
      },
    );
  }
}
