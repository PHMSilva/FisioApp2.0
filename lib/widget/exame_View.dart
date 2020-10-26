import 'package:FisioApp/providers/ficha.dart';
import 'package:flutter/material.dart';

class ExameView extends StatelessWidget {
  final Ficha elFicha;
  ExameView(this.elFicha);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.grey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.teal[700],
                  width: 4,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      /*   Text(
                        ' ID : ${elFicha.id.toString()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.teal[700],
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      */
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(elFicha.pendente ? 'Concluido' : 'Pendente'),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Icon(elFicha.pendente
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
                      ' Nome do auxiliar: ${elFicha.nomeAuxiliar}',
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
                    ' Nome do atleta: ${elFicha.nomeAtleta}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.teal[700],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            /*Container(
              height: 100,
              width: 300,
              child: ListView.builder(
                itemCount: elFicha.testes.length,
                itemBuilder: (ctx, index) {
                  final teste = elFicha.testes[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TesteView(teste),
                    ],
                  );
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
