import 'package:FisioApp/providers/auxiliares.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuxiliaresForm extends StatefulWidget {
  AuxiliaresForm();
  @override
  _AuxiliaresFormState createState() => _AuxiliaresFormState();
}

class _AuxiliaresFormState extends State<AuxiliaresForm> {
  var carregando = false;
  final nomeController = TextEditingController();
  final emailController = TextEditingController();

  _submeter() {
    final nomeInserido = nomeController.text;
    final emailInserido = emailController.text;

    Auxiliares conjAuxiliar = Provider.of<Auxiliares>(context, listen: false);
    /*
    conjAuxiliar.addAuxiliar(nomeInserido, emailInserido);
    Navigator.of(context).pop();
    */
    conjAuxiliar.addAuxiliar(nomeInserido, emailInserido);
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
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            Row(
              children: <Widget>[
                FlatButton(
                    child: Text('Cadastrar Auxiliar'),
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
