import 'package:flutter/foundation.dart';

class LoginScreenProvider with ChangeNotifier {
  String page = "login";
  showRegister(){
    page = "register";
    notifyListeners();
  }
  showLogin(){
    page = "login";
  }
}