import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
        child: RaisedButton(
      child: Text('Voltar'.toUpperCase()),
      onPressed: () => _onPop(context),
    ));
  }

  _onPop(BuildContext context) {
    Navigator.pop(context, 'Voltando da tela 3');
  }
}
