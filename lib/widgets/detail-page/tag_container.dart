import 'package:flutter/material.dart';

class TagContainer extends StatelessWidget {
  const TagContainer({
    Key? key,
    required this.bgColor,
    required this.child,
  }) : super(key: key);
  final Color bgColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(20)),
      child: child,
    );
  }
}
