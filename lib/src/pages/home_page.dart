import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets_test/src/pages/page_2.dart';
import 'package:widgets_test/src/pages/page_3.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(context),
        ],
      ),
    );
  }

  Container _pageView() {
    return Container(
      height: 300,
      child: PageView(
        children: <Widget>[
          _image('assets/images/dog1.png'),
          _image('assets/images/dog2.png'),
          _image('assets/images/dog3.png'),
          _image('assets/images/dog4.png'),
          _image('assets/images/dog5.png'),
        ],
      ),
    );
  }

  _buttons(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button(context, 'ListView', _listView),
            _button(context, 'Page 2', () => _navigate(context, Page2())),
            _button(context, 'Page 3', () => _navigate(context, Page3())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button(context, 'Snack', _snack),
            _button(context, 'Dialog', _dialog),
            _button(context, 'Toast', _toast),
          ],
        ),
      ],
    );
  }

  _image(String img) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Center(
        child: Image.asset(
          img,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _button(BuildContext context, String text, Function onPressed) {
    return RaisedButton(
      color: Colors.blue,
      textColor: Colors.yellowAccent,
      child: Text(text.toUpperCase()),
      onPressed: onPressed,
    );
  }

  _text() {
    return Text(
      'Dogs',
      style: TextStyle(
        color: Colors.blue,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Future _navigate(BuildContext context, Widget page) async {
    String msg = await Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
    print('>> $msg');
  }

  void _listView() {
    print('list view');
  }

  void _snack() {
    print('snack');
  }

  void _dialog() {
    print('dialog');
  }

  void _toast() {
    print('toast');
  }
}
