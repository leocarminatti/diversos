import 'package:flutter/material.dart';

class Teste extends StatefulWidget {
  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
        child: ListView(
          padding: const EdgeInsets.all(40),
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[400],
              child: const Center(child: Text('Entry C')),
            ),
            Container(
              height: 50,
              color: Colors.amber[300],
              child: const Center(child: Text('Entry D')),
            ),
            Container(
              height: 50,
              color: Colors.amber[200],
              child: const Center(child: Text('Entry E')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry F')),
            ),
          ],
        ),
      ),
    );
  }
}
