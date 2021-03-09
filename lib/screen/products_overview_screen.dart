import 'package:flutter/material.dart';
import 'package:shopify/widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Shopify"),
      ),
      body: SafeArea(
        child: ProductGrid(),
      ),
    );
  }
}
