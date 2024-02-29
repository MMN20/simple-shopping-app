import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_shopping_app/model/product.dart';
import 'package:my_shopping_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Details',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              widget.product.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(widget.product.imageUrl),
            ),
            const Spacer(
              flex: 1,
            ),
            Container(
              height: 280,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text('\$' + widget.product.price.toString(),
                        style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.product.sizes.length,
                          itemBuilder: (context, index) {
                            int size = widget.product.sizes[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  selectedSize = size;
                                  setState(() {});
                                },
                                child: Chip(
                                  backgroundColor: size == selectedSize
                                      ? Colors.amber
                                      : null,
                                  padding: const EdgeInsets.all(10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  label: Text(
                                    size.toString(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                        minimumSize: MaterialStatePropertyAll(
                          Size(double.infinity, 40),
                        ),
                      ),
                      onPressed: () {
                        if (selectedSize != 0) {
                          final product =
                              Provider.of<CartProvider>(context, listen: false);
                          product.addProduct(widget.product, selectedSize);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Product added successfully')));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please select a size')));
                        }
                      },
                      child: const Text(
                        'Add to cart',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
