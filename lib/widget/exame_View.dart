import 'package:FisioApp/providers/ficha.dart';
import 'package:FisioApp/providers/teste.dart';
import 'package:FisioApp/widget/Calc_RQ.dart';
import 'package:FisioApp/widget/Calc_Star.dart';
import 'package:FisioApp/widget/Calc_Y.dart';
import 'package:FisioApp/widget/Closed_Kinect.dart';
import 'package:FisioApp/widget/Dirso_Flexao.dart';
import 'package:FisioApp/widget/Hop_Teste.dart';
import 'package:FisioApp/widget/Single_Leg.dart';
import 'package:flutter/material.dart';

class ExameView extends StatefulWidget {
  final Ficha elFicha;
  ExameView(this.elFicha);

  @override
  _ExameViewState createState() => _ExameViewState();
}

class _ExameViewState extends State<ExameView> {
  void visualizarResultado(Teste testeSelecionado) {
    switch (testeSelecionado.nomeTeste) {
      case 'Calc Star':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CalcStar(testeSelecionado);
            },
          ),
        );

        break;
      case 'Calc RQ':
        print('entrou aquii tambemm');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CalcRQ(testeSelecionado);
            },
          ),
        );
        break;
      case 'Calc Y':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CalcY(testeSelecionado);
            },
          ),
        );

        break;
      case 'Hop Teste':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HopTest(testeSelecionado);
            },
          ),
        );
        break;
      case 'Closed Kinect':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ClosedKinect(testeSelecionado);
            },
          ),
        );
        break;
      case 'Dirso Flexão':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DirsoFlexao(testeSelecionado);
            },
          ),
        );
        break;
      case 'Single Leg':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SingleLeg(testeSelecionado);
            },
          ),
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.teal[700],
                    width: 2.5,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text(widget.elFicha.testes[0].foiRealizado()
                                  ? 'Concluido'
                                  : 'Pendente'),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                child: Icon(
                                    widget.elFicha.testes[0].foiRealizado()
                                        ? Icons.check
                                        : Icons.access_time),
                              ),
                            ],
                          ),
                          //child: Text(elFicha.pendente ? "Concluído" : 'Pendente')
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        ' Nome do auxiliar: ${widget.elFicha.nomeAuxiliar}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.teal[700],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      ' Nome do atleta: ${widget.elFicha.nomeAtleta}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.teal[700],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: ExpansionTile(
                        title: Center(
                          child: Text(
                            'Testes',
                            style: TextStyle(
                              color: Colors.teal[600],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        children: <Widget>[
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.elFicha.testes.length,
                            itemBuilder: (ctx, index) {
                              final teste = widget.elFicha.testes[index];
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    height: 30,
                                    alignment: Alignment.center,
                                    //height: 20,
                                    margin: EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.teal[700],
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: teste.foiRealizado()
                                        ? FlatButton(
                                            onPressed: () {
                                              setState(() {
                                                visualizarResultado(teste);
                                              });
                                            },
                                            child: Text(
                                              ' ${teste.nomeTeste} ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.teal[700],
                                              ),
                                            ),
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                ' ${teste.nomeTeste} ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.teal[700],
                                                ),
                                              ),
                                              Text(
                                                ' (Pendente) ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.teal[700],
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
