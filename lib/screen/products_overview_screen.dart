import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/providers/cart.dart';
import 'package:shopify/widgets/badge.dart';
import 'package:shopify/widgets/product_grid.dart';

enum SelectionMode {
  Favorite,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showFavoritesOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Shopify"),
        actions: [
          PopupMenuButton(
            onSelected: (SelectionMode flag) {
              setState(
                () {
                  if (flag == SelectionMode.Favorite) {
                    _showFavoritesOnly = true;
                  } else {
                    _showFavoritesOnly = false;
                  }
                },
              );
            },
            itemBuilder: (ctx) {
              return [
                PopupMenuItem(
                    child: Text("Favorites"), value: SelectionMode.Favorite),
                PopupMenuItem(child: Text("All"), value: SelectionMode.All),
              ];
            },
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              color: Colors.red,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ProductGrid(_showFavoritesOnly),
      ),
    );
  }
}
