import 'package:flutter/material.dart';
import 'package:hive_play/product.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    required this.products,
    super.key,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    products[index].title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(products[index].category.name),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('(${products[index].stock}) \$${products[index].price.toString()}'),
                  TextButton(onPressed: () {}, child: const Text('Add')),
                ],
              ),
            ],
          ),
        ), // Padding
      ),
    );
  }
}
