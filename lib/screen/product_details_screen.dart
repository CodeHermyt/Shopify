import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String ref = "/product-details";
  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("The Product Details"),
        ),
        body: SafeArea(
          child: Text(id),
        ));
  }
}
