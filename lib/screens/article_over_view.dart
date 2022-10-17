import 'package:bda_app/model/article.dart';
import 'package:bda_app/providers/list_article_provider.dart';
import 'package:bda_app/widget/carousel_widget.dart';
import 'package:bda_app/widget/image_container.dart';
import 'package:bda_app/widget/last_news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///  Created by youssouphafaye on 10/16/22.
class ArticleOverView extends StatelessWidget {
  const ArticleOverView({required Key key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    var listArticle = Provider.of<ListArticleProvider>(context);
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        LastNews(listArticle.lastImportant),
        CarouselWidget(articles: listArticle.list)
      ],
    );
  }
}
