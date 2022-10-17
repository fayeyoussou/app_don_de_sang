import 'package:bda_app/config/constante.dart';
import 'package:bda_app/widget/custom_tag.dart';
import 'package:flutter/material.dart';

import '../model/article.dart';

///  Created by youssouphafaye on 10/17/22.
class EnteteWidget extends StatelessWidget {
  final Article article;
  const EnteteWidget({Key? key,required this.article}) : super(key: key);@override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height*0.15,),
            CustomTag(
                backgroundColor: Constante.accent.withAlpha(150),
                children: [
                  Text(
                    article.type,
                    style: theme.bodySmall!.copyWith(color: Constante.tertiary),
                  )
                ]
            ),
            const SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Constante.primary.withAlpha(180)),
              padding: const EdgeInsets.all(10),
              child: Text(
                article.description,
                style: theme.bodyMedium!.copyWith(color: Constante.tertiary),
              ),
            )
          ],
        ),
    );
  }
}
