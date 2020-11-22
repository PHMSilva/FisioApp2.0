import 'dart:convert';
import 'package:FisioApp/excecao/excecao_Acesso.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  String _userId;
  String confirmacaoMensagem;
  String _nomeUsuario;
  String _codVinculo;

  String get nomeUsuario {
    return isAuth ? _nomeUsuario : null;
  }

  bool get isAuth {
    return token != null;
  }

  String get codVinculo {
    return isAuth ? _codVinculo : null;
  }

  String get userId {
    return isAuth ? _userId : null;
  }

  String get token {
    if (_token != null) {
      return _token;
    } else {
      return null;
    }
  }

  Future<void> signup(
      String nome, String email, String senha, String confirmacao) async {
    final url = 'https://fisioterapiaapp1.azurewebsites.net/Usuario/register';

    var response = await http.post(
      url,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
      body: json.encode(
        {
          "Titulo": "Mr",
          "Nome": nome,
          "Email": email,
          "Senha": senha,
          "ConfirmaSenha": confirmacao,
          "AceitoTermos": true,
        },
      ),
    );

    final responseBody = json.decode(response.body);
    if (responseBody['error'] != null) {
      throw ExcecaoAcesso(responseBody['error']['message']);
    } else {
      notifyListeners();
    }

    confirmacaoMensagem = responseBody['message'];
  }

  Future<void> login(String email, String senha) async {
    final url = 'https://fisioterapiaapp1.azurewebsites.net/Usuario/login';

    var response = await http.post(
      url,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
      body: json.encode({
        "Email": email,
        "Senha": senha,
      }),
    );

    final responseBody = json.decode(response.body);
    if (responseBody['message'] != null) {
      print(' dentro ${responseBody['message']}');
      throw ExcecaoAcesso(responseBody['error']['message']);
    } else {
      _nomeUsuario = responseBody['nome'];
      _userId = responseBody['id'].toString();
      _token = responseBody['jwtToken'];
      _codVinculo = responseBody['codvinculo'];

      notifyListeners();
    }

    return Future.value();
  }

  logout() {
    _token = null;
    _userId = null;
  }
}
