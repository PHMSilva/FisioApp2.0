import 'package:FisioApp/controller/atleta_view.dart';
import 'package:FisioApp/controller/auxiliar_screens.dart';
import 'package:FisioApp/controller/fichas_Form.dart';
import 'package:FisioApp/controller/fichas_view.dart';
import 'package:FisioApp/providers/atletas.dart';
import 'package:FisioApp/providers/auxiliares.dart';
import 'package:FisioApp/providers/fichas.dart';
import 'package:FisioApp/providers/list_CheckBoxAtleta.dart';

import 'package:FisioApp/providers/list_RadioAuxiliar.dart';
import 'package:FisioApp/providers/testes.dart';

import 'package:FisioApp/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'acessoConta/cadastro.dart';
import 'acessoConta/login.dart';

void main() {
  runApp(FisioApp());
}

class FisioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auxiliares>.value(
          value: Auxiliares(),
        ),
        ChangeNotifierProvider<Fichas>.value(
          value: Fichas(),
        ),
        ChangeNotifierProvider<Atletas>.value(
          value: Atletas(),
        ),
        ChangeNotifierProvider<ListRadioAuxiliar>.value(
          value: ListRadioAuxiliar(),
        ),
        ChangeNotifierProvider<ListCheckBoxAtleta>.value(
          value: ListCheckBoxAtleta(),
        ),
        ChangeNotifierProvider<Testes>.value(
          value: Testes(),
        ),
      ],
      child: MaterialApp(
        //home: MyHomePage(),
        routes: {
          AppRoutes.LOGIN: (ctx) => Login(),
          AppRoutes.CADASTRO: (ctx) => Cadastro(),
          AppRoutes.AUXILIARES: (ctx) => AuxiliarScreen(),
          AppRoutes.FICHAS: (ctx) => FichasView(),
          AppRoutes.ATLETAS: (ctx) => AtletaView(),
          AppRoutes.FICHAS_FORMULARIO: (ctx) => FichasForm(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Login()),
    );
  }
}
