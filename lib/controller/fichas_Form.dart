import 'package:FisioApp/controller/form_Atleta.dart';
import 'package:FisioApp/controller/form_Auxiliar.dart';
import 'package:FisioApp/controller/form_Teste.dart';
import 'package:FisioApp/providers/atleta.dart';
import 'package:FisioApp/providers/atletas.dart';
import 'package:FisioApp/providers/auxiliar.dart';
import 'package:FisioApp/providers/auxiliares.dart';
import 'package:FisioApp/providers/fichas.dart';
import 'package:FisioApp/providers/teste.dart';
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

    Atletas atletas = Provider.of<Atletas>(context);

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
        centerTitle: true,
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
              Auxiliar selecionado = auxiliares.selecionado;
              List<Atleta> atletasSelecionados =
                  atletas.retornaAtletasSelecionados();
              List<Teste> testesSelecionados = testes.retornarSelecionados();
              fichas.addFichas(
                selecionado,
                atletasSelecionados,
                testesSelecionados,
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
              Navigator.of(context).pop();
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
