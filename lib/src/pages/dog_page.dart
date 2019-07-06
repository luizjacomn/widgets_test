import 'package:flutter/material.dart';
import 'package:widgets_test/src/pages/list_view_page.dart';

class DogPage extends StatelessWidget {
  final Dog dog;

  const DogPage({this.dog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.name),
      ),
      body: Hero(
        tag: dog.name,
        child: Image.asset(
          dog.imgUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
