import 'package:FisioApp/controller/auxiliares_form.dart';
import 'package:FisioApp/providers/auxiliares.dart';
import 'package:FisioApp/widget/auxiliares_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuxiliarScreen extends StatefulWidget {
  @override
  _AuxiliarScreenState createState() => _AuxiliarScreenState();
}

class _AuxiliarScreenState extends State<AuxiliarScreen> {
  void _submeter(String nomeInput, String emailInput) {
    Auxiliares conjAuxiliar = Provider.of<Auxiliares>(context);
    conjAuxiliar.addAuxiliar(nomeInput, emailInput);
    Navigator.of(context).pop();
  }

  void _abrirFormularioAuxiliar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return AuxiliaresForm(_submeter);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Auxiliares auxiliares = Provider.of<Auxiliares>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
        backgroundColor: Colors.teal[600],
        titleSpacing: 60,
        title: Text(
          'Auxiliares',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        color: Colors.teal[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AuxiliaresList(auxiliares.listaAux),
            FlatButton(
              child: Icon(
                Icons.add_circle,
                color: Colors.tealAccent[700],
                size: 90.0,
              ),
              onPressed: () => _abrirFormularioAuxiliar(context),
            ),
          ],
        ),
      ),
    );
  }
}
