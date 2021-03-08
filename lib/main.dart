import 'package:flutter/material.dart';
import './screen/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepPurple, accentColor: Colors.amber),
      home: ProductsOverviewScreen(),
    );
  }
}
