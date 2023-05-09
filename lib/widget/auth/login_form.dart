import 'package:bda_app/config/custom_route.dart';
import 'package:bda_app/config/helper.dart';
import 'package:bda_app/model/login_Info.dart';
import 'package:bda_app/providers/Authentification.dart';
import 'package:bda_app/providers/login_screen_provider.dart';
import 'package:bda_app/screens/auth/register_screen.dart';
import 'package:bda_app/widget/auth/auth_head.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/constante.dart';
import '../../screens/article/my_home_page.dart';

///  Created by youssouphafaye on 10/18/22.
class LoginForm extends StatefulWidget {
  const LoginForm({required Key key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _loginKey = GlobalKey();
  String _passError = "";
  String _loginError = "";
  final LoginInfo _loginInfo = LoginInfo();
  _submit() {
    _loginKey.currentState!.save();
    _loginInfo.clean();
    var errPass = Helper.verifyPassword(_loginInfo.password);
    var errLog = Helper.verifyLogin(_loginInfo.login);
    if (errPass.isNotEmpty || errLog.isNotEmpty) {
      setState(() {
        _loginError = errLog;
        _passError = errPass;
      });
    }
    var res = Provider.of<Authentification>(context, listen: false);
    res
        .sAuthentifier(
            _loginInfo.login as String, _loginInfo.password as String)
        .then((value) {
      if (value["status"]) {
        Navigator.of(context).pushAndRemoveUntil(
            CustomRoute(builder: (context) => MyHomePage()), (route) => false);
      } else {
        var res = value['result'] as Map<String, dynamic>;
        setState(() {
          if (res.containsKey("login")) _loginError = res["login"] as String;
          if (res.containsKey("password")) {
            _passError = res["password"] as String;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Form(
      key: _loginKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const AuthHead(title: "connexion"),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Constante.tertiary.withAlpha(200),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 10,
                      color: Constante.accent.withAlpha(200)),
                ],
              ),
              alignment: Alignment.center,
              // =================
              // Login field here
              child: TextFormField(
                onChanged: (value) {
                  if (_loginError.isNotEmpty) {
                    setState(() {
                      _loginError = "";
                    });
                  }
                },
                onSaved: (value) {
                  _loginInfo.login = value;
                },
                // validator: (value){
                //   if(value!.isEmpty) return "remplir le login";
                //   if(value.length < 5) return "plus de 5 caractères";
                //   if(value.length > 20) return "moins de 20 caractères";
                //   RegExp regex = RegExp(Constante.loginRegex);
                //   if(!regex.hasMatch(value)) return "ne doit contenir de caractère special  a part _ , .,-";
                // },
                cursorColor: Constante.primary,
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.login,
                      color: Constante.accent,
                    ),
                    hintText: "Login / Mail",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            if (_loginError.isNotEmpty)
              Container(
                child: Text(
                  _loginError,
                  style: theme.bodyMedium!.copyWith(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
                ),
                margin: const EdgeInsets.only(top: 20),
              ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Constante.tertiary.withAlpha(200),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 10,
                      color: Constante.accent.withAlpha(200)),
                ],
              ),
              alignment: Alignment.center,
              child: TextFormField(
                onChanged: (value) {
                  if (_passError.isNotEmpty) {
                    setState(() {
                      _passError = "";
                    });
                  }
                },
                obscureText: true,
                cursorColor: Constante.primary,
                onSaved: (value) {
                  _loginInfo.password = value;
                },
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.vpn_key,
                      color: Constante.accent,
                    ),
                    hintText: "mot de passe",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            if (_passError.isNotEmpty)
              Container(
                child: Text(
                  _passError,
                  style: theme.bodyMedium!.copyWith(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
                ),
                margin: const EdgeInsets.only(top: 20),
              ),
            Container(
              margin: const EdgeInsets.only(top: 30, right: 20),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: const Text("Mot De Passe Oublié ?"),
                onTap: () {},
              ),
            ),
            GestureDetector(
              onTap: _submit,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 60),
                padding: const EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                height: 55,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Constante.accent.withAlpha(1000),
                      Constante.accent.withAlpha(400),
                      Constante.accent.withAlpha(350),
                      Constante.accent.withAlpha(60),
                      Constante.tertiary.withAlpha(20),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 10,
                        color: Constante.accent.withAlpha(200)),
                  ],
                ),
                child: const Text(
                  "Se Connecter",
                  style: TextStyle(color: Constante.tertiary),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Pas De Compte ? "),
                  GestureDetector(
                    child: const Text(
                      "s'enregistrer !",
                      style: TextStyle(
                          color: Constante.accent, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          CustomRoute(builder: (ctx) => const RegisterScreen()),
                          (route) => false);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
