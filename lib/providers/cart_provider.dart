import 'package:flutter/material.dart';
import 'package:my_shopping_app/model/cart_products.dart';
import 'package:my_shopping_app/model/product.dart';

class CartProvider extends ChangeNotifier {
  final List<CartProduct> products = [];

  void addProduct(Product product, int size) {
    products.add(CartProduct(
        size: size,
        id: product.id,
        title: product.title,
        price: product.price,
        imageUrl: product.imageUrl,
        company: product.company,
        sizes: []));
    notifyListeners();
  }

  void removeProduct(CartProduct product) {
    products.remove(product);
    notifyListeners();
  }
}
