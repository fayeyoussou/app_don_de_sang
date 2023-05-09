import 'package:bda_app/config/custom_route.dart';
import 'package:bda_app/providers/Authentification.dart';
import 'package:bda_app/providers/active_screen_provider.dart';
import 'package:bda_app/providers/list_article_provider.dart';
import 'package:bda_app/providers/login_screen_provider.dart';
import 'package:bda_app/providers/menu_provider.dart';
import 'package:bda_app/providers/profil_provider.dart';
import 'package:bda_app/screens/article/article_screen.dart';
import 'package:bda_app/screens/auth/accueil_auth.dart';
import 'package:bda_app/screens/article/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context)=>Authentification()),
        ChangeNotifierProvider(create: (BuildContext context)=>ListArticleProvider()),
        ChangeNotifierProvider(create: (BuildContext context)=>LoginScreenProvider()),
        ChangeNotifierProvider(create: (BuildContext context)=>MenuProvider()),
        ChangeNotifierProvider(create: (BuildContext context)=>ActiveScreenProvider()),

        // ChangeNotifierProxyProvider<Authentification,MenuProvider>(
        //   create: (BuildContext context)=>MenuProvider(roles: [], isAuth: false, value: 0),
        //   update: ( ctx ,auth,previousMenu)=>MenuProvider(roles: auth.roles, isAuth: auth.isAuth, value: previousMenu!.value),
        // )
        ChangeNotifierProxyProvider<Authentification,ProfilProvider>(
            create: (BuildContext context)=>ProfilProvider("", null),
            update: (ctx,auth,previousProfil)=>ProfilProvider(auth.token, previousProfil)
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {TargetPlatform.iOS : CustomPageTransitionBuilder(),TargetPlatform.android:CustomPageTransitionBuilder()}
          ),
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.red,
        ),
        initialRoute: "/",
        routes: {
          MyHomePage.route : (ctx)=> const MyHomePage(),
          ArticleScreen.route : (ctx)=>const ArticleScreen(),
          AccueilAuth.route:(ctx)=>const AccueilAuth()
        },
        navigatorObservers: [NavigationHistoryObserver()],
      ),
    );
  }
}

