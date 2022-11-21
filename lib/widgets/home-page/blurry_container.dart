import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class BlurryContainer extends StatelessWidget {
  const BlurryContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: child,
    ).asGlass(
      clipBorderRadius: BorderRadius.circular(20),
      blurX: 4,
      blurY: 2,
    );
  }
}
