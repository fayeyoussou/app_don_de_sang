import 'package:flutter/material.dart';

///  Created by youssouphafaye on 10/13/22.
class ImageContainer extends StatelessWidget {
  const ImageContainer({
    this.height = 125,
    this.borderRadius,
    required this.width,
    required this.imageUrl,
    this.padding,
    this.margin,
    this.child,
    Key? key,
  }) : super(key: key);
  final double width;
  final double height;
  final String imageUrl;
  final EdgeInsets ? padding;
  final EdgeInsets ? margin;
  final BorderRadius? borderRadius;
  final Widget ? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: borderRadius,
          image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover
          )
      ),
    );
  }
}

