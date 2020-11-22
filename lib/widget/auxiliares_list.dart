import 'package:FisioApp/providers/auxiliar.dart';
import 'package:flutter/material.dart';

class AuxiliaresList extends StatelessWidget {
  final List<Auxiliar> lista;
  AuxiliaresList(this.lista);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
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
              itemCount: lista.length,
              itemBuilder: (ctx, index) {
                final aux = lista[index];
                return Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.teal[700],
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.only(
                        left: 10,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            ' Nome : ${aux.nome}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.teal[700],
                            ),
                          ),
                          Text(
                            ' E-mail : ${aux.email}',
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
                      height: 10,
                    ),
                  ],
                );
              },
            ),
    );
  }
}
