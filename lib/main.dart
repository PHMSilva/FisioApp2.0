import 'package:FisioApp/controller/auxiliar_screens.dart';
import 'package:FisioApp/controller/fichas_view.dart';
import 'package:FisioApp/providers/auxiliares.dart';
import 'package:FisioApp/providers/fichas.dart';
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
    return ChangeNotifierProvider<Auxiliares>.value(
      value: Auxiliares(),
      child: MaterialApp(
        //home: MyHomePage(),
        routes: {
          AppRoutes.LOGIN: (ctx) => Login(),
          AppRoutes.CADASTRO: (ctx) => Cadastro(),
          AppRoutes.AUXILIARES: (ctx) => AuxiliarScreen(),
          AppRoutes.FICHAS: (ctx) => FichasView(),
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
