import 'package:FisioApp/providers/list_CheckBoxAtleta.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormAtleta extends StatefulWidget {
  @override
  _FormAtletaState createState() => _FormAtletaState();
}

class _FormAtletaState extends State<FormAtleta> {
  @override
  Widget build(BuildContext context) {
    ListCheckBoxAtleta listAtlCkeck = Provider.of<ListCheckBoxAtleta>(context);
    return Container(
      height: 400,
      padding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      child: ListView.builder(
        itemCount: listAtlCkeck.listAtlCheckBox.length,
        itemBuilder: (ctx, index) {
          var atlCheckBox = listAtlCkeck.listAtlCheckBox[index];
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
                  title: Text('${atlCheckBox.nomeAtleta}'),
                  value: atlCheckBox.selecionado,
                  onChanged: (bool value) {
                    setState(
                      () {
                        atlCheckBox.selecionado = value;
                      },
                    );
                    listAtlCkeck.mostrarSelecionados();
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
