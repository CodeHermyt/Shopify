import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/providers/product.dart';
import 'package:shopify/providers/products_provider.dart';
import 'package:shopify/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavorites;
  ProductGrid(this.showFavorites);
  @override
  Widget build(BuildContext context) {
    final productDatas = Provider.of<ProductsProvider>(context);
    final products = showFavorites? productDatas.favoritesonly: productDatas.items;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (ctx, i) {
        return ChangeNotifierProvider<Product>.value(
          value: products[i],
          child: ProductItem(),
        );
      },
    );
  }
}
