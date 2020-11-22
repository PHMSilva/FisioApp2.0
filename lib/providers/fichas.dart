import 'dart:convert';
import 'package:FisioApp/providers/atleta.dart';
import 'package:FisioApp/providers/auxiliar.dart';
import 'package:FisioApp/providers/teste.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'ficha.dart';

class Fichas with ChangeNotifier {
  List<Ficha> listaFichas = [];

  String _token;
  String _userId;
  Fichas(this._token, this._userId, this.listaFichas);
  List<Ficha> fichasCarregadas = [];
  Future<void> loadFichas() async {
    final response = await http.post(
        'http://fisioterapiaapp1.azurewebsites.net/Exames/ListaFisioExame',
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode({'Id': int.parse(_userId)}));
    fichasCarregadas.clear();

    List<dynamic> data = json.decode(response.body);

    if (data != null) {
      data.forEach((exame) {
        fichasCarregadas.add(
          Ficha(
            nomeAuxiliar: exame['auxiliarNome'],
            idServerFicha: exame['idExame'].toString(),
            testes: (exame['idsExamesExercicios'] as List<dynamic>)
                .map((testeItem) {
              if (testeItem['nome'].toString().contains('Calc RQ')) {
                return Teste(
                  id: testeItem['idExame'],
                  valor1: testeItem['valor1'],
                  valor2: testeItem['valor2'],
                  nomeTeste: testeItem['nome'],
                  resultado1: testeItem['resultado1'],
                  resultado2: testeItem['resultado2'],
                );
              } else {
                return Teste(
                  id: testeItem['idExame'],
                  valor1: testeItem['valor1'],
                  valor2: testeItem['valor2'],
                  valor3: testeItem['valor3'],
                  valor4: testeItem['valor4'],
                  valor5: testeItem['valor5'],
                  valor6: testeItem['valor6'],
                  valor7: testeItem['valor7'],
                  valor8: testeItem['valor8'],
                  nomeTeste: testeItem['nome'],
                  resultado1: testeItem['resultado1'],
                  resultado2: testeItem['resultado2'],
                );
              }
            }).toList(),
            nomeAtleta: exame['nomeAtleta'],
          ),
        );
      });

      notifyListeners();
    }

    return Future.value();
  }

  Future<void> addFicha(Ficha novaFicha) async {
    novaFicha.testes.forEach((test) {});
    final response = await http.post(
      'http://fisioterapiaapp1.azurewebsites.net/Exames/registerExame',
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
      body: json.encode({
        'IdAtleta': int.parse(novaFicha.idServerAtleta),
        'IdUsuario': int.parse(_userId),
        'IdAuxiliar': int.parse(novaFicha.idServerAuxiliar),
        'ExameExercicios': novaFicha.testes
            .map((teste) => {
                  'IdExame': 0,
                  'IdExercios': teste.id,
                })
            .toList()
      }),
    );
    var responseBody = json.decode(response.body);

    listaFichas.add(novaFicha);
    notifyListeners();
  }

  void addFichas(
      Auxiliar auxiliar, List<Atleta> atletas, List<Teste> testesSelecionados) {
    atletas.forEach((element) {
      addFicha(new Ficha(
        nomeAuxiliar: auxiliar.nome,
        nomeAtleta: element.nome,
        testes: testesSelecionados,
        idServerAuxiliar: auxiliar.idServer,
        idServerAtleta: element.idServer,
      ));
    });
  }
}
