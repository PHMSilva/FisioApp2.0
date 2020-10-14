import 'package:FisioApp/providers/atleta.dart';
import 'package:flutter/cupertino.dart';

class Atletas with ChangeNotifier {
  List<Atleta> listaAtl = [
    Atleta(
      id: 1,
      nomeAtleta: 'Fabio',
      cpf: '12922200-11',
    ),
    Atleta(
      id: 2,
      nomeAtleta: 'Agusto',
      cpf: '12922200-11',
    ),
    Atleta(
      id: 3,
      nomeAtleta: 'Maria Clara',
      cpf: '12922200-11',
    ),
  ];

  void addAtleta(String nomeEscolhido, String cpfEscolhido) {
    listaAtl.add(
      Atleta(
        id: listaAtl.length + 1,
        nomeAtleta: nomeEscolhido,
        cpf: cpfEscolhido,
      ),
    );
    print(listaAtl);
    notifyListeners();
  }
}
