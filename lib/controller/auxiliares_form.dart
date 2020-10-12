import 'package:FisioApp/providers/auxiliar.dart';
import 'package:FisioApp/providers/auxiliares.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuxiliaresForm extends StatefulWidget {
  final Function(String, String) submeterForm;
  AuxiliaresForm(this.submeterForm);
  @override
  _AuxiliaresFormState createState() => _AuxiliaresFormState();
}

class _AuxiliaresFormState extends State<AuxiliaresForm> {
  var confirmacao = false;
  final nomeController = TextEditingController();
  final emailController = TextEditingController();

  _submeter() {
    final nomeInserido = nomeController.text;
    final emailInserido = emailController.text;
    widget.submeterForm(nomeInserido, emailInserido);
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
              onSubmitted: (_) => _submeter(),
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
            ),
            TextField(
              controller: emailController,
              onSubmitted: (_) => _submeter(),
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  child: Text('Cadastrar Auxiliar'),
                  textColor: Colors.teal,
                  onPressed: _submeter,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
