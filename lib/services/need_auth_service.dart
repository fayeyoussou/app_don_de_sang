abstract class NeedAuthService {
  late final Map<String,String> headers;
  NeedAuthService(String token){
    headers = {
      "Authorization" : token
    };
  }
  bool get isEmpty {
    String token = headers['Authorization'] as String;
    return token.isEmpty;
  }
}