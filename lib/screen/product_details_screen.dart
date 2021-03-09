import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/providers/products_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String ref = "/product-details";

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;

    final loadedProduct =
        Provider.of<ProductsProvider>(context, listen: false).findById(id);

    return Scaffold(
        appBar: AppBar(
          title: Text(loadedProduct.title),
        ),
        body: SafeArea(
          child: Text(id),
        ));
  }
}
