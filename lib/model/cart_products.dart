import 'package:my_shopping_app/model/product.dart';

class CartProduct extends Product {
  final int size;

  CartProduct(
      {required this.size,
      required super.id,
      required super.company,
      required super.sizes,
      required super.title,
      required super.price,
      required super.imageUrl});
}
