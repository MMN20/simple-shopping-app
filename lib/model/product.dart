import 'product_json.dart';

class Product {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final String company;
  final List<int> sizes;

  Product({
    required this.id,
    required this.company,
    required this.sizes,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  static List<Product> getAllRpoducts() {
    final products = ProductJson.getAllProductsFromJSON();
    List<Product> list = [];

    for (Map<String, Object> map in products) {
      list.add(
        Product(
            id: map['id'] as String,
            title: map['title'] as String,
            price: map['price'] as double,
            imageUrl: map['imageUrl'] as String,
            company: map['company'] as String,
            sizes: map['sizes'] as List<int>),
      );
    }
    return list;
  }
}
