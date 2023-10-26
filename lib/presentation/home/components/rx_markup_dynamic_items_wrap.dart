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

class RxMarkupDynamicItemsGrid extends StatelessWidget {
  const RxMarkupDynamicItemsGrid({
    Key? key,
    this.maxMarkupWidth = 700,
    required this.itemHeight,
    this.itemWidth,
  }) : super(key: key);

  final double maxMarkupWidth;
  final double itemHeight;
  final double? itemWidth;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final calculatedItemWidth = itemWidth ?? (min(maxMarkupWidth, screenWidth) / 2) - 10;
    final horizontalPadding = max(10.0, (screenWidth - 2 * calculatedItemWidth) / 2);
    return BlocBuilder<MarkupGeneratorCubit, MarkupGeneratorState>(
      bloc: sl<MarkupGeneratorCubit>(),
      builder: (context, state) {
        return SizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: calculatedItemWidth / itemHeight,
              ),
              itemBuilder: (context, index) {
                return MarkupItem(
                  itemData: state.items[index],
                  height: itemHeight,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class RxMarkupDynamicItemsSliver extends StatelessWidget {
  const RxMarkupDynamicItemsSliver({
    Key? key,
    this.maxMarkupWidth = 700,
    required this.itemHeight,
    this.itemWidth,
  }) : super(key: key);

  final double maxMarkupWidth;
  final double itemHeight;
  final double? itemWidth;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final calculatedItemWidth = itemWidth ?? (min(maxMarkupWidth, screenWidth) / 2) - 10;
    final horizontalPadding = max(10.0, (screenWidth - 2 * calculatedItemWidth) / 2);
    return BlocBuilder<MarkupGeneratorCubit, MarkupGeneratorState>(
      bloc: sl<MarkupGeneratorCubit>(),
      builder: (context, state) {
        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          sliver: SliverGrid.builder(
            itemCount: state.items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: calculatedItemWidth / itemHeight,
            ),
            itemBuilder: (context, index) {
              return MarkupItem(
                itemData: state.items[index],
                height: itemHeight,
              );
            },
          ),
        );
      },
    );
  }
}
