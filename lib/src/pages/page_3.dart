import 'package:flutter/material.dart';
import 'package:widgets_test/src/utils/nav.dart';
import 'package:widgets_test/src/widgets/blue_button.dart';

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
      child: BlueButton(
        'Voltar',
        () => _onPop(context),
      ),
    );
  }

  _onPop(BuildContext context) {
    pop(context, toReturn: 'Voltando da tela 3');
  }
}
