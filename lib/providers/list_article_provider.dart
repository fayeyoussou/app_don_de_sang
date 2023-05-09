import 'dart:convert';
import 'package:bda_app/model/article.dart';
import 'package:bda_app/model/section.dart';
import 'package:bda_app/services/articleService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import '../config/constante.dart';

class ListArticleProvider with ChangeNotifier {
  ListArticleProvider() {
    articleService.listArticle.then((data) {
      var res = jsonDecode(utf8.decode(data));
      if(res['status']){
        List<dynamic> articlesData = res['result'];
        for (var articleData in articlesData) {
            int id = articleData['id'];
            String image = Constante.baseUri+"/file/"+articleData['image'];
            String type = articleData['type'];
            String auteur = articleData['auteur'];
            String date = articleData['date_publication'];
            DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");

            // String string = dateFormat.format(DateTime.now()); //Converting DateTime object to String

            DateTime datePublication = dateFormat.parse(date);
            // DateTime datePublication = articleData['date_publication'];
            String titre = articleData['titre'];
            String description = articleData['description'];
            String auteurImage = Constante.baseUri+"/file/"+articleData['auteurImage'];
            int vues = articleData['vues'];
            List<Section> sections = [];
            if(articleData['sections']!=null) {
              List<dynamic> sectionsDynamic = articleData['sections'];
              for (var element in sectionsDynamic) {
                int position = element['position'];
                String titre = element['titre'];
                String contenu = element['contenu'];
                Section section = Section(position,titre,contenu);
                sections.add(section);
              }
            }
            Article article = Article(vues:vues,id:id,image: image, titre: titre, description: description, type: type, auteur: auteur, datePublication: datePublication, sections: sections, auteurImage: auteurImage);
            _items.add(article);
            loaded = true;
            notifyListeners();
        }
       }
    });
  }
  bool loaded = false;
  List<Article>_items = [];
  ArticleService articleService = ArticleService(Constante.token);
  List<Article> get list {
    return [..._items];
  }
  Article get lastImportant {
    Article article = _items.first;
    if(article.type == "alerte") return article;
    for(int i =0 ;i<_items.length;i++){
      if(_items[i].datePublication.difference(DateTime.now()).inDays > 30) break;
      if(_items[i].type == "alerte") {
        article = _items[i];
        break;
      }
    }
    return article;
  }
  // List<Article> get items  {
  //   var val = await articleService.listArticle.then((value) {
  //     if(value['status']==true) {
  //       return  value['result'] as List<Article>;
  //     }else {
  //       return [];
  //     }
  //   });
  // }
  void addVues (int id){
    articleService.addVues(id);
  }
}