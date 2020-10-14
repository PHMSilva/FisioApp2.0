import 'package:FisioApp/providers/list_RadioAuxiliar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormAuxiliar extends StatefulWidget {
  @override
  _FormAuxiliarState createState() => _FormAuxiliarState();
}

class _FormAuxiliarState extends State<FormAuxiliar> {
  @override
  Widget build(BuildContext context) {
    ListRadioAuxiliar listRadio = Provider.of<ListRadioAuxiliar>(context);

    //List<AuxiliarRadio> novo = retornoList(auxiliares);
    //print(novo[0].nomeAux);

    //listRadio.receberListaAuxiliar(auxiliares.listaAux);
    print(listRadio.listAuxRadio[2].selecionado);
    return Container(
      height: 400,
      padding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      // child: ListView.builder(itemBuilder: null),
      child: Center(
        child: ListView.builder(
          itemCount: listRadio.listAuxRadio.length,
          itemBuilder: (ctx, index) {
            var radioAux = listRadio.listAuxRadio[index];
            return Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.teal[700],
                      width: 2,
                    ),
                  ),
                  child: RadioListTile(
                    title: Text('${radioAux.nomeAux}'),
                    value: radioAux.idAux,
                    groupValue: listRadio.selecionado,
                    onChanged: (value) {
                      setState(() {
                        listRadio.selecionado = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
