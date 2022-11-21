import 'package:flutter/material.dart';

class ContainerContainImage extends StatelessWidget {
  const ContainerContainImage({
    Key? key,
    required this.width,
    this.height = 125,
    required this.imageUrl,
    this.child,
    required this.borderRadius,
  }) : super(key: key);

  final double width;
  final double height;
  final String? imageUrl;
  final Widget? child;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: DecorationImage(
          image: NetworkImage(imageUrl ??
              'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
