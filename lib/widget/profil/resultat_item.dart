import 'package:flutter/material.dart';

///  Created by youssouphafaye on 10/30/22.
class ResultatItem extends StatelessWidget {
  final String text ;
  final String resultat;
  const ResultatItem({required this.text,required this.resultat,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        Text(resultat,style: const TextStyle(fontSize: 18,color: Colors.grey),)
      ],
    );
  }
}
