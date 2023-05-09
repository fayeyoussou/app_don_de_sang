import 'dart:convert';
import 'dart:io';

import 'package:bda_app/config/constante.dart';
import 'package:bda_app/model/register_info.dart';
import 'package:http/http.dart' as http;
class AuthService {
  Future<dynamic> login (String login,String password) async{
    String url = "http://127.0.0.1:8080/api/auth/login";
    try {
      var res = await http.post(Uri.parse(url),body: jsonEncode({
        "login":login,
        "password":password
      }),headers: {"Content-Type": "application/json"});
      return jsonDecode(utf8.decode(res.bodyBytes));
    }catch(error) { rethrow;}
  }

  Future<void> logout(String? token) async{
      await http.get(Uri.parse(Constante.baseUri+"/profil/logout"),headers: {
        "Authorization":token as String
      });
  }

  Future<dynamic> register(RegisterInfo info) async {
    //     var request = http.MultipartRequest("POST",Uri.parse("http://127.0.0.1:8080/api/test/upload"));
    //     request.fields['prenom']="youssoupha";
    //     request.headers['Authorization']="eav4eyt24b6lkrdgegnwzz7finrrfskcaismplzdfn6le8r1klxoyx4o0smu";
    //     // var file = http.MultipartFile.fromBytes('file',_image!.readAsBytesSync(),filename: image.path);
    //     var file = await http.MultipartFile.fromPath("file", image.path);
    //     request.files.add(file);
    //     var response = await request.send();
    //     var responseData = await response.stream.toBytes();
    //     var res =

    //     print(res);
    var request = http.MultipartRequest("POST",Uri.parse(Constante.baseUri+"/auth/register"));
    request.fields.addAll({
      "prenom":info.prenom,
      "nom":info.nom,
      "telephone":info.telephone,
      "email":info.email,
      "login":info.login,
      "cin":info.cin
    });
    var file = await http.MultipartFile.fromPath("image", info.image!.path);
    request.files.add(file);
    var response  = await request.send();
    print(response.headers["error"]);
    var responseData = await response.stream.toBytes();

    var res = String.fromCharCodes(responseData);
    return jsonDecode(res);
  }
}