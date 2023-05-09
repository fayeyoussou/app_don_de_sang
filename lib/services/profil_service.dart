import 'dart:convert';

import 'package:bda_app/config/constante.dart';
import 'package:bda_app/services/need_auth_service.dart';
import 'package:http/http.dart' as http;


class ProfilService extends NeedAuthService{


  ProfilService({required String token}) : super(token);

  Future<String> getProfilInfo() async{
    if(isEmpty) return "";
    var res =  await http.get(Uri.parse(Constante.baseUri+"/profil"),headers: headers);
    return res.body;
  }
  Future<String> getDons() async{
    if(isEmpty) return "";
    var res  = await http.get(Uri.parse(Constante.baseUri+"/profil/dons"),headers: headers);
    return utf8.decode(res.bodyBytes);
  }
}