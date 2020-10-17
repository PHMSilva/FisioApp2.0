import 'package:FisioApp/controller/form_Atleta.dart';
import 'package:FisioApp/controller/form_Auxiliar.dart';
import 'package:FisioApp/controller/form_Teste.dart';

import 'package:FisioApp/providers/atletas.dart';
import 'package:FisioApp/providers/auxiliares.dart';
import 'package:FisioApp/providers/fichas.dart';
import 'package:FisioApp/providers/list_CheckBoxAtleta.dart';
import 'package:FisioApp/providers/list_RadioAuxiliar.dart';
import 'package:FisioApp/providers/testes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FichasForm extends StatefulWidget {
  @override
  _FichasFormState createState() => _FichasFormState();
}

class _FichasFormState extends State<FichasForm> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    Auxiliares auxiliares = Provider.of<Auxiliares>(context);
    ListRadioAuxiliar listRadio = Provider.of<ListRadioAuxiliar>(context);
    listRadio.receberListaAuxiliar(auxiliares.listaAux);

    Atletas atletas = Provider.of<Atletas>(context);
    ListCheckBoxAtleta listCheckBoxAtleta =
        Provider.of<ListCheckBoxAtleta>(context);
    listCheckBoxAtleta.receberListaAtleta(atletas.listaAtl);

    Fichas fichas = Provider.of<Fichas>(context);

    Testes testes = Provider.of<Testes>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
        title: Text(
          'Cadastro de Fichas',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal[600],
        titleSpacing: 60,
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: _mySteps(),
        currentStep: this._currentStep,
        onStepTapped: (step) {
          setState(() {
            this._currentStep = step;
          });
        },
        onStepContinue: () {
          setState(() {
            if (this._currentStep < this._mySteps().length - 1) {
              this._currentStep = this._currentStep + 1;
            } else {
              //Logic to check if everything is completed
              print('Completed, check fields.');
              fichas.addFichas(
                listRadio.retortarAuxiliarSelecionado(),
                listCheckBoxAtleta.retornaAtletasSelecionados(),
                testes.retornarSelecionados(),
              );
              Navigator.of(context).pop();
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (this._currentStep > 0) {
              this._currentStep = this._currentStep - 1;
            } else {
              this._currentStep = 0;
            }
          });
        },
      ),
    );
  }

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
        title: Text('Auxiliar'),
        content: FormAuxiliar(),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text('Atletas'),
        content: FormAtleta(),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Testes'),
        content: FormTeste(),
        isActive: _currentStep >= 2,
      )
    ];
    return _steps;
  }
}

/*
SingleChildScrollView(
        child: Container(
          color: Colors.grey[100],
          padding: EdgeInsets.only(
            top: 20,
            right: 10,
            left: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Auxiliares',
                      style: TextStyle(color: Colors.teal[700], fontSize: 40),
                    ),
                  ),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.teal[700],
                        width: 4,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  //OpcoesAuxiliares(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Atletas',
                      style: TextStyle(color: Colors.teal[700], fontSize: 40),
                    ),
                  ),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.teal[700],
                        width: 4,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  )
                  //OpcoesAtletas(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Testes',
                      style: TextStyle(color: Colors.teal[700], fontSize: 40),
                    ),
                  ),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.teal[700],
                        width: 4,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  )
                  //OpcoesTestes(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.tealAccent[800],
                    child: Text(
                      'Enviar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.tealAccent[800],
                    child: Text(
                      'Cancelar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
 */
