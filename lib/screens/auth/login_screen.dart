
import 'package:bda_app/widget/auth/login_form.dart';
import 'package:bda_app/widget/re_usable/body_template.dart';
import 'package:flutter/material.dart';


///  Created by youssouphafaye on 10/18/22.
// class LoginPage extends StatefulWidget {
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

class LoginScreen extends StatelessWidget {


  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyTemplate(child: LoginForm(key: UniqueKey(),));
  }
}
