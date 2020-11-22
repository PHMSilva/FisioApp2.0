import 'package:FisioApp/providers/teste.dart';

import 'package:flutter/material.dart';

class CalcStar extends StatelessWidget {
  final Teste teste;
  CalcStar(this.teste);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),*/
        backgroundColor: Colors.teal[600],
        titleSpacing: 60,
        title: Text(
          teste.nomeTeste,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.05,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            bottom: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Valores',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[700],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.04,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                /* margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.1,
                ),*/
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.teal[700], width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text('Comprimento do membro direito'),
                      subtitle: Text(teste.valor1),
                    ),
                    ListTile(
                      title: Text('Comprimento do membro esquerdo'),
                      subtitle: Text(teste.valor2),
                    ),
                    ListTile(
                      title: Text('Direção anterior direito'),
                      subtitle: Text(teste.valor3),
                    ),
                    ListTile(
                      title: Text('Direção anterior esquerdo'),
                      subtitle: Text(teste.valor4),
                    ),
                    ListTile(
                      title: Text('Direção postero lateral direito'),
                      subtitle: Text(teste.valor5),
                    ),
                    ListTile(
                      title: Text('Direção postero lateral esquerdo'),
                      subtitle: Text(teste.valor6),
                    ),
                    ListTile(
                      title: Text('Direção postero medial direito '),
                      subtitle: Text(teste.valor7),
                    ),
                    ListTile(
                      title: Text('Direção postero medial esquerdo'),
                      subtitle: Text(teste.valor8),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Text(
                'Resultados',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[700],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              Column(
                children: <Widget>[
                  Text(
                    teste.resultado1,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700],
                    ),
                  ),
                  Text(
                    teste.resultado2,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.04,
              ),
              FlatButton(
                color: Colors.teal[600],
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Voltar",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
