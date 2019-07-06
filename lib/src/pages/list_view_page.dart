import 'package:flutter/material.dart';
import 'package:widgets_test/src/pages/dog_page.dart';
import 'package:widgets_test/src/utils/nav.dart';

class Dog {
  String name;
  String imgUrl;

  Dog(this.name, this.imgUrl);
}

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  bool isList = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setState(() {
                isList = true;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              setState(() {
                isList = false;
              });
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog('Doguinho', 'assets/images/dog1.png'),
      Dog('Dogão', 'assets/images/dog2.png'),
      Dog('Doguenho', 'assets/images/dog3.png'),
      Dog('Dogãozão', 'assets/images/dog4.png'),
      Dog('Dog', 'assets/images/dog5.png'),
    ];

    return isList
        ? ListView.builder(
            itemExtent: 300,
            itemCount: dogs.length,
            itemBuilder: (context, index) {
              return _buildItems(dogs, index);
            },
          )
        : GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: dogs.length,
            itemBuilder: (context, index) {
              return _buildItems(dogs, index);
            },
          );
  }

  _buildItems(List<Dog> dogs, int index) {
    return GestureDetector(
      onTap: () {
        push(context, DogPage(dog: dogs[index]));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: dogs[index].name,
            child: _image(dogs[index].imgUrl),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                dogs[index].name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _image(String img) => Image.asset(img, fit: BoxFit.cover);
}
