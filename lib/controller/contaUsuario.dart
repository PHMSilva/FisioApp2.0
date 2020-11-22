import 'package:flutter/cupertino.dart';

class ContaUsuario with ChangeNotifier {
  String nome;
  String idUser;
  String token;
  String codVinculo;

  ContaUsuario(
    this.token,
    this.idUser,
    this.nome,
    this.codVinculo,
  );
}
