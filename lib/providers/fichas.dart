import 'package:FisioApp/data/BD_Fichas.dart';
import 'package:FisioApp/providers/ficha.dart';
import 'package:flutter/cupertino.dart';

class Fichas with ChangeNotifier {
  List<Ficha> _fichasSel = listaFichas;
  List<Ficha> get fichasSel => [...fichasSel];

  void addFicha(Ficha novaFicha) {
    _fichasSel.add(novaFicha);
    notifyListeners();
  }

  void subsFicha(Ficha fichaAtualizada) {}

  void gerarFicha(Ficha novaFicha) {}
}
