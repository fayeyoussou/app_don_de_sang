import 'package:bda_app/model/article.dart';
import 'package:bda_app/screens/article/article_screen.dart';
import 'package:bda_app/widget/re_usable/image_container.dart';
import 'package:flutter/material.dart';

///  Created by youssouphafaye on 10/16/22.
class CategorieArticleItem extends StatelessWidget {
  final Article article;

  const CategorieArticleItem({Key? key,required this.article}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.5,
      margin: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(ArticleScreen.route,arguments: article);
        },
        child: Row(

          children: [
            ImageContainer(
              width: size.width*0.5,
              imageUrl: article.image,
              borderRadius: BorderRadius.circular(20),
            ),
            const SizedBox(width: 15,),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(article.titre,
                  style: Theme.of(context).textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold,height: 1.5),
                  maxLines: 2,
                ),
                const SizedBox(height: 10,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const Icon(Icons.schedule,size: 18,),
                      const SizedBox(width: 5,),
                      Text(article.duration,style: const TextStyle(fontSize: 12),),
                      const SizedBox(width: 20,),
                      const Icon(
                        Icons.visibility,
                        size: 18,
                      ),
                      Text("${article.vues} vues",style: TextStyle(fontSize: 12),),
                    ],
                  ),
                )
              ],
            ))


          ],
        ),
      ),
    );
  }
}
