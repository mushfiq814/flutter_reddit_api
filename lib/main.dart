import 'package:flutter/material.dart';
import './Screens/Home/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reddit Demo',
      theme: ThemeData(fontFamily: 'Lato'),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reddit')
        ),
        body: Home(),
      ),
    );
  }
}
