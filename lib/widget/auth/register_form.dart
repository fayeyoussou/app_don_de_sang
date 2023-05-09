import 'dart:io';

import 'package:bda_app/model/register_info.dart';
import 'package:bda_app/providers/Authentification.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../config/constante.dart';
import '../../config/custom_route.dart';
import '../../config/helper.dart';
import '../../screens/auth/login_screen.dart';

///  Created by youssouphafaye on 10/21/22.
class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _registerKey = GlobalKey();
  final RegisterInfo _info = RegisterInfo();
  final RegisterInfo _error = RegisterInfo();
  Future<void> _loadImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 50);
    if(image!=null){
      setState(() {
        _info.image = File(image.path);
      });
    }
  }
  Future<void> _submit() async {
    _registerKey.currentState!.save();
    _info.clean();
    String login = Helper.verifyLogin(_info.login);
    String prenom = Helper.verifyPrenom(_info.prenom);
    String nom = Helper.verifyPrenom(_info.nom);
    String cin = Helper.verifyCin(_info.cin);
    String email = Helper.verifyEmail(_info.email);
    String telephone = Helper.verifyTel(_info.telephone);
    bool exist =_info.image ==null ? false : await _info.image!.exists();
    if(_info.image ==null || !exist) login = "choisir une image en cliquant sur le logo en haut" ;
    bool havError = login.isNotEmpty || prenom.isNotEmpty || cin.isNotEmpty || email.isNotEmpty|| telephone.isNotEmpty;
    if(havError){
      setState(() {
        _error.login = login;
        _error.prenom = prenom;
        _error.nom =nom;
        _error.cin = cin;
        _error.email = email;
        _error.telephone = telephone;
      });
    }
    var res = Provider.of<Authentification>(context,listen: false).register(_info);
  }

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Form(
      key: _registerKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                      child: InkWell(
                        onTap: _loadImage,
                        child: _info.image!=null && _info.image!.path.isNotEmpty?
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: FileImage(_info.image!),
                              )
                        :Hero(
                          tag: "my_logo",
                          child: Image.asset(
                            "assets/images/bda_logo.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      height: 90,
                      width: 90,
                    ),
                    const Text(
                      "s'inscrire",
                      style: TextStyle(
                          fontSize: 20,
                          color: Constante.accent,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "cliquez sur le logo pour charger votre photo profil",
                      style: TextStyle(
                          fontSize: 13,
                          color: Constante.accent,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

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
                  if (_error.prenom.isNotEmpty) {
                    setState(() {
                      _error.prenom = "";
                    });
                  }
                },
                onSaved: (value) {
                  _info.prenom = value!;
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
                      Icons.person,
                      color: Constante.accent,
                    ),
                    hintText: "Prenom",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            if (_error.prenom.isNotEmpty)
              Container(
                child: Text(
                  _error.prenom,
                  style: theme.bodyMedium!.copyWith(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
                ),
                margin: const EdgeInsets.only(top: 20),
              ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                  if (_error.nom.isNotEmpty) {
                    setState(() {
                      _error.nom = "";
                    });
                  }
                },
                onSaved: (value) {
                  _info.nom = value!;
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
                      Icons.person,
                      color: Constante.accent,
                    ),
                    hintText: "Nom",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            if (_error.nom.isNotEmpty)
              Container(
                child: Text(
                  _error.nom,
                  style: theme.bodyMedium!.copyWith(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
                ),
                margin: const EdgeInsets.only(top: 20),
              ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  if (_error.telephone.isNotEmpty) {
                    setState(() {
                      _error.telephone = "";
                    });
                  }
                },
                onSaved: (value) {
                  _info.telephone = value!;
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
                      Icons.phone,
                      color: Constante.accent,
                    ),
                    hintText: "telephone",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            if (_error.telephone.isNotEmpty)
              Container(
                child: Text(
                  _error.telephone,
                  style: theme.bodyMedium!.copyWith(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
                ),
                margin: const EdgeInsets.only(top: 20),
              ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (_error.cin.isNotEmpty) {
                    setState(() {
                      _error.cin = "";
                    });
                  }
                },
                onSaved: (value) {
                  _info.cin = value!;
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
                      Icons.credit_card,
                      color: Constante.accent,
                    ),
                    hintText: "numéro carte d'identite",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            if (_error.cin.isNotEmpty)
              Container(
                child: Text(
                  _error.cin,
                  style: theme.bodyMedium!.copyWith(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
                ),
                margin: const EdgeInsets.only(top: 20),
              ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  if (_error.email.isNotEmpty) {
                    setState(() {
                      _error.email = "";
                    });
                  }
                },
                onSaved: (value) {
                  _info.email = value!;
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
                      Icons.email,
                      color: Constante.accent,
                    ),
                    hintText: "email",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            if (_error.email.isNotEmpty)
              Container(
                child: Text(
                  _error.email,
                  style: theme.bodyMedium!.copyWith(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
                ),
                margin: const EdgeInsets.only(top: 20),
              ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                  if (_error.login.isNotEmpty) {
                    setState(() {
                      _error.login = "";
                    });
                  }
                },
                onSaved: (value) {
                  _info.login = value!;
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
                    hintText: "Login",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            if (_error.login.isNotEmpty)
              Container(
                child: Text(
                  _error.login,
                  style: theme.bodyMedium!.copyWith(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
                ),
                margin: const EdgeInsets.only(top: 20),
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
                  const Text("Deja un compte? "),
                  GestureDetector(
                    child: const Text(
                      "se connecter",
                      style: TextStyle(
                          color: Constante.accent, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          CustomRoute(builder: (ctx) => const LoginScreen()),
                              (route) => false);
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 120,)
          ],
        ),
      ),
    );
  }
}