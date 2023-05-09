import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Constante {
  static const Color primary = Color.fromRGBO(240, 76, 74, 1);
  static const Color secondary = Color.fromRGBO(167, 187, 248, 1);
  static const Color accent = Color.fromRGBO(122, 10, 10, 1);
  static const Color tertiary = Color.fromRGBO(255, 238, 219, 1);
  static const String baseUri = "http://127.0.0.1:8080/api";
  static String token = "eav4eyt24b6lkrdgegnwzz7finrrfskcaismplzdfn6le8r1klxoyx4o0smu";
  static  Map<String,RegExp> loginRegex = {
      "ne doit contenir de caractère special  a part _ , .,-":
      RegExp("^(?=[a-zA-Z\\d._-]*\$)(?!.*[_.]{2})[^_.].*[^_.]\$")
  };
  static Map<String,RegExp> passRegex = {
    "caractère special non autorise" : RegExp("^[\\w\\W]+\$"),
    "deux tire '_' successif non autorise" : RegExp("^(?!.*__.*)[a-zA-Z]\\w+\$")
  };
  static Map<String,RegExp> cinRegex = {
    "ne doit contenir que des chiffres": RegExp("^\\d*\$"),
    "doit commencer par un ou deux" : RegExp("^[12]\\w*\$")
  };
}