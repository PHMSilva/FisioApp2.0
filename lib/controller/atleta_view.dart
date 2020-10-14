import 'package:FisioApp/controller/atletas_form.dart';
import 'package:FisioApp/providers/atletas.dart';

import 'package:FisioApp/widget/atleta_List.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AtletaView extends StatefulWidget {
  @override
  _AtletaViewState createState() => _AtletaViewState();
}

class _AtletaViewState extends State<AtletaView> {
  void _abrirFormularioAtleta(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return AtletasForm();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Atletas atletaList = Provider.of<Atletas>(context);

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
          'Atletas',
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
            AtletaList(atletaList.listaAtl),
            FlatButton(
              child: Icon(
                Icons.add_circle,
                color: Colors.tealAccent[700],
                size: 90.0,
              ),
              onPressed: () => _abrirFormularioAtleta(context),
            ),
          ],
        ),
      ),
    );
  }
}
