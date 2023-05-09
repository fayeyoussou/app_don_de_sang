import 'package:bda_app/model/Resultat.dart';
import 'package:equatable/equatable.dart';
import '../config/helper.dart';

class Don with EquatableMixin {
  final String numero;
  final bool result;
  final DateTime date;
  final String banque;
  final Resultat? resultat;

  Don( {required this.numero, required this.result, required this.banque, required this.date,required this.resultat,});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  static Don mapper (dynamic ddon){
    String numero = ddon['numero'];
    bool result = ddon['result'];
    DateTime date = Helper.convertDate(ddon['date'] as String);
    String banque = ddon['banque'];
    Resultat? resultat = ddon['resultat'] ==null ? null : Resultat.mapper(ddon['resultat']);
    return Don(numero: numero, result: result, banque: banque, date: date, resultat: resultat);
  }
}