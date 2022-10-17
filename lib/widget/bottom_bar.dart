import 'package:bda_app/widget/bnb_custom_painter.dart';
import 'package:bda_app/config/constante.dart';
import 'package:flutter/material.dart';

///  Created by youssouphafaye on 10/12/22.
class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Positioned(
      bottom:0,
      left : 0,
      child:Container(
        width: size.width,
        height: 80,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size.width,80),
              painter: BnbCustomPainter(),
            ),
            Center(
              heightFactor: 0.6,
              child: FloatingActionButton(
                onPressed: (){},
                backgroundColor: Constante.secondary,
                child: const Icon(Icons.article),elevation: 0.1,
              ),
            ),
            Container(
              width: size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.home)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.restaurant)),
                  Container(width: size.width*0.20,),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.notifications)),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}