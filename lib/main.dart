import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());


class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Despesas Pesoais')),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Gráfico'),
              elevation: 5,
            ),
          ),
          Card(
            child: Text('Lita de Transações')
          )
        ],
      )
    );
  }
}