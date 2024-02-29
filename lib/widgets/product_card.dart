import 'package:flutter/material.dart';
import 'package:my_shopping_app/model/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.index, required this.product});
  final int index;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: 270,
        decoration: BoxDecoration(
            color: index.isEven ? Colors.blue[50] : Colors.grey[200],
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '\$${product.price.toString()}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Center(
              child: Image.asset(
                '${product.imageUrl}',
                height: 180,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}
