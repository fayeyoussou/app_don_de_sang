import 'package:bda_app/model/article.dart';
import 'package:bda_app/providers/list_article_provider.dart';
import 'package:bda_app/widget/categorie_article_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/constante.dart';

///  Created by youssouphafaye on 10/16/22.
class CategoryArticleWidget extends StatelessWidget {
  final List<String> tabs;

  const CategoryArticleWidget({Key? key, required this.tabs}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Article> articles = Provider.of<ListArticleProvider>(context).list;
    return Column(
      children: [
        TabBar(
          tabs: tabs
              .map((e) => Tab(
                    icon: Text(
                      e,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ))
              .toList(),
          isScrollable: true,
          indicatorColor: Constante.accent,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
              children: tabs.map((e) {
            List<Article> filtree = articles
                .where(
                    (element) => element.type.toLowerCase() == e.toLowerCase())
                .toList();
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) => CategorieArticleItem(
                article: filtree[index],
                key: ValueKey(filtree[index].id),
              ),
              itemCount: filtree.length,
              shrinkWrap: true,
            );
          }).toList()),
        )
      ],
    );
  }
}
