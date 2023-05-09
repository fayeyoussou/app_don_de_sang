import 'package:flutter/material.dart';

import '../../config/constante.dart';

///  Created by youssouphafaye on 10/20/22.
class AuthHead extends StatelessWidget {
  final String title;

  const AuthHead({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(90),
        ),
        color: Constante.primary,
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Constante.accent.withAlpha(1000),
              Constante.accent.withAlpha(400),
              Constante.accent.withAlpha(350),
              Constante.accent.withAlpha(60),
              Constante.tertiary.withAlpha(20),
            ]),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Hero(
                tag: "my_logo",
                child: Image.asset(
                  "assets/images/bda_logo.png",
                  fit: BoxFit.contain,
                ),
              ),
              height: 90,
              width: 90,
            ),
             Text(
              title,
              style: const TextStyle(
                  fontSize: 20,
                  color: Constante.accent,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
