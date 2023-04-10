
import 'package:flutter/material.dart';
import'package:flutter/';
class Item1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title:Text('kennrix'),
    ),
      body: Center(
        child: Text('This is the Item 1 screen.'),
      ),
    );
  }
}

class Item2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item 2'),
      ),
      body: Center(
        child: Text('This is the Item 2 screen.'),
      ),
    );
  }
}

class Item3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item 3'),
      ),
      body: Center(
        child: Text('This is the Item 3 screen.'),
      ),
    );
  }
}

class Item4Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item 4'),
      ),
      body: Center(
        child: Text('this is the item 4'),
      ),
    );
  }
}
