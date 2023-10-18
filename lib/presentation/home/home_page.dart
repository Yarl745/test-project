import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:olearistest/base_widgets/images/logo_widget.dart';
import 'package:olearistest/base_widgets/scroll_widgets/expanded_scroll_view.dart';
import 'package:olearistest/core/style/padding_consts.dart';
import 'package:olearistest/features/markup/cubits/markup_generator_cubit/markup_generator_cubit.dart';
import 'package:olearistest/injection_container.dart';
import 'package:olearistest/presentation/home/components/markup_control_app_bar.dart';
import 'package:olearistest/presentation/home/components/rx_markup_dynamic_items_wrap.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void onPlusTap() => sl<MarkupGeneratorCubit>().addMarkupItem();

  void onMinusTap() => sl<MarkupGeneratorCubit>().removeMarkupItem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MarkupControlAppBar(onPlusTap: onPlusTap, onMinusTap: onMinusTap),
      body: const KeyboardDismissOnTap(
        child: ExpandedScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              Padding(
                padding: CPadding.all30,
                child: LogoWidget(maxWidth: 375, withBorders: true),
              ),
              Spacer(),
              RxMarkupDynamicItemsWrap(maxMarkupWidth: 700),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
