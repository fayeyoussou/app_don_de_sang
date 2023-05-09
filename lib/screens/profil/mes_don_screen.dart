import 'package:bda_app/model/Don.dart';
import 'package:bda_app/providers/profil_provider.dart';
import 'package:bda_app/widget/profil/don_widget.dart';
import 'package:bda_app/widget/re_usable/body_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/constante.dart';

///  Created by youssouphafaye on 10/22/22.
class MesDonScreen extends StatelessWidget {
  const MesDonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Don> dons = Provider.of<ProfilProvider>(context,listen: false).mesDons;
    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Constante.accent.withAlpha(1000),
                Constante.accent.withAlpha(400),
                Constante.accent.withAlpha(350),
                Constante.accent.withAlpha(60),
                Constante.tertiary.withAlpha(20),
              ]),
        ),
        child: ListView.builder(itemBuilder: (ctx,i)=>DonWidget(don: dons[i]),itemCount: dons.length,));
  }
}
