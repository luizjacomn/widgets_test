import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets_test/src/pages/list_view_page.dart';
import 'package:widgets_test/src/pages/page_2.dart';
import 'package:widgets_test/src/pages/page_3.dart';
import 'package:widgets_test/src/utils/nav.dart';
import 'package:widgets_test/src/widgets/blue_button.dart';

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
            BlueButton('ListView', () => _navigate(context, ListViewPage())),
            BlueButton('Page 2', () => _navigate(context, Page2())),
            BlueButton('Page 3', () => _navigate(context, Page3())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BlueButton('Snack', _snack),
            BlueButton('Dialog', _dialog),
            BlueButton('Toast', _toast),
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
    String msg = await push(context, page);
    print('>> $msg');
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
