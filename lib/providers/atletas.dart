import 'dart:convert';
import 'package:FisioApp/providers/atleta.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Atletas with ChangeNotifier {
  List<Atleta> listaAtl = [];

  String _token;
  String _userId;
  Atletas(this._token, this._userId, this.listaAtl);

  Future<void> solCadastroAtleta(String nomeInserido, String idAuxiliar) async {
    int idus = int.parse(_userId);
    int idaux = int.parse(idAuxiliar);
//'$baseUrl/$_userId.json?auth=$_token',
    final response = await http.post(
      'http://fisioterapiaapp1.azurewebsites.net/Pedidos/CriarPedido',
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
      body: json.encode({
        'IdUsuario': idus,
        'NomeAtelta': nomeInserido,
        'IdAuxiliar': idaux,
      }),
    );
    notifyListeners();

    return Future.value();
  }

  Future<void> loadAtletas() async {
    listaAtl.clear();
    final response = await http
        .get('https://fisioterapiaapp1.azurewebsites.net/Atleta/getallatleta');
    List<dynamic> data = json.decode(response.body);

    if (data != null) {
      // corrigir depois
      data.forEach((dataBody) {
        listaAtl.add(Atleta(
          idServer: dataBody['id'].toString(),
          nome: dataBody['nome'],
          email: dataBody['email'],
          celular: dataBody['celular'],
          ladoDominante: dataBody['ladoDominante'],
          numero: dataBody['numero'].toString(),
          profissao: dataBody['profissao'],
          posicao: dataBody['posicao'],
          altura: dataBody['altura'].toString(),
          peso: dataBody['peso'].toString(),
        ));
      });

      notifyListeners();
    } else {
      print('lista vazia');
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
