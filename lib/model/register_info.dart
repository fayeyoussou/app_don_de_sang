import 'dart:io';

class RegisterInfo {
  File? image;
  String prenom = "";
  String nom = "";
  String cin = "";
  String telephone = "";
  String email = "";
  String login = "";
  clean (){
    prenom= prenom.trim();
    nom = nom.trim();
    cin = cin.trim();
    telephone = telephone.trim();
    email = email.trim();
    login = login.trim();
  }
}