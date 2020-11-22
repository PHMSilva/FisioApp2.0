import 'package:FisioApp/providers/atletas.dart';
import 'package:FisioApp/providers/auxiliares.dart';
import 'package:FisioApp/providers/fichas.dart';
import 'package:FisioApp/providers/testes.dart';

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
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    Provider.of<Testes>(context, listen: false).loadTestes().then((_) {
      setState(() {
        //_isLoading = false;
      });
    });

    Provider.of<Fichas>(context, listen: false).loadFichas().then((_) {
      setState(() {
        //_isLoading = false;
      });
    });
    Provider.of<Auxiliares>(context, listen: false).loadAuxiliares().then((_) {
      setState(() {
        //_isLoading = false;
      });
    });
    Provider.of<Atletas>(context, listen: false).loadAtletas().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Fichas listFicha = Provider.of<Fichas>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        centerTitle: true,
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
          alignment: Alignment.center,
          color: Colors.white,
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FichasList(),
                    Container(
                      color: Colors.grey[50],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Atualizar Fichas',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.teal[700],
                            onPressed: () {},
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
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
                )),
    );
  }
}
