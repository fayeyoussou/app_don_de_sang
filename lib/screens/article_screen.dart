import 'package:bda_app/model/article.dart';
import 'package:bda_app/providers/list_article_provider.dart';
import 'package:bda_app/widget/corp_article_widget.dart';
import 'package:bda_app/widget/entete_widget.dart';
import 'package:bda_app/widget/image_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/constante.dart';

///  Created by youssouphafaye on 10/17/22.
class ArticleScreen extends StatelessWidget {
  static String route = "/article";
  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;
    Provider.of<ListArticleProvider>(context,listen: false).addVues(article.id as int);
    return ImageContainer(
        width: double.infinity,
        imageUrl: article.image,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: const IconThemeData(
                color : Constante.accent,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: ListView(
            children: [
              EnteteWidget(article: article),
              CorpArticleWidget(article: article)
            ],
          ),
        ),
    );
  }
}
