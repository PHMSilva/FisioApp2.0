import 'package:FisioApp/providers/atleta.dart';
import 'package:flutter/material.dart';

class AtletaList extends StatelessWidget {
  final List<Atleta> lista;
  AtletaList(this.lista);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      child: lista.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text('Lista vazia'),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: lista.length,
              itemBuilder: (ctx, index) {
                final atl = lista[index];
                return Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.0,
                          color: Colors.teal[800],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                ' Nome : ${atl.nome}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.teal[700],
                                ),
                              ),
                              Text(
                                ' E-mail : ${atl.email}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.teal[700],
                                ),
                              ),
                              Text(
                                ' Celular : ${atl.celular}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.teal[700],
                                ),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            title: Text(
                              'Visualizar outras informações',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal[600],
                              ),
                            ),
                            children: <Widget>[
                              Text(
                                'Lado Dominante : ${atl.ladoDominante}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal[600],
                                ),
                              ),
                              Text(
                                'Número : ${atl.numero}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal[600],
                                ),
                              ),
                              Text(
                                'Profissão : ${atl.profissao}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal[600],
                                ),
                              ),
                              Text(
                                'Posição : ${atl.posicao}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal[600],
                                ),
                              ),
                              Text(
                                'Peso : ${atl.peso}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal[600],
                                ),
                              ),
                              Text(
                                'Altura : ${atl.altura}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal[600],
                                ),
                              ),
                            ],
                          )
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
    );
  }
}
