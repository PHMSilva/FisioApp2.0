import 'dart:convert';

import 'package:FisioApp/providers/auxiliar.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auxiliares with ChangeNotifier {
  Auxiliar selecionado;
  String chaveSelecionada;

  final String baseUrl = 'https://flutter-testereq.firebaseio.com/auxiliares';

  List<Auxiliar> listaAux = [];
  String _token;
  String _userId;
  Auxiliares(this._token, this._userId, this.listaAux);

  Future<void> loadAuxiliares() async {
    final response = await http
        .get('https://fisioterapiaapp1.azurewebsites.net/Usuario/$_userId');
    List<dynamic> data = json.decode(response.body);

    listaAux.clear();

    if (data != null) {
      data.forEach((dataBody) {
        listaAux.add(
          Auxiliar(
            idServer: dataBody['id'].toString(),
            nome: dataBody['nome'],
            email: dataBody['email'],
          ),
        );
      });
      notifyListeners();
    }

    return Future.value();
  }

  Future<void> addAuxiliar(String nomeInserido, String emailInserido) async {
    final response = await http.post(
      '$baseUrl/$_userId.json?auth=$_token',
      body: json.encode({
        'nome': nomeInserido,
        'email': emailInserido,
      }),
    );

    listaAux.add(
      new Auxiliar(
        idServer: json.decode(response.body)['name'],
        nome: nomeInserido,
        email: emailInserido,
      ),
    );
    notifyListeners();
  }

  void atualizarSelecionado() {
    selecionado =
        listaAux.singleWhere((element) => element.idServer == chaveSelecionada);
  }
}
