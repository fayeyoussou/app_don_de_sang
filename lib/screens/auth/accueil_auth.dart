import 'dart:async';

import 'package:bda_app/widget/re_usable/body_template.dart';
import 'package:bda_app/widget/re_usable/full_screen_logo.dart';
import 'package:flutter/material.dart';

import '../../config/custom_route.dart';
import 'login_screen.dart';
///  Created by youssouphafaye on 10/18/22.
class AccueilAuth extends StatefulWidget {
  static String route = "/login";

  const AccueilAuth({Key? key}) : super(key: key);

  @override
  State<AccueilAuth> createState() => _AccueilAuthState();
}

class _AccueilAuthState extends State<AccueilAuth> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }
  startTimer() async{
    var duration = const Duration(seconds: 1,milliseconds: 800);
    return Timer(duration, loginRoute);
  }

  loginRoute(){
    Navigator.of(context).pushReplacement(CustomRoute(
      builder: (context)=>const LoginScreen(), ));
  }
  @override
  Widget build(BuildContext context) {
    return const BodyTemplate(child: FullScreenLogo());
  }
}
