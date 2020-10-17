import 'package:FisioApp/providers/atleta_CheckBox.dart';
import 'package:FisioApp/providers/auxiliar_Radio.dart';
import 'package:FisioApp/providers/ficha.dart';
import 'package:FisioApp/providers/teste.dart';
import 'package:flutter/cupertino.dart';

class Fichas with ChangeNotifier {
  List<Ficha> listaFichas = [
    Ficha(
      id: 1,
      nomeAuxiliar: 'Auxiliar',
      nomeAtleta: 'Atleta',
    ),
    Ficha(
      id: 2,
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
      id: 5,
      nomeAuxiliar: 'Auxiliar',
      nomeAtleta: 'Atleta',
    ),
    Ficha(
      id: 6,
      nomeAuxiliar: 'Auxiliar',
      nomeAtleta: 'Atleta',
    ),
  ];

  void addFicha(Ficha novaFicha) {
    listaFichas.add(novaFicha);
    notifyListeners();
  }

  void addFichas(AuxiliarRadio auxiliar, List<AtletaCheckBox> atletas,
      List<Teste> testes) {
    print('aqui');
    atletas.forEach((element) {
      addFicha(new Ficha(
        id: listaFichas.length,
        nomeAuxiliar: auxiliar.nomeAux,
        nomeAtleta: element.nomeAtleta,
      ));
    });
  }

  void subsFicha(Ficha fichaAtualizada) {}

  //void gerarFicha(Ficha novaFicha) {}
}
