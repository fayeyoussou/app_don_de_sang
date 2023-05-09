import 'package:bda_app/screens/article/main_page.dart';
import 'package:bda_app/widget/re_usable/body_template.dart';
import 'package:flutter/material.dart';


///  Created by youssouphafaye on 10/17/22.
class MyHomePage extends StatefulWidget {
  static String route = "/";

  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return const BodyTemplate(child: MainPage(),);
  }
}

