import 'package:equatable/equatable.dart';

class Resultat with EquatableMixin {
  final String numeroDonneur;
  final String nomDonneur;
  final String hepatiteB;
  final String hepatiteC;
  final String vih1;
  final String vih2;
  final String siphylis;
  final String natTest;

  Resultat(
      {
        required this.numeroDonneur,
      required this.nomDonneur,
      required this.hepatiteB,
      required this.hepatiteC,
      required this.vih1,
      required this.vih2,
      required this.siphylis,
      required this.natTest
      });
  @override
  // TODO: implement props
  List<Object?> get props => [
    numeroDonneur,
    nomDonneur,
    hepatiteB,
    hepatiteC,
    vih1,
    vih2,
    siphylis,
    natTest
  ];
  static Resultat mapper (dynamic dres){
    String numeroDonneur = dres['numeroDonneur'];
    String nomDonneur = dres['nomDonneur'];
    String hepatiteB = dres['hepatiteB'];
    String hepatiteC = dres['hepatiteC'];
    String vih1 = dres['vih1'];
    String vih2 = dres['vih2'];
    String siphylis = dres['siphylis'];
    String natTest = dres['natTest'];
    return Resultat(numeroDonneur: numeroDonneur, nomDonneur: nomDonneur, hepatiteB: hepatiteB, hepatiteC: hepatiteC, vih1: vih1, vih2: vih2, siphylis: siphylis, natTest: natTest);
  }
}