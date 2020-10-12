import 'package:FisioApp/widget/mainDrawer.dart';
import 'package:flutter/material.dart';

class FichasView extends StatefulWidget {
  @override
  _FichasViewState createState() => _FichasViewState();
}

class _FichasViewState extends State<FichasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        title: Center(
          child: Text(
            'Fichas',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          Container(
            child: Text('porrraa'),
          ),
        ],
      )),
    );
  }
}
