import 'package:FisioApp/providers/atletas.dart';
import 'package:FisioApp/utils/app_routes.dart';

import 'package:FisioApp/widget/atleta_List.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AtletaView extends StatefulWidget {
  @override
  _AtletaViewState createState() => _AtletaViewState();
}

class _AtletaViewState extends State<AtletaView> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Provider.of<Atletas>(context, listen: false).loadAtletas().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
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
        centerTitle: true,
        title: Text(
          'Atletas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        alignment: Alignment.center,
        color: Colors.white,
        child: _isLoading
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AtletaList(atletaList.listaAtl),
                  FlatButton(
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.teal[700],
                      size: 60.0,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.ATLETAS_FORM);
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
