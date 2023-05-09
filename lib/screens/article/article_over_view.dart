import 'package:bda_app/providers/list_article_provider.dart';
import 'package:bda_app/widget/home/carousel_widget.dart';
import 'package:bda_app/widget/home/last_news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/constante.dart';

///  Created by youssouphafaye on 10/16/22.
class ArticleOverView extends StatelessWidget {
  const ArticleOverView({required Key key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    var listArticle = Provider.of<ListArticleProvider>(context);
    return Container(
      decoration: const BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          LastNews(listArticle.lastImportant),
          CarouselWidget(articles: listArticle.list)
        ],
      ),
    );
  }
}
