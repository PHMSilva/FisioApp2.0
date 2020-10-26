import 'package:FisioApp/controller/form_Atleta.dart';
import 'package:FisioApp/controller/form_Auxiliar.dart';
import 'package:FisioApp/controller/form_Teste.dart';
import 'package:FisioApp/providers/atletas.dart';
import 'package:FisioApp/providers/auxiliares.dart';
import 'package:FisioApp/providers/fichas.dart';
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
                auxiliares.selecionado,
                atletas.retornaAtletasSelecionados(),
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
