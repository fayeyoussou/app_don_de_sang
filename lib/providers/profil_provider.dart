import 'dart:convert';

import 'package:bda_app/model/Don.dart';
import 'package:bda_app/services/profil_service.dart';
import 'package:flutter/material.dart';

class ProfilProvider with ChangeNotifier {
  String? _prenom;
  String? _nom;
  String? _telephone;
  String? _email;
  String? _cin;
  ProfilService _profilService = ProfilService( token: '');
  String? _numeroDonneur;
  String? _groupeSanguin;
  String? _image;
  final List<Don> _mesDons = [];

  String get prenom => _prenom ?? "";
  String get nom => _nom ?? "";
  String get telephone => _telephone ?? "";
  String get email => _email ?? "";
  String get cin => _cin ?? "";
  String get numeroDonneur => _numeroDonneur ?? "";
  String get groupeSanguin => _groupeSanguin ?? "";
  String get image => _image ?? "";
  List<Don> get mesDons => [..._mesDons];
  ProfilProvider(String token,ProfilProvider? profilProvider){
    _profilService = ProfilService(token: token);
    if(profilProvider !=null) {
      _prenom = profilProvider.prenom;
      _nom = profilProvider.nom;
      _telephone = profilProvider.telephone;
      _email = profilProvider.email;
      _cin = profilProvider.cin;
      _numeroDonneur = profilProvider.numeroDonneur;
      _groupeSanguin =profilProvider.groupeSanguin;
      _image = profilProvider.image;
    }
    getDons();
    updateProfil();

  }

  Future<void> updateProfil() async{
    var res = await _profilService.getProfilInfo();
    if(res.isEmpty) {
      return;
    } else{
      var myProfil = jsonDecode(res);
      if(myProfil["status"]){
        var result = myProfil['result'];
        bool haveChange =false;
        if(prenom!= result["prenom"]){
          _prenom = result["prenom"];
          haveChange = true;
        }
        if(nom!=result['nom']){
          _nom = result['nom'];
          haveChange =true;
        }
        if(telephone!=result['telephone']){
          _telephone = result['telephone'];
          haveChange =true;
        }
        if(email!=result['email']){
          _email = result['email'];
          haveChange =true;
        }
        if(cin!=result['cin']){
          _cin = result['cin'];
          haveChange =true;
        }
        if(numeroDonneur!=result['numeroDonneur']){
          _numeroDonneur = result['numeroDonneur'];
          haveChange =true;
        }
        if(groupeSanguin!=result['groupeSanguin']){
          _groupeSanguin = result['groupeSanguin'];
          haveChange =true;
        }
        if(image!=result['image']){
          _image = result['image'];
          haveChange =true;
        }
        if(haveChange) notifyListeners();
      }
    }
  }
  Future<void> getDons() async{
    var stringDon = await _profilService.getDons();
    var dynamicResponse = jsonDecode(stringDon);
    print(stringDon);
    // print(dynamicResponse);
    if(dynamicResponse ['status']){
      var dynamicDons = dynamicResponse['result'] as List<dynamic>;
      for(dynamic don in dynamicDons){
        _mesDons.add(Don.mapper(don));
      }
      notifyListeners();
    }
  }
}