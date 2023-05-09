import 'package:bda_app/config/constante.dart';
import 'package:bda_app/model/article.dart';
import 'package:bda_app/widget/re_usable/custom_tag.dart';
import 'package:flutter/material.dart';

///  Created by youssouphafaye on 10/17/22.
class CorpArticleWidget extends StatelessWidget {
  final Article article;
  const CorpArticleWidget({Key? key,required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var widgets = [...article.sections.map((e) => [Text(e.titre,style: textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),),Text(e.contenu,style: textTheme.bodyMedium,)])];
    List<Widget> widget = [];
    for (var element in widgets) {
      widget.add(element[0]);
      widget.add(const SizedBox(height: 10,));
      widget.add(element[1]);
      widget.add(const SizedBox(height: 20,));
    }
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color:Constante.tertiary,borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CustomTag(
                    backgroundColor: Constante.accent,
                    children: [
                      CircleAvatar(radius: 10,backgroundImage: NetworkImage(article.auteurImage),),
                      const SizedBox(width: 10,),
                      Text(article.auteur,style: textTheme.bodyMedium!.copyWith(color: Constante.tertiary),)
                    ]
                ),
                const SizedBox(width: 10,),
                CustomTag(
                    backgroundColor: Constante.primary.withAlpha(150),
                    children:  [
                      const Icon(Icons.timer,color: Constante.secondary,),
                      const SizedBox(width: 10,),
                      Text(article.duration,style: textTheme.bodyMedium,)
                    ]),
                const SizedBox(width: 10,),
                CustomTag(
                    backgroundColor: Constante.secondary.withAlpha(200),
                    children: [
                      const Icon(Icons.remove_red_eye,color: Constante.primary,),
                      const SizedBox(width: 10,),
                      Text(
                        article.vues.toString(),
                        style: textTheme.bodyMedium,
                      )
                ])
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Text(article.titre,style: textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold)),
          ...widget
        ],
      ),
    );
  }
}
