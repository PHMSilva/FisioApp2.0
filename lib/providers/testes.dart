import 'package:FisioApp/providers/teste.dart';
import 'package:flutter/cupertino.dart';

class Testes with ChangeNotifier {
  List<Teste> listaTest = [
    Teste(
      id: 1,
      nomeTeste: 'Teste01',
    ),
    Teste(
      id: 2,
      nomeTeste: 'Teste02',
    ),
    Teste(
      id: 3,
      nomeTeste: 'Teste03',
    ),
    Teste(
      id: 4,
      nomeTeste: 'Teste04',
    ),
    Teste(
      id: 5,
      nomeTeste: 'Teste05',
    ),
    Teste(
      id: 6,
      nomeTeste: 'Teste06',
    ),
    Teste(
      id: 7,
      nomeTeste: 'Teste07',
    ),
    Teste(
      id: 8,
      nomeTeste: 'Teste08',
    ),
    Teste(
      id: 9,
      nomeTeste: 'Teste09',
    ),
  ];

  void atualizarStatus(Teste testeSelecionado) {
    testeSelecionado.status = !testeSelecionado.status;
  }

  void mostrarSelecionados() {
    listaTest.forEach((element) {
      if (element.status) {
        print(element.nomeTeste);
      }
    });
  }
}