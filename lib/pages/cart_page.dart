import 'package:flutter/material.dart';
import 'package:my_shopping_app/model/cart_products.dart';
import 'package:my_shopping_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CartProduct> products =
        Provider.of<CartProvider>(context).products;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final CartProduct product = products[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(product.imageUrl),
              ),
              title: Text(product.title),
              subtitle: Text(product.size.toString()),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              'Are you sure you want to delete this product'),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No')),
                            ElevatedButton(
                                onPressed: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .removeProduct(product);
                                  Navigator.pop(context);
                                },
                                child: const Text('Yes')),
                          ],
                        );
                      });
                },
              ),
            );
          }),
    );
  }
}
