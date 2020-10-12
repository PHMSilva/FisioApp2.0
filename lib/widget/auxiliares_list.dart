import 'package:FisioApp/providers/auxiliar.dart';
import 'package:flutter/material.dart';

class AuxiliaresList extends StatelessWidget {
  final List<Auxiliar> lista;
  AuxiliaresList(this.lista);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
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
                return Card(
                  color: Colors.grey[100],
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.person,
                          size: 20.0,
                          color: Colors.tealAccent[700],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            ' ID : ${aux.id.toString()}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.teal[700],
                            ),
                          ),
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
                    ],
                  ),
                );
              },
            ),
    );
  }
}
