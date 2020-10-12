import 'package:FisioApp/providers/teste.dart';
import 'package:flutter/cupertino.dart';

class Ficha with ChangeNotifier {
  int id;
  String nomeAuxiliar;
  String nomeAtleta;
  List<Teste> testes;
  bool pendente = false;

  Ficha({this.id, this.nomeAuxiliar, this.nomeAtleta});

  void adicionarTeste(Teste testeEscolhido) {
    testes.add(testeEscolhido);
    notifyListeners();
  }
}
