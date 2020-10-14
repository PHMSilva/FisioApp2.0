import 'package:FisioApp/providers/ficha.dart';
import 'package:flutter/cupertino.dart';

class Fichas with ChangeNotifier {
  List<Ficha> listaFichas = [
    Ficha(
      id: 1,
      nomeAuxiliar: 'Auxiliar',
      nomeAtleta: 'Atleta',
    ),
    Ficha(
      id: 1,
      nomeAuxiliar: 'Auxiliar',
      nomeAtleta: 'Atleta',
    ),
    Ficha(
      id: 3,
      nomeAuxiliar: 'Auxiliar',
      nomeAtleta: 'Atleta',
    ),
    Ficha(
      id: 4,
      nomeAuxiliar: 'Auxiliar',
      nomeAtleta: 'Atleta',
    ),
    Ficha(
      id: 1,
      nomeAuxiliar: 'Auxiliar',
      nomeAtleta: 'Atleta',
    ),
    Ficha(
      id: 1,
      nomeAuxiliar: 'Auxiliar',
      nomeAtleta: 'Atleta',
    ),
  ];

  void addFicha(Ficha novaFicha) {
    listaFichas.add(novaFicha);
    notifyListeners();
  }

  void subsFicha(Ficha fichaAtualizada) {}

  void gerarFicha(Ficha novaFicha) {}
}
