import 'package:FisioApp/providers/atletas.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AtletasForm extends StatefulWidget {
  AtletasForm();
  @override
  _AtletasFormState createState() => _AtletasFormState();
}

class _AtletasFormState extends State<AtletasForm> {
  final nomeController = TextEditingController();
  final cpfController = TextEditingController();

  _submeter() {
    final nomeInserido = nomeController.text;
    final cpfInserido = cpfController.text;

    Atletas conjAtleta = Provider.of<Atletas>(context, listen: false);
    conjAtleta.addAtleta(nomeInserido, cpfInserido);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
            ),
            TextField(
              controller: cpfController,
              decoration: InputDecoration(
                labelText: 'CPF',
              ),
            ),
            Row(
              children: <Widget>[
                FlatButton(
                    child: Text('Cadastrar Atleta'),
                    textColor: Colors.teal,
                    onPressed: () => _submeter()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
