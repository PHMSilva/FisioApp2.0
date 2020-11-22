import 'package:FisioApp/providers/atletas.dart';
import 'package:FisioApp/providers/auxiliares.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AtletasForm extends StatefulWidget {
  AtletasForm();
  @override
  _AtletasFormState createState() => _AtletasFormState();
}

class _AtletasFormState extends State<AtletasForm> {
  final nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Auxiliares auxiliares = Provider.of<Auxiliares>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
        backgroundColor: Colors.teal[600],
        titleSpacing: 60,
        title: Text(
          'Solicitação de Cadastro',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.teal[600],
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: nomeController,
                        decoration: InputDecoration(
                          labelText: 'Nome do Atleta',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Escolha um dos auxiliares',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[700],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 350,
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: ListView.builder(
                  itemCount: auxiliares.listaAux.length,
                  itemBuilder: (ctx, index) {
                    var radioAux = auxiliares.listaAux[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.teal[700],
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: RadioListTile(
                            title: Text('${radioAux.nome}'),
                            value: radioAux.idServer,
                            groupValue: auxiliares.chaveSelecionada,
                            onChanged: (value) {
                              setState(() {
                                auxiliares.chaveSelecionada = value;
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              FlatButton(
                child: Text('Cadastrar Atleta'),
                color: Colors.teal,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {
                  Provider.of<Atletas>(context, listen: false)
                      .solCadastroAtleta(
                          nomeController.text, auxiliares.chaveSelecionada);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
