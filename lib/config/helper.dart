import 'package:intl/intl.dart';

import 'constante.dart';

class Helper {
  static DateTime convertDate(String rawDate){
    DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
    return dateFormat.parse(rawDate);
  }
  static String verifyPassword (String? password){
    String error = "";
    if(password ==null || password.isEmpty) {
      return "veuillez remplir le champs mot de passe";

    }else if(password.length < 6 || password.length > 50 ){
      return "taille du mot de passe entre 6 et 50";
    } else {
      Constante.passRegex.forEach((key, value) {
        if(!value.hasMatch(password)) {
          error = key;
        }
      });
      return error;
    }
  }
  static String verifyLogin(String? login){
    String error = "";
    if(login ==null || login.isEmpty) {
      return "veuillez remplir le login";
    }else if(login.length < 4 || login.length >50){
      return "taille login doit etre entre 4 et 50";
    }else {
      Constante.loginRegex.forEach((key, value) {
        if(!value.hasMatch(login)) error = key;
      });
      return error;
    }
  }

  static String verifyPrenom(String prenom) {
    String err = "";

    if(prenom.isEmpty) {
      return "Veuillez remplir le champ prenom";
    } else if(prenom.length <2) {
      return "la taille du prenom doit être supérieur a 2";
    } else {
      return err;
    }
  }

  static String verifyCin(String cin) {
    if(cin.isEmpty) {
      return "Veuillez remplir le champ";
    } else if ((cin.length <13)){
      return "taille doit être 13";
    }else {
      String err  = "";
      Constante.cinRegex.forEach((key, value) {
        if(!value.hasMatch(cin)) {
          err = key;
          return;
        }
      });
      return err;
    }
  }

  static String verifyEmail(String email) {
      RegExp regExp = RegExp("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}\$");
      if(email.isEmpty) {
          return "Veuillez remplir le champ";
      }
      if(!regExp.hasMatch(email)){
        return "format email invalide";
      }
      return "";
  }

  static String verifyTel(String telephone) {
    if(telephone.isEmpty){
      return "Veuillez remplir le champ";
    }
    if(telephone.length <7) {
      return "taille trop petite";
    }
    if(!RegExp("^(?!.*  .*)[\\d+() ]{9,20}\$").hasMatch(telephone)){
      return "ne doit contenir que des chiffres , des parentheses et +";
    }
    return "";
  }
}