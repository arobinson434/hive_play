import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hive_play/hive_boxes.dart';
import 'package:hive_play/product.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Hive.box<Product>(productBox).values;

    return Scaffold(
      appBar: AppBar(title: const Text('Inventory')),
      body: products.isEmpty
          ? const Center(child: Text('The inventory is currently empty.'))
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products.toList()[index];

                return ListTile(
                  leading: Text(
                    product.stock.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  title: Text(product.title),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add)
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove)
                        ),
                      ]
                    )
                  )
                );
              }
          )
    );
  }
}
