import 'dart:async';

import 'package:bda_app/model/Don.dart';
import 'package:bda_app/model/Resultat.dart';
import 'package:bda_app/widget/profil/resultat_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///  Created by youssouphafaye on 10/30/22.
class DonWidget extends StatefulWidget {
  final Don don;
  const DonWidget({required this.don,Key? key}) : super(key: key);

  @override
  _DonWidgetState createState() => _DonWidgetState();
}

class _DonWidgetState extends State<DonWidget> {
  double _height = 95;
  var _firstBuild = true;
  var _expanded = false;


  @override
  Widget build(BuildContext context) {

    final Resultat? _resultat = widget.don.resultat;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _expanded ? 230 :_height,
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(child: Text("O+"),),
              title: Text(widget.don.numero),
              subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.don.date)),
              trailing: widget.don.result ? IconButton(onPressed: (){
                setState(() {
                  _expanded = !_expanded;
                });
              }, icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more)):null,
            ),
            if(_resultat != null)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 4),
                height: _expanded? 130:0,
                child: ListView(
                  children: [
                    ResultatItem(text: "VIH 1", resultat: _resultat.vih1),
                    ResultatItem(text: "VIH 2", resultat: _resultat.vih2),
                    ResultatItem(text: "Syphilis", resultat: _resultat.siphylis),
                    ResultatItem(text: "Hépatite B", resultat: _resultat.hepatiteB),
                    ResultatItem(text: "Hépatite C", resultat: _resultat.hepatiteC),
                    ResultatItem(text: "Nat", resultat: _resultat.natTest),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}