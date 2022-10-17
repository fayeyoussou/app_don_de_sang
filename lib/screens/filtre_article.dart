import 'package:bda_app/widget/category_article_widget.dart';
import 'package:bda_app/widget/discover_news_widget.dart';
import 'package:flutter/material.dart';

///  Created by youssouphafaye on 10/16/22.
class FiltreArticle extends StatelessWidget {
  List<String> tabs = ["Alerte","Annonce","Sensibilisation","Autre","Journee"];

  FiltreArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
        length: tabs.length, child: ListView(
      padding: EdgeInsets.all(20),
      children: [
        const DiscoverNewsWidget(),
        CategoryArticleWidget(tabs: tabs)
      ],
    ),
    );
  }
}
