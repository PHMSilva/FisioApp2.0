import 'package:FisioApp/providers/atletas.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormAtleta extends StatefulWidget {
  @override
  _FormAtletaState createState() => _FormAtletaState();
}

class _FormAtletaState extends State<FormAtleta> {
  @override
  Widget build(BuildContext context) {
    //ListCheckBoxAtleta listAtlCkeck = Provider.of<ListCheckBoxAtleta>(context);
    Atletas listAtleta = Provider.of<Atletas>(context);
    return Container(
      height: 400,
      padding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      child: ListView.builder(
        itemCount: listAtleta.listaAtl.length,
        itemBuilder: (ctx, index) {
          var atlCheckBox = listAtleta.listaAtl[index];
          return Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.teal[700],
                    width: 2,
                  ),
                ),
                child: CheckboxListTile(
                  title: Text('${atlCheckBox.nome}'),
                  value: atlCheckBox.selecionado,
                  onChanged: (bool value) {
                    setState(
                      () {
                        atlCheckBox.selecionado = value;
                      },
                    );
                    //listAtlCkeck.mostrarSelecionados();
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}
