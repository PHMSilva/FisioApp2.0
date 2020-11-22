import 'package:FisioApp/providers/teste.dart';

class Ficha {
  String idServerFicha;
  String idServerAuxiliar;
  String nomeAuxiliar;
  String idServerAtleta;
  String nomeAtleta;
  bool pendente = true;
  List<Teste> testes = [];
  Ficha({
    this.idServerFicha,
    this.testes,
    this.nomeAuxiliar,
    this.nomeAtleta,
    this.idServerAuxiliar = '',
    this.idServerAtleta = '',
  });
}
