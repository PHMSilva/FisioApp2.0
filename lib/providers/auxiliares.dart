import 'package:FisioApp/providers/auxiliar.dart';
import 'package:flutter/cupertino.dart';

class Auxiliares with ChangeNotifier {
  //List<Auxiliar> listaAux = auxiliaresBD;

  List<Auxiliar> listaAux = [
    Auxiliar(
      id: 1,
      nome: 'Isadora',
      email: 'isadora33@gmail.com',
    ),
    Auxiliar(
      id: 2,
      nome: 'José',
      email: 'jose93@gmail.com',
    ),
    Auxiliar(
      id: 3,
      nome: 'Roberto',
      email: 'roberto92@gmail.com',
    ),
  ];

  void addAuxiliar(String nomeInserido, String emailInserido) {
    listaAux.add(
      Auxiliar(
        id: listaAux.length,
        nome: nomeInserido,
        email: emailInserido,
      ),
    );
    print(listaAux);
    notifyListeners();
  }
}
