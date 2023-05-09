
import 'package:flutter/material.dart';

class ActiveScreenProvider with ChangeNotifier {
  String activePage = "/";
  set active(String active){
    activePage=active;
    notifyListeners();
  }
}