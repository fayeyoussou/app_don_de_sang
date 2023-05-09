import 'package:flutter/cupertino.dart';

class MenuProvider with ChangeNotifier {
  double value = 0;
  toggleMenu(){
    value == 0 ? value = 1 : value = 0;
    notifyListeners();
  }
  close(){
    if(value ==1) {
      value = 0 ;
      notifyListeners();
    }
  }
}