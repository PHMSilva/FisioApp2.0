import 'package:FisioApp/controller/contaUsuario.dart';
import 'package:FisioApp/providers/auth.dart';
import 'package:FisioApp/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem(IconData icon, String label, Function onTap) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade400),
        ),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          size: 25,
          color: Colors.teal[800],
        ),
        title: Text(
          label,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[800],
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ContaUsuario conta = Provider.of<ContaUsuario>(context);
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
            ),
            color: Colors.teal[600],
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 60.0,
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Código',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              conta.codVinculo,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      conta.nome,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey[200],
            child: Column(
              children: <Widget>[
                _createItem(Icons.list, 'Fichas',
                    () => Navigator.of(context).pushNamed(AppRoutes.FICHAS)),
                _createItem(
                    Icons.group,
                    'Auxiliares',
                    () =>
                        Navigator.of(context).pushNamed(AppRoutes.AUXILIARES)),
                _createItem(Icons.group, 'Atletas',
                    () => Navigator.of(context).pushNamed(AppRoutes.ATLETAS)),
                _createItem(Icons.exit_to_app, 'Sair', () {
                  Auth sair = Provider.of<Auth>(context, listen: false);
                  sair.logout();
                  Navigator.of(context).pushNamed(AppRoutes.AUTHOUFICHAS);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
