import 'package:bda_app/screens/article_screen.dart';
import 'package:flutter/material.dart';

import '../config/constante.dart';
import '../model/article.dart';
import 'image_container.dart';

///  Created by youssouphafaye on 10/16/22.
class CarouselItem extends StatelessWidget {
  const CarouselItem({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(ArticleScreen.route,arguments: article);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageContainer(
            width: MediaQuery.of(context).size.width * 0.5,
            imageUrl: article.image,
            borderRadius: BorderRadius.circular(20),
          ),
          const SizedBox(height: 10,),
          Text(article.titre,maxLines: 2,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              height: 1.5
          ),),
          const SizedBox(height: 5,),
          Text(article.duration,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Constante.accent.withAlpha(500)),),
          const SizedBox(height: 5,),
          Text(article.auteur,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Constante.accent.withAlpha(500)),),
        ],
      ),
    );
  }
}
