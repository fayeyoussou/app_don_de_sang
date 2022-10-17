import 'package:bda_app/config/constante.dart';
import 'package:bda_app/model/article.dart';
import 'package:bda_app/screens/article_screen.dart';
import 'package:bda_app/widget/custom_tag.dart';
import 'package:bda_app/widget/image_container.dart';
import 'package:flutter/material.dart';

///  Created by youssouphafaye on 10/16/22.
class LastNews extends StatelessWidget {
  const LastNews(this.article);
  final Article article;
  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      padding: const EdgeInsets.all(14),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      imageUrl: article.image,
      borderRadius: BorderRadius.circular(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTag(
              backgroundColor: Constante.accent.withAlpha(200),
              children: [
                Text(
                  article.type + " du jour",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Constante.tertiary),
                )
              ]),
          const SizedBox(
            height: 15,
          ),
          Text(
            article.titre,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold, height: 1.25),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ArticleScreen.route,arguments: article);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("En Savoir plus",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Constante.tertiary
                  ),),
                  const SizedBox(width: 10,),
                  const Icon(Icons.arrow_right_alt,color: Constante.accent,)
                ],
              ))
        ],
      ),
    );
  }
}
