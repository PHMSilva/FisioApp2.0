import 'package:FisioApp/providers/auxiliares.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormAuxiliar extends StatefulWidget {
  @override
  _FormAuxiliarState createState() => _FormAuxiliarState();
}

class _FormAuxiliarState extends State<FormAuxiliar> {
  @override
  Widget build(BuildContext context) {
    Auxiliares listRadio = Provider.of<Auxiliares>(context, listen: false);

    return Container(
      height: 400,
      padding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      child: Center(
        child: ListView.builder(
          itemCount: listRadio.listaAux.length,
          itemBuilder: (ctx, index) {
            var radioAux = listRadio.listaAux[index];
            return Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.teal[700],
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: RadioListTile(
                    title: Text('${radioAux.nome}'),
                    value: radioAux.idServer,
                    groupValue: listRadio.chaveSelecionada,
                    onChanged: (value) {
                      setState(() {
                        listRadio.chaveSelecionada = value;
                        listRadio.atualizarSelecionado();
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
