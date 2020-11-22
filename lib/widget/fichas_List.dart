//import 'package:FisioApp/providers/ficha.dart';
import 'package:FisioApp/providers/ficha.dart';
import 'package:FisioApp/providers/fichas.dart';
import 'package:FisioApp/widget/exame_View.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FichasList extends StatelessWidget {
  //final List<Ficha> lista;
  //FichasList(this.lista);

  void mostrarFicha(List<Ficha> lista) {
    lista.forEach((element) {
      print(
          ' auxiliar : ${element.nomeAuxiliar}  atleta : ${element.nomeAtleta}  ');
    });
  }

  @override
  Widget build(BuildContext context) {
    Fichas fichasClass = Provider.of<Fichas>(context);
    List<Ficha> lista = fichasClass.fichasCarregadas;
    mostrarFicha(lista);

    return Container(
      height: 500,
      padding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      child: lista.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text('Lista vazia'),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          : ListView.builder(
              itemCount: lista.length,
              itemBuilder: (ctx, index) {
                final exa = lista[index];
                return ExameView(exa);
              },
            ),
    );
  }
}
