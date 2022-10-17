import 'package:flutter/material.dart';

///  Created by youssouphafaye on 10/14/22.
class DiscoverNewsWidget extends StatelessWidget {
  const DiscoverNewsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Découvrir',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Actualité général du CNTS",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Recherche",
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const RotatedBox(
                      quarterTurns: 1, child: Icon(Icons.tune)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none)),
            )
          ]),
    );
  }
}
