import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/constante.dart';
import '../../providers/profil_provider.dart';

///  Created by youssouphafaye on 10/27/22.
class MainProfilScreen extends StatelessWidget {
  const MainProfilScreen({Key? key}) : super(key: key);

  void _loadImage() {}
  @override
  Widget build(BuildContext context) {
    var profil = Provider.of<ProfilProvider>(context);
    ImageProvider image = (profil.image.isEmpty ? const AssetImage("assets/images/connect.png"):NetworkImage(Constante.baseUri+"/file/"+profil.image)) as ImageProvider;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(90),
              ),
              color: Constante.primary,
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: InkWell(
                      onTap: _loadImage,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: image,
                      ),
                    ),
                    height: 90,
                    width: 90,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(20),
            child: Text(
              profil.groupeSanguin.isEmpty? "groupe inconnu" :profil.groupeSanguin,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Constante.primary,
                  fontWeight: FontWeight.w600
              ),
              softWrap: true,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 50, right: 50, top: 20),
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Constante.tertiary.withAlpha(200),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 10,
                      color: Constante.accent.withAlpha(200)),
                ],
              ),
              alignment: Alignment.center,
              // =================
              // Login field here
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("${profil.prenom} ${profil.nom}",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),),
              )
          ),
          Container(
            margin: const EdgeInsets.only(left: 50, right: 50, top: 20),
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,

            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Constante.tertiary.withAlpha(200),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 10,
                    color: Constante.accent.withAlpha(200)),
              ],
            ),
            alignment: Alignment.center,
            // =================
            // Login field here
            child: ListTile(
              title: Text(profil.email,style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),),
              leading: const Icon(Icons.mail),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 50, right: 50, top: 20),
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,

            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Constante.tertiary.withAlpha(200),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 10,
                    color: Constante.accent.withAlpha(200)),
              ],
            ),
            alignment: Alignment.center,
            // =================
            // Login field here
            child: ListTile(
              onTap: (){if (kDebugMode) {
                print("pressed");
              }},
              leading: const Icon(Icons.phone),
              title: Text(profil.telephone,style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),),

            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 50, right: 50, top: 20),
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Constante.tertiary.withAlpha(200),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 10,
                    color: Constante.accent.withAlpha(200)),
              ],
            ),
            alignment: Alignment.center,
            // =================
            // Login field here
            child: ListTile(
              leading:const Icon(Icons.medical_services_outlined),
              title: Text(profil.numeroDonneur,style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
              ),
            ),

          ),


        ],
      ),
    );
  }
}
