import 'dart:convert';
import 'package:FisioApp/excecao/excecao_Acesso.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  String _userId;
  DateTime _expiryDate;

  bool get isAuth {
    return token != null;
  }

  String get userId {
    return isAuth ? _userId : null;
  }

  String get token {
    if (_token != null &&
        _expiryDate != null &&
        _expiryDate.isAfter(DateTime.now())) {
      return _token;
    } else {
      return null;
    }
  }

  Future<void> _authenticate(
      String email, String senha, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyAWhrytYUuvVK9_JhzYZlkxyZHRlu1spzg';
    final response = await http.post(
      url,
      body: json.encode({
        'email': email,
        'password': senha,
        //'type': 'fisioterapeuta',
        'returnSecureToken': true,
      }),
    );
    final responseBody = json.decode(response.body);
    if (responseBody['error'] != null) {
      throw ExcecaoAcesso(responseBody['error']['message']);
    } else {
      print(responseBody); // imprime oque esta no response
      _token = responseBody['idToken'];
      _userId = responseBody['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
              responseBody['expiresIn']), // a soma da a data de expiracao
        ),
      );
      print('deu1');
      notifyListeners();
    }
    print('deu2');
    return Future.value();
  }

  Future<void> signup(String email, String senha) async {
    return _authenticate(email, senha, 'signUp');
  }

  Future<void> login(String email, String senha) async {
    return _authenticate(email, senha, 'signInWithPassword');
  }
}
