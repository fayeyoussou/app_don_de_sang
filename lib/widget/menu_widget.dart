import 'dart:async';

import 'package:bda_app/config/constante.dart';
import 'package:bda_app/providers/Authentification.dart';
import 'package:bda_app/providers/active_screen_provider.dart';
import 'package:bda_app/providers/menu_provider.dart';
import 'package:bda_app/screens/article/my_home_page.dart';
import 'package:bda_app/screens/auth/accueil_auth.dart';
import 'package:bda_app/screens/profil/user_profil_screen.dart';
import 'package:flutter/material.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';
import 'package:provider/provider.dart';

import '../config/custom_route.dart';

///  Created by youssouphafaye on 10/17/22.
class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<Authentification>(context);
    var menu = Provider.of<ActiveScreenProvider>(context);
    auth.tryAutoConnect().then((value) => print("image : ${auth.image}"));
    List<String> roles = auth.roles;
    List<Widget> menuWidget = [];
    List<Widget> menuElement = [];
    String url = "";
   if(auth.image.isEmpty) {
     url = "https://cdn-icons-png.flaticon.com/512/5087/5087579.png";
   } else {
     url = Constante.baseUri+"/file/"+auth.image;
   }
   Uri uri = Uri.parse(url);

    // Adding the user image profil
    if (auth.isAuth) {
      menuWidget.add(
        InkWell(
          onTap: () {},
          child: DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:auth.image.isNotEmpty? NetworkImage(
                      Constante.baseUri+"/file/"+auth.image):const AssetImage("assets/images/connect.png") as ImageProvider,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  auth.nom,
                  maxLines: 1,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      menuWidget.add(
        InkWell(
          onTap:ModalRoute.of(context)?.settings.name == AccueilAuth.route? null :() {
            Provider.of<MenuProvider>(context,listen: false).close();
            Timer(const Duration(milliseconds: 500), (){
              menu.active = "/active";
              Navigator.of(context).pushAndRemoveUntil(CustomRoute(
                builder: (context)=>const AccueilAuth(), ), (Route<dynamic> route) => false);
            }
            );
          },
          child: DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      "assets/images/connect.png"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Se connecter",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      );

    }
    // adding the home page
    if(menu.activePage != MyHomePage.route) {
      menuElement.add(ListTile(
      onTap:
           () {
        Provider.of<MenuProvider>(context,listen: false).close();
        Timer(const Duration(milliseconds: 500), (){
          menu.active = MyHomePage.route;
          Navigator.of(context).pushAndRemoveUntil(CustomRoute(
            builder: (context)=>const MyHomePage(), ), (Route<dynamic> route) => false);
        }
        );
            },
      leading: const Icon(
        Icons.home,
        color: Colors.white,
      ),
      title: const Text(
        "Home",
        style: TextStyle(color: Colors.white),
      ),
    ));
    }
    if(auth.isAuth && menu.activePage != UserProfilScreen.route){
      menuElement.add(
          ListTile(
            onTap: () {
              Provider.of<MenuProvider>(context,listen: false).close();
              Timer(const Duration(milliseconds: 500), (){
                menu.active = UserProfilScreen.route;
                Navigator.of(context).pushAndRemoveUntil(CustomRoute(
                  builder: (context)=>const UserProfilScreen(), ), (Route<dynamic> route) => false);
              }
              );
            },
            leading: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: const Text(
              "Profil",
              style: TextStyle(color: Colors.white),
            ),
          )
      );
    }
    // ajoute le bouton gestion des utilisateur si l'utilisateur est admin
    if (auth.isAuth && auth.roles.map((e) => e.toLowerCase()).toList().contains("admin")) {
      menuElement.add(ListTile(
        onTap: ModalRoute.of(context)?.settings.name == "/"
            ? null
            : () {
                Navigator.of(context).pushReplacementNamed(MyHomePage.route);
              },
        leading: const Icon(
          Icons.person_add,
          color: Colors.white,
        ),
        title: const Text(
          "gestion user",
          style: TextStyle(color: Colors.white),
        ),
      ));
    }
    // adding logout button to the menu element
    // if user is authenticated
    if (auth.isAuth) {
      menuElement.add(ListTile(
        onTap: () {
          auth.logout();
        },
        leading: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
        title: const Text(
          "logout",
          style: TextStyle(color: Colors.white),
        ),
      ));
    }


    // ajouter les elements du menu au menuWidget
    menuWidget.add(Expanded(
      child: ListView(
        children: menuElement,
      ),
    ));

    return SafeArea(
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: menuWidget,
        ),
      ),
    );
  }
}
