import 'package:bda_app/config/constante.dart';
import 'package:http/http.dart' as http;
class ArticleService {
  final String? authorization;
  static String route = "/article";

  ArticleService(this.authorization);
  Future<dynamic>get listArticle async {
    var res = await http.get(Uri.parse(Constante.baseUri+route), headers:authorization != null ? {
      "Authorization": authorization as String
    }:null);
    return res.bodyBytes;
  }
  Future<void> addVues (int id) async{
    String url = Constante.baseUri+route+"/vues/$id";
    var res = await http.get(Uri.parse(url));
  }
}