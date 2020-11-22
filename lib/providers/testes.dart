import 'dart:convert';

import 'package:FisioApp/providers/teste.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Testes with ChangeNotifier {
  List<Teste> listaTesteBD = [];
  void atualizarStatus(Teste testeSelecionado) {
    testeSelecionado.status = !testeSelecionado.status;
  }

  Future<void> loadTestes() async {
    final url =
        'http://fisioterapiaapp1.azurewebsites.net/Exames/ExerciciosAll';
    final response = await http.get(url);

    List<dynamic> data = json.decode(response.body);

    if (data != null) {
      listaTesteBD.clear();
      data.forEach((element) {
        listaTesteBD.add(
          new Teste(
            id: element['id'],
            nomeTeste: element['nome'],
          ),
        );
      });
    }
    return Future.value();
  }

  List<Teste> retornarSelecionados() {
    List<Teste> testesSelecionados = [];
    listaTesteBD.forEach((element) {
      if (element.status) {
        testesSelecionados.add(element);
        element.status = !element.status;
      }
    });
    return testesSelecionados;
  }
}
