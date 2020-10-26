import 'package:FisioApp/providers/teste.dart';
import 'package:flutter/cupertino.dart';

class Ficha with ChangeNotifier {
  String idServerFicha;
  String nomeAuxiliar;
  String idServerAuxiliar;
  //List<Atleta> nomeAtleta;
  String nomeAtleta;
  String idServerAtleta;
  List<Teste> testes;
  bool pendente = false;

  Ficha(
      {this.idServerFicha,
      this.idServerAtleta,
      this.idServerAuxiliar,
      this.nomeAuxiliar,
      this.nomeAtleta,
      this.testes});

  void adicionarTeste(Teste testeEscolhido) {
    testes.add(testeEscolhido);
    notifyListeners();
  }
}
