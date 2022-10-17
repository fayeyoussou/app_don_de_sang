import 'package:bda_app/config/constante.dart';
import 'package:flutter/material.dart';

///  Created by youssouphafaye on 10/16/22.
class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width*0.5,
          height: MediaQuery.of(context).size.width*0.5,
          child: const CircularProgressIndicator(
            strokeWidth: 8  ,
            semanticsLabel: "Loading",
            semanticsValue: "Loading",
            color: Constante.primary,
          ),
        ),
        const SizedBox(height: 40,),
        Text("Chargement",style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Constante.primary),)
      ],
    ));
  }
}
