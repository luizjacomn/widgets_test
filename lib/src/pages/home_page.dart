import 'dart:io';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: Platform.isIOS ? true : false,
        title: Text(
          'Hello Flutter',
          style: TextStyle(
            color: Colors.yellowAccent,
          ),
        ),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
      child: Center(
        child: _button(),
      ),
    );
  }

  _buildChild() {
    return SizedBox.expand(
      child: Image.asset(
        'assets/images/dog5.png',
        fit: BoxFit.cover,
      ),
    );
  }

  _button() {
    return RaisedButton(
      color: Colors.blue,
      textColor: Colors.white,
      child: Text('Clique'.toUpperCase()),
      onPressed: () {},
    );
  }
}
