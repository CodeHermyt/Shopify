import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/providers/product.dart';
import 'package:shopify/screen/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedProduct = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailsScreen.ref,
              arguments: selectedProduct.id,
            );
          },
          child: Image.network(
            selectedProduct.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(selectedProduct.title),
          leading: IconButton(
            icon: Icon(
              selectedProduct.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              //size: 15,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {
              selectedProduct.toggleFavoriteStatus();
            },
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              //size: 15,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
