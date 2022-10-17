import 'package:flutter/material.dart';

///  Created by youssouphafaye on 10/16/22.
class OtherScreen extends StatelessWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.amber,
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: const DecorationImage(
              image: NetworkImage("http://127.0.0.1:8080/api/file/tad1fbhq"),
              fit: BoxFit.contain
            )
          ),
        ),
      ),
    );
  }
}
