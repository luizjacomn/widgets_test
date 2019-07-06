import 'package:flutter/material.dart';
import 'package:widgets_test/src/utils/nav.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('email'),
              accountName: Text('name'),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white, child: FlutterLogo()),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Item 1'),
              subtitle: Text('Item 1'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Item 1'),
              subtitle: Text('Item 1'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Item 1'),
              subtitle: Text('Item 1'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              onTap: () => pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
