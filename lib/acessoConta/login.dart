import 'package:FisioApp/excecao/excecao_Acesso.dart';
import 'package:FisioApp/providers/auth.dart';
import 'package:FisioApp/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthMode { Signup, Login }

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _form = GlobalKey();
  bool _isLoading = false;
  final _senhaController = TextEditingController();
  AuthMode _authMode = AuthMode.Login;

  final Map<String, String> _authData = {
    'nome': '',
    'email': '',
    'senha': '',
    'confirmacao': '',
  };

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Ocorreu um erro!'),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Fechar'),
          ),
        ],
      ),
    );
  }

  void _showConfirmDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Cadastro realizado!'),
        content: Text('Será retornado para a tela de login'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Auth auth = Provider.of(context, listen: false);
              auth.logout();
              Navigator.of(context).popAndPushNamed(AppRoutes.AUTHOUFICHAS);
            },
            child: Text('Fechar'),
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_form.currentState.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    _form.currentState.save();

    Auth auth = Provider.of(context, listen: false);

    try {
      if (_authMode == AuthMode.Login) {
        if (_authData["senha"].contains("k")) {
          ExcecaoAcesso erro = new ExcecaoAcesso('INVALID_PASSWORD');
          _showErrorDialog(erro.toString());
        } else {
          await auth.login(
            _authData["email"],
            _authData["senha"],
          );
        }
      } else {
        await auth.signup(
          _authData["nome"],
          _authData["email"],
          _authData["senha"],
          _authData["confirmacao"],
        );
        _showConfirmDialog();
      }
    } on ExcecaoAcesso catch (error) {
      _showErrorDialog(error.toString());
    } catch (error) {
      _showErrorDialog("Ocorreu um erro inesperado !");
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _switchAutMod() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white30,
        child: Container(
          margin: EdgeInsets.only(
            top: 40,
            left: 40,
            right: 40,
          ),
          child: ListView(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  height: 560,
                  child: Form(
                    key: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'FisioApp',
                            style: TextStyle(
                              color: Colors.teal[600],
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        if (_authMode == AuthMode.Signup)
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "Nome",
                              labelStyle: TextStyle(
                                color: Colors.grey[300],
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Informe um nome';
                              }
                              return null;
                            },
                            onSaved: (value) => _authData['nome'] = value,
                          ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "E-mail",
                            labelStyle: TextStyle(
                              color: Colors.grey[300],
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty || !value.contains('@')) {
                              return 'Informe um e-mail válido ! ';
                            }
                            return null;
                          },
                          onSaved: (value) => _authData['email'] = value,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Senha",
                            labelStyle: TextStyle(
                              color: Colors.grey[300],
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                          controller: _senhaController,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          validator: (value) {
                            if (value.isEmpty || value.length < 6) {
                              return 'Informe uma senha válida';
                            }
                            return null;
                          },
                          onSaved: (value) => _authData['senha'] = value,
                        ),
                        SizedBox(height: 10),
                        if (_authMode == AuthMode.Signup)
                          TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Confirmar Senha",
                              labelStyle: TextStyle(
                                color: Colors.grey[300],
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            onSaved: (value) =>
                                _authData['confirmacao'] = value,
                          ),
                        Spacer(),
                        if (_isLoading)
                          CircularProgressIndicator()
                        else
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: Colors.tealAccent[700],
                            textColor: Colors.grey[100],
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 8,
                            ),
                            child: Text(
                              _authMode == AuthMode.Login
                                  ? 'Entrar'
                                  : 'Cadastrar',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            onPressed: _submit,
                          ),
                        FlatButton(
                          onPressed: _switchAutMod,
                          child: Text(
                            _authMode == AuthMode.Login ? 'Registrar' : 'Login',
                            style: TextStyle(
                              color: Colors.teal[700],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
