import 'package:flutter/material.dart';

class RealEstatePage extends StatefulWidget {
  const RealEstatePage({Key? key}) : super(key: key);

  @override
  _RealEstatePageState createState() => _RealEstatePageState();
}

class _RealEstatePageState extends State<RealEstatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.indigo[50],
          elevation: 0,
          title: const Text('Real Estate'),
        ),
        body: Container());
  }
}
