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
  bool _isloading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<Auxiliares>(context, listen: false).loadAuxiliares().then((_) {
      setState(() {
        _isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Auxiliares auxiliares = Provider.of<Auxiliares>(context);

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
        height: MediaQuery.of(context).size.height * 0.8,
        alignment: Alignment.center,
        color: Colors.white,
        child: _isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AuxiliaresList(auxiliares.listaAux),
                ],
              ),
      ),
    );
  }
}
