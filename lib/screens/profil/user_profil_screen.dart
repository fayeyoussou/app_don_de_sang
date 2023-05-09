import 'package:bda_app/screens/profil/main_profil_screen.dart';
import 'package:bda_app/screens/profil/mes_don_screen.dart';
import 'package:bda_app/widget/nav_bar.dart';
import 'package:bda_app/widget/re_usable/body_template.dart';
import 'package:flutter/material.dart';

///  Created by youssouphafaye on 10/22/22.
class UserProfilScreen extends StatefulWidget {
  static String route = "/profil";
  const UserProfilScreen({Key? key}) : super(key: key);

  @override
  State<UserProfilScreen> createState() => _UserProfilScreenState();
}

class _UserProfilScreenState extends State<UserProfilScreen> {
  int _index = 0;
  List<Widget> widgets = [
    MainProfilScreen(
      key: UniqueKey(),
    ),
    MesDonScreen(
      key: UniqueKey(),
    )
  ];
  void switchTab(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: NavBar(
          icons: const [Icon(Icons.person), Icon(Icons.invert_colors)],
          whenTap: switchTab,
        ),
        body: BodyTemplate(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) =>
                ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: widgets[_index],
          ),
        ),
      ),
    );
  }
}
