import 'package:FisioApp/controller/fichas_Form.dart';
import 'package:FisioApp/providers/auxiliares.dart';
import 'package:FisioApp/providers/fichas.dart';
import 'package:FisioApp/providers/list_RadioAuxiliar.dart';
import 'package:FisioApp/utils/app_routes.dart';
import 'package:FisioApp/widget/fichas_List.dart';
import 'package:FisioApp/widget/mainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FichasView extends StatefulWidget {
  @override
  _FichasViewState createState() => _FichasViewState();
}

class _FichasViewState extends State<FichasView> {
  @override
  Widget build(BuildContext context) {
    Fichas listFicha = Provider.of<Fichas>(context);
    return Scaffold(
      appBar: AppBar(
        /*
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),*/
        backgroundColor: Colors.teal[600],
        titleSpacing: 60,
        title: Text(
          'Fichas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: Container(
        color: Colors.teal[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FichasList(listFicha.listaFichas),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      'Atualizar Fichas',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.teal[700],
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text(
                      'Novo Exame',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.teal[700],
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AppRoutes.FICHAS_FORMULARIO);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
