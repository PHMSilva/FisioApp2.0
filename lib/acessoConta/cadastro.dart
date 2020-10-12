import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Container(
          color: Colors.grey[100],
          margin: EdgeInsets.only(
            top: 60,
            left: 40,
            right: 40,
          ),
          /*margin: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        */
          child: ListView(
            children: <Widget>[
              Container(
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  'Cadastro',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[600],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 300,
                alignment: Alignment.center,
                //color: Colors.grey[200],
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[300],
                        ),
                      ),
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
                          fontSize: 20,
                          color: Colors.grey[300],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
                        labelText: "Confirme a Senha",
                        labelStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[300],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                child: FlatButton(
                    onPressed: () {},
                    color: Colors.teal[600],
                    child: Text(
                      "Enviar",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.grey[100],
                alignment: Alignment.center,
                child: FlatButton(
                  child: Text(
                    'Retornar para tela de login',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                //Text('Voltar para o login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
