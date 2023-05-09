import 'package:bda_app/widget/auth/register_form.dart';
import 'package:flutter/material.dart';
import '../../widget/re_usable/body_template.dart';

///  Created by youssouphafaye on 10/20/22.
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyTemplate(child: RegisterForm(),);
  }
}
