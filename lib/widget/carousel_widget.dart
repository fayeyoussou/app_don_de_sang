import 'package:bda_app/config/constante.dart';
import 'package:bda_app/model/article.dart';
import 'package:bda_app/widget/image_container.dart';
import 'package:flutter/material.dart';

import 'carousel_item.dart';

///  Created by youssouphafaye on 10/16/22.
class CarouselWidget extends StatelessWidget {
  final List<Article> articles;

  const CarouselWidget({Key? key, required this.articles}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Articles",style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),),
              
            ],
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)=>Container(
              width: MediaQuery.of(context).size.width * 0.4,
              margin: const EdgeInsets.only(right: 12),
              child: CarouselItem(article: articles[index]),
            ),itemCount: articles.length,),
          )
        ],
      ),
    );
  }
}

