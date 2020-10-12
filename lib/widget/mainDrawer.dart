import 'package:FisioApp/utils/app_routes.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem(IconData icon, String label, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.teal[600],
            alignment: Alignment.bottomRight,
            child: Center(
              child: Text(
                'User',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _createItem(Icons.list, 'Fichas',
              () => Navigator.of(context).pushNamed(AppRoutes.FICHAS)),
          _createItem(Icons.group, 'Auxiliares',
              () => Navigator.of(context).pushNamed(AppRoutes.AUXILIARES)),
          _createItem(Icons.group, 'Atletas',
              () => Navigator.of(context).pushNamed(AppRoutes.ATLETAS)),
          _createItem(Icons.exit_to_app, 'Sair',
              () => Navigator.of(context).pushNamed(AppRoutes.LOGIN)),
          /*_createItem(Icons.exit_to_app, 'Sair',
              () => Navigator.of(context).pushNamed(AppRoutes.CONFIGURACOES)),*/
        ],
      ),
    );
  }
}
