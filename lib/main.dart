import 'package:bda_app/config/constante.dart';
import 'package:bda_app/providers/list_article_provider.dart';
import 'package:bda_app/screens/article_screen.dart';
import 'package:bda_app/screens/main_page.dart';
import 'package:bda_app/widget/list_article.dart';
import 'package:flutter/material.dart';
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
        ChangeNotifierProvider(create: (BuildContext context)=>ListArticleProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
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
          MainPage.route : (ctx)=>const MainPage(),
          ArticleScreen.route : (ctx)=>ArticleScreen(),
        },
      ),
    );
  }
}

