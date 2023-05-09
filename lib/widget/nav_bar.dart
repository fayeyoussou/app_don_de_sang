import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../config/constante.dart';

///  Created by youssouphafaye on 10/12/22.
class NavBar extends StatelessWidget {
  final List<Widget> icons;
  final void Function(int) whenTap;
  final int index;
  const NavBar({Key? key, required this.icons, required this.whenTap,this.index=0 }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: const IconThemeData(color: Constante.secondary)
      ),
      child: CurvedNavigationBar(
        height: 60,
        buttonBackgroundColor: Constante.accent,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: const Duration(milliseconds: 600),
        items: icons,
        onTap: whenTap,
        index: index,
        color: Constante.primary,
        backgroundColor: Colors.transparent,),
    );
  }
}
