class LoginInfo {
  String? login ;
  String? password;
  void clean(){
    login = login!.trim();
    password = password!.trim();
  }
}