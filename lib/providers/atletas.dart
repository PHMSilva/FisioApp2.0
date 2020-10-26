import 'dart:convert';

import 'package:FisioApp/providers/atleta.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Atletas with ChangeNotifier {
  final String baseUrl = 'https://flutter-testereq.firebaseio.com/atletas';

  List<Atleta> listaAtl = [];
  /*
  List<Atleta> listaAtl = [
    Atleta(
      id: 1,
      nomeAtleta: 'Fabio',
      cpf: '12922200-11',
    ),
    Atleta(
      id: 2,
      nomeAtleta: 'Agusto',
      cpf: '12922200-11',
    ),
    Atleta(
      id: 3,
      nomeAtleta: 'Maria Clara',
      cpf: '12922200-11',
    ),
    Atleta(
      id: 4,
      nomeAtleta: 'Antonio',
      cpf: '12922200-11',
    ),
    Atleta(
      id: 5,
      nomeAtleta: 'Denise',
      cpf: '12922200-11',
    ),
    Atleta(
      id: 6,
      nomeAtleta: 'Aline',
      cpf: '12922200-11',
    ),
  ];
*/

  String _token;
  String _userId;
  Atletas(this._token, this._userId, this.listaAtl);

  Future<void> addAtleta(String nomeInserido, String cpfInserido) async {
    final response = await http.post(
      '$baseUrl/$_userId.json?auth=$_token',
      body: json.encode({
        'nome': nomeInserido,
        'cpf': cpfInserido,
      }),
    );
    listaAtl.add(
      new Atleta(
        idServer: json.decode(response.body)['name'],
        nome: nomeInserido,
        cpf: cpfInserido,
      ),
    );
    notifyListeners();
  }

  Future<void> loadAtletas() async {
    final response = await http.get('$baseUrl/$_userId.json?auth=$_token');
    Map<String, dynamic> data = json.decode(response.body);
    listaAtl.clear();

    if (data != null) {
      data.forEach((dataId, dataBody) {
        listaAtl.add(Atleta(
          idServer: dataId,
          nome: dataBody['nome'],
          cpf: dataBody['cpf'],
        ));
      });
      notifyListeners();
    }

    return Future.value();
  }

  List<Atleta> retornaAtletasSelecionados() {
    List<Atleta> atletasSelecionados = [];

    listaAtl.forEach(
      (element) {
        if (element.selecionado) {
          atletasSelecionados.add(element);
          element.selecionado = !element.selecionado;
        }
      },
    );
    return atletasSelecionados;
  }
}
