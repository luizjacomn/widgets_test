import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets_test/src/pages/list_view_page.dart';
import 'package:widgets_test/src/pages/page_2.dart';
import 'package:widgets_test/src/pages/page_3.dart';
import 'package:widgets_test/src/utils/nav.dart';
import 'package:widgets_test/src/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:widgets_test/src/widgets/drawer_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: Platform.isIOS ? true : false,
            title: Text(
              'Hello Flutter',
              style: TextStyle(
                color: Colors.yellowAccent,
              ),
            ),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(child: Text('Tab 1')),
                Tab(child: Text('Tab 2')),
              ],
            )),
        body: TabBarView(
          children: <Widget>[
            _buildBody(context),
            Container(),
          ],
        ),
        drawer: DrawerList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          onPressed: _clickFab,
        ),
      ),
    );
  }

  _clickFab() {
    print('fab');
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
    return Builder(
      builder: (context) => Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  BlueButton(
                      'ListView', () => _navigate(context, ListViewPage())),
                  BlueButton('Page 2', () => _navigate(context, Page2())),
                  BlueButton('Page 3', () => _navigate(context, Page3())),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  BlueButton('Snack', () => _snack(context)),
                  BlueButton('Dialog', () => _dialog(context)),
                  BlueButton('Toast', _toast),
                ],
              ),
            ],
          ),
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

  void _snack(context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Snack bar'),
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.yellowAccent,
          onPressed: () {},
        ),
      ),
    );
  }

  void _dialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            content: Text('Dialog'),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () => pop(context),
              )
            ],
          ),
        );
      },
    );
  }

  void _toast() {
    Fluttertoast.showToast(
        msg: 'Toast',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 12.0);
  }
}
