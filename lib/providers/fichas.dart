import 'dart:convert';
import 'package:FisioApp/providers/atleta.dart';
import 'package:FisioApp/providers/auxiliar.dart';
import 'package:FisioApp/providers/ficha.dart';
import 'package:FisioApp/providers/teste.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Fichas with ChangeNotifier {
  final String baseUrl = 'https://flutter-testereq.firebaseio.com/fichas';
  List<Ficha> listaFichas = [];

  String _token;
  String _userId;
  Fichas(this._token, this._userId, this.listaFichas);

  Future<void> loadFichas() async {
    List<Ficha> fichasCarregadas = [];
    final response = await http.get('$baseUrl/$_userId.json?auth=$_token');
    //listaFichas.clear();
    Map<String, dynamic> data = json.decode(response.body);
    print(data);

    if (data != null) {
      data.forEach((fichaId, fichaData) {
        fichasCarregadas.add(Ficha(
          idServerFicha: fichaId,
          idServerAuxiliar: fichaData['idServerAuxliar'],
          idServerAtleta: fichaData['idServerAtleta'],
          nomeAuxiliar: fichaData['nomeAuxiliar'],
          nomeAtleta: fichaData['nomeAtleta'],
          testes: (fichaData['testes'] as List<dynamic>).map((testeItem) {
            return Teste(
              id: testeItem['id'],
              nomeTeste: testeItem['nome'],
              resultado: testeItem['resultado'],
            );
          }).toList(),
        ));
      });
      notifyListeners();
    }
    listaFichas = fichasCarregadas.reversed.toList();
    return Future.value();
  }

  Future<void> addFicha(Ficha novaFicha) async {
    final response = await http.post(
      '$baseUrl/$_userId.json?auth=$_token',
      body: json.encode({
        'idServerAuxiliar': novaFicha.idServerAuxiliar,
        'nomeAuxiliar': novaFicha.nomeAuxiliar,
        'idServerAtleta': novaFicha.idServerAtleta,
        'nomeAtleta': novaFicha.nomeAtleta,
        'testes': novaFicha.testes
            .map((teste) => {
                  'id': teste.id,
                  'nome': teste.nomeTeste,
                  'resultado': 'pendente',
                })
            .toList()
      }),
    );
    novaFicha.idServerFicha = json.decode(response.body)['name'];
    listaFichas.add(novaFicha);
    notifyListeners();
  }

//montarFichas
  void addFichas(
      Auxiliar auxiliar, List<Atleta> atletas, List<Teste> testesSelecionados) {
    atletas.forEach((element) {
      addFicha(new Ficha(
        idServerAuxiliar: auxiliar.idServer,
        nomeAuxiliar: auxiliar.nome,
        idServerAtleta: element.idServer,
        nomeAtleta: element.nome,
        testes: testesSelecionados,
      ));
    });
  }

  void subsFicha(Ficha fichaAtualizada) {}

  //void gerarFicha(Ficha novaFicha) {}
}
