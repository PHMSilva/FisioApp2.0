import 'package:FisioApp/providers/auxiliar.dart';
import 'package:FisioApp/providers/auxiliar_Radio.dart';
import 'package:flutter/cupertino.dart';

class ListRadioAuxiliar with ChangeNotifier {
  List<AuxiliarRadio> listAuxRadio = [];
  var count = 0;

  var selecionado;
  void receberListaAuxiliar(List<Auxiliar> listAux) {
    if (count == 0) {
      listAux.forEach(
        (element) {
          listAuxRadio
              .add(new AuxiliarRadio(idAux: element.id, nomeAux: element.nome));
          //AuxiliarRadio(element.id,element.nome)
        },
      );
      count++;
    } else {
      count++;
    }

    //  imprimirListaRadio();
  }

  void imprimirListaRadio() {
    listAuxRadio.forEach(
      (element) {
        print(element.nomeAux);
      },
    );
  }

  void atualizarItemAuxiliar(AuxiliarRadio item) {
    item.selecionado = !item.selecionado;
    notifyListeners();
  }
}
