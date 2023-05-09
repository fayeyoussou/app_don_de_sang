import 'package:flutter/material.dart';

import '../../config/constante.dart';

///  Created by youssouphafaye on 10/20/22.
class FullScreenLogo extends StatelessWidget {
  const FullScreenLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Constante.secondary,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Constante.accent.withAlpha(1000),
                        Constante.accent.withAlpha(300),
                        Constante.tertiary.withAlpha(300),

                      ]
                  )
              ),
            ),
            Center(
              child: Hero(tag: "my_logo",
                  child: Image.asset("assets/images/bda_logo.png")
              ),
            )
          ],
        ),
        // AnimatedSwitcher(
        //     transitionBuilder: (Widget child,Animation<double> animation)=>ScaleTransition(scale: animation,child: child,),
        //     duration: const Duration(milliseconds: 500),
        //     child: showLogin ? login : register
        // ),
      ),
    );
  }
}
