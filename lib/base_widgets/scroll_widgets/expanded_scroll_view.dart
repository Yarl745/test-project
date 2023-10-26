import 'package:flutter/material.dart';

class ExpandedScrollView extends StatelessWidget {
  const ExpandedScrollView({
    Key? key,
    required this.child,
    this.physics,
    this.hasScrollBody = false,
  }) : super(key: key);

  final Widget child;
  final ScrollPhysics? physics;
  final bool hasScrollBody;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: false,
      physics: physics,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: hasScrollBody,
          child: child,
        ),
      ],
    );
  }
}
