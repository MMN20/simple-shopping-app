import 'package:flutter/material.dart';
import 'package:my_shopping_app/model/product.dart';
import 'package:my_shopping_app/pages/product_details.dart';
import 'package:my_shopping_app/widgets/filter_button.dart';
import 'package:my_shopping_app/widgets/product_card.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  List<String> filters = ['All', 'Adidas', 'Nike', 'Bata'];
  int selectedFilter = 0;
  List<Product> products = Product.getAllRpoducts();

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(width: 0.1),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(40)),
    );
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Shoes\nCollection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                child: TextField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    focusedBorder: border,
                    border: border,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 90,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = index;
                        });
                      },
                      child: FilterButton(
                        filters: filters,
                        index: index,
                        selectedFilter: selectedFilter,
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => ProductDetails(
                                  product: products[index],
                                )),
                          ),
                        );
                      },
                      child: ProductCard(
                        product: products[index],
                        index: index,
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
