import 'package:FisioApp/providers/atleta.dart';
import 'package:FisioApp/providers/atleta_CheckBox.dart';
import 'package:flutter/cupertino.dart';

class ListCheckBoxAtleta with ChangeNotifier {
  List<AtletaCheckBox> listAtlCheckBox = [];
  var count = 0;

  var selecionado;
  void receberListaAtleta(List<Atleta> listAtl) {
    if (count == 0) {
      listAtl.forEach(
        (element) {
          listAtlCheckBox.add(new AtletaCheckBox(
              idAtleta: element.id, nomeAtleta: element.nomeAtleta));
          //AuxiliarRadio(element.id,element.nome)
        },
      );
      count++;
    } else {
      count++;
    }

    //  imprimirListaRadio();
  }

  void mostrarSelecionados() {
    listAtlCheckBox.forEach(
      (element) {
        if (element.selecionado) {
          print(element.nomeAtleta);
        }
      },
    );
  }

  List<AtletaCheckBox> retornaAtletasSelecionados() {
    List<AtletaCheckBox> atletasSelecionados = [];

    listAtlCheckBox.forEach(
      (element) {
        if (element.selecionado) {
          atletasSelecionados.add(element);
          element.selecionado = !element.selecionado;
        }
      },
    );
    return atletasSelecionados;
  }
}
