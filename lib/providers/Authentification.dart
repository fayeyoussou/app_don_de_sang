
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bda_app/model/register_info.dart';
import 'package:bda_app/services/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/helper.dart';

class Authentification with ChangeNotifier {
  bool _tryAuto = true;
  String? _token;
  DateTime? _expiryDate;
  String? _login;
  String? _nom;
  String get nom => _nom ?? "";
  set nom (String nom)=> _nom = nom;
  Timer? _authTimer;
  String? _image;
  String get image => _image??"";
  set image(String image){
    _image = image;
  }
  List<String> roles = [];
  final AuthService authService = AuthService();
  bool get isAuth {
    return _token!=null;
  }
  String get token {
    if(_expiryDate==null || _expiryDate!.isBefore(DateTime.now()) ) {
      return "expired";
    }
    if(_token != null) {
      return _token as String;
    } else {
      return "";
    }
  }
  String get login {
    return _login ?? "";
  }
  Future<Map<String,dynamic>> sAuthentifier(String login , String password )async {
    try {
      var res = await authService.login(login, password);
      print(res);
      // return true;
      if (res['status']) {
        dynamic resultat = res["result"];

        _token = resultat['token'];
        _login = resultat['login'];
        _nom = resultat['prenom'] + " " + resultat['nom'];
        _image = resultat['image'];
        var neroles = resultat['roles'] as List<dynamic>;
        for (var element in neroles) {
          roles.add(element);
        }
        // print(roles);
        _expiryDate = Helper.convertDate(resultat['dateExpiration']);
        _tryAuto = false;
        _autoLogout();
        notifyListeners();
        final prefs = await SharedPreferences.getInstance();
        final userData = jsonEncode({
          "token": _token,
          "nom": _nom,
          "expiration": _expiryDate?.toIso8601String(),
          "roles": roles,
          "login": _login,
          'image' : _image
        });
        prefs.setString("connInfos", userData);

      }
      return  res;
    }catch(error) {
      if (kDebugMode) {
        print(error.toString());
      }
      rethrow;
    }

  }
  Future<void> register(RegisterInfo registerInfo) async {
      var res = await authService.register(registerInfo);
      if(!res["status"]) print("false");
  }
  Future<bool> tryAutoConnect() async {
    if(_tryAuto){
      _tryAuto = false;
      final prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey('connInfos')) return false;
      final extractedData = jsonDecode(prefs.getString('connInfos') as String)
          as Map<String, dynamic>;
      final expiryDate = DateTime.parse(extractedData['expiration'] as String);
      if (expiryDate.isBefore(DateTime.now())) {
        prefs.clear();
        return false;
      }
      _expiryDate = expiryDate;
      _image = extractedData['image'] as String;
      _login = extractedData['login'] as String;
      _nom = extractedData['nom'] as String;
      _token = extractedData['token'] as String;
      List<dynamic>dynamicRoles = extractedData['roles'] as List<dynamic>;
      for(dynamic rol in dynamicRoles) {
        roles.add(rol);
      }
      notifyListeners();
      _autoLogout();
      return true;
    }
    return false;
  }
  Future<void> logout() async{
    _tryAuto = false;
    authService.logout(_token);
    _token = null;
    _login = null;
    roles = [];
    _nom = null;
    _image = null;
    _expiryDate =null;
    if(_authTimer!=null){
      _authTimer!.cancel();
      _authTimer=null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
  void _autoLogout(){
    if(_authTimer!=null){
      _authTimer!.cancel();
    }
    final timeToExpiry = _expiryDate!.difference(DateTime.now());
    if(timeToExpiry.inHours <=18) _authTimer= Timer(timeToExpiry,logout);
  }
}