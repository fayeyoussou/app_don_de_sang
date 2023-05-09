import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/constante.dart';
import '../../providers/menu_provider.dart';
import '../menu_widget.dart';

///  Created by youssouphafaye on 10/20/22.
class BodyTemplate extends StatelessWidget {
  const BodyTemplate({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    double value = Provider.of<MenuProvider>(context).value;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topLeft,
                    colors: [
                      Constante.accent.withAlpha(1000),
                      Constante.accent.withAlpha(400),
                      Constante.accent.withAlpha(200)
                    ])),
          ),
          const MenuWidget(),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0,end: value),
              duration: const Duration(milliseconds: 450),
              builder: (_,double val,__){
                return(
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..setEntry(0, 3, 200*val)
                        ..rotateY((pi/6)*val),
                      child:  AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: ClipRect(
                          clipBehavior: Clip.antiAlias,
                          child: Scaffold(
                            appBar: AppBar(
                              leading: IconButton(
                                icon: const Icon(
                                  Icons.menu,
                                  color: Constante.tertiary,
                                ),
                                onPressed: () {
                                  Provider.of<MenuProvider>(context, listen: false).toggleMenu();
                                },
                              ),
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                            extendBody: true,
                            extendBodyBehindAppBar: true,
                            body: child,
                            // AnimatedSwitcher(
                            //     transitionBuilder: (Widget child,Animation<double> animation)=>ScaleTransition(scale: animation,child: child,),
                            //     duration: const Duration(milliseconds: 500),
                            //     child: showLogin ? login : register
                            // ),
                          ),
                        ),
                      ),
                    )
                );
              }),
          // onTap: (){
          //   setState(() {
          //     value ==0 ? value=1 : value = 0;
          //   });
          // },

        ],
      ),
    );
  }
}
