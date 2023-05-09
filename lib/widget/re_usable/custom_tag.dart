import 'package:flutter/material.dart';

///  Created by youssouphafaye on 10/14/22.
class CustomTag extends StatelessWidget {
  final List<Widget> children;
  final Color backgroundColor;

  const CustomTag({
    Key? key,
    required this.backgroundColor,
    required this.children
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: backgroundColor,borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: children ,
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
