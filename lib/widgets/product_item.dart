import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/providers/cart.dart';
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
            title: Text(
              selectedProduct.title,
              style: TextStyle(fontSize: 12),
            ),
            leading: IconButton(
              iconSize: 20,
              padding: EdgeInsets.all(2),
              splashRadius: 12,
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
            trailing: Consumer<Cart>(
              builder: (_, cart, ch) => IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  //size: 15,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () {
                  cart.addItemToCart(selectedProduct.id, selectedProduct.price,
                      selectedProduct.title);
                },
              ),
            )),
      ),
    );
  }
}
