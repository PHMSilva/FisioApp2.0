import 'package:FisioApp/controller/atleta_view.dart';
import 'package:FisioApp/controller/auxiliar_screens.dart';
import 'package:FisioApp/controller/fichas_Form.dart';
import 'package:FisioApp/controller/fichas_view.dart';
import 'package:FisioApp/providers/atletas.dart';
import 'package:FisioApp/providers/auth.dart';
import 'package:FisioApp/providers/auxiliares.dart';
import 'package:FisioApp/providers/fichas.dart';

import 'package:FisioApp/providers/testes.dart';

import 'package:FisioApp/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'acessoConta/login.dart';
import 'view/auth_Ou_Fichas.dart';

void main() {
  runApp(FisioApp());
}

class FisioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Fichas>(
          create: (_) => new Fichas(null, null, []),
          update: (ctx, auth, previousFichas) => new Fichas(
            auth.token,
            auth.userId,
            previousFichas.listaFichas,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, Auxiliares>(
          create: (_) => new Auxiliares(null, null, []),
          update: (ctx, auth, previousAuxiliares) => new Auxiliares(
            auth.token,
            auth.userId,
            previousAuxiliares.listaAux,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, Atletas>(
          create: (_) => new Atletas(null, null, []),
          update: (ctx, auth, previousAtletas) => new Atletas(
            auth.token,
            auth.userId,
            previousAtletas.listaAtl,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => new Testes(),
        ),
      ],
      child: MaterialApp(
        //home: MyHomePage(),
        routes: {
          AppRoutes.AUTHOUFICHAS: (ctx) => AuthOuFicha(),
          AppRoutes.LOGIN: (ctx) => Login(),
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
