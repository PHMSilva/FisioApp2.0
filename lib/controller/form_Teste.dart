import 'package:FisioApp/providers/testes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormTeste extends StatefulWidget {
  @override
  _FormTesteState createState() => _FormTesteState();
}

class _FormTesteState extends State<FormTeste> {
  @override
  Widget build(BuildContext context) {
    Testes testes = Provider.of<Testes>(context, listen: false);
    return Container(
      height: 400,
      padding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      child: ListView.builder(
        itemCount: testes.listaTesteBD.length,
        itemBuilder: (ctx, index) {
          var listTeste = testes.listaTesteBD[index];
          return Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.teal[700],
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CheckboxListTile(
                  title: Text('${listTeste.nomeTeste}'),
                  value: listTeste.status,
                  onChanged: (bool value) {
                    setState(
                      () {
                        listTeste.status = value;
                      },
                    );
                  },
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
