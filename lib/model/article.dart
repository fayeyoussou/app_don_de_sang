import 'package:bda_app/model/section.dart';
import 'package:equatable/equatable.dart';

class Article extends Equatable{
  int ? id;
  final String image;
  final String titre;
  final String description;
  final  String type;
  final int vues;
  final String auteur;
  final String auteurImage;
  final DateTime datePublication;
  final List<Section> sections;

  @override
  String toString() {
    return "image : $image, titre : $titre, auteur : $auteur";
  }
  String get duration {
      Duration duration = DateTime.now().difference(datePublication);

      int days = duration.inDays;
      if(days > 30) return (days%30).toString()+" mois";
      else if(days > 1 ) return "$days jours";
      else if(duration.inHours > 1) return "${duration.inHours} heures";
      else return "${duration.inMinutes} min";
  }

  Article(
      {
        this.id,
      required this.image,
      required this.titre,
      required this.description,
      required this.type,
        required this.vues,
      required this.auteur,
        required this.auteurImage,
      required this.datePublication,
      required this.sections});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    titre,
    auteur,
    description,
    type,
    datePublication
  ];

}