import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/providers/cart.dart';
import 'package:shopify/providers/products_provider.dart';
import 'package:shopify/screen/product_details_screen.dart';
import './screen/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsProvider>.value(
            value: ProductsProvider()),
        ChangeNotifierProvider<Cart>.value(value: Cart(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.deepPurple, accentColor: Colors.amber),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailsScreen.ref: (ctx) => ProductDetailsScreen(),
        },
      ),
    );
  }
}
