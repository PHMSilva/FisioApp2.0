import 'package:FisioApp/acessoConta/login.dart';
import 'package:FisioApp/controller/fichas_view.dart';
import 'package:FisioApp/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthOuFicha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? FichasView() : Login();
  }
}
