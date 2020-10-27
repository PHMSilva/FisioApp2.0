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
    final response = await http.get('$baseUrl/$_userId.json?auth=$_token');
    Map<String, dynamic> data =
        json.decode(response.body); // chega o json entao faz um decode dele
    listaAux.clear();
    if (data != null) {
      data.forEach((dataId, dataBody) {
        listaAux.add(
          Auxiliar(
            idServer: dataId,
            nome: dataBody['nome'],
            email: dataBody['email'],
          ),
        );
      });
      notifyListeners();
    }
    //print(json.decode(response.body));

    return Future.value();
  }

  Future<void> addAuxiliar(String nomeInserido, String emailInserido) async {
    final response = await http.post(
      '$baseUrl/$_userId.json?auth=$_token',
      body: json.encode({
        // 'id': novoAux.id,
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

  Future<void> atualizarAuxiliar() async {
    final index = 1;

    if (index == null) {
      return;
    }
    final Auxiliar escolhido =
        //listaAux.singleWhere((element) => element.id == index);
        listaAux[0];
    print(escolhido.nome);
    print('espere');
    escolhido.nome = 'hinata';
    escolhido.email = 'gostosadonaruto';
    await http.patch(
      "$baseUrl/${escolhido.idServer}.json",
      body: json.encode(
        {
          'nome': escolhido.nome,
          'email': escolhido.email,
        },
      ),
    );
  }

  void atualizarSelecionado() {
    selecionado =
        listaAux.singleWhere((element) => element.idServer == chaveSelecionada);
  }
}
