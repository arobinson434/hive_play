import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hive_play/hive_boxes.dart';
import 'package:hive_play/product.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inventory')),
      floatingActionButton: FloatingActionButton(
        onPressed: Hive.box<Product>(productBox).clear,
        child: const Icon(
          Icons.delete,
          size: 35,
        ),
      ),
      body: ValueListenableBuilder<Box<Product>> (
              valueListenable: Hive.box<Product>(productBox).listenable(),
              builder: (BuildContext context, Box<Product> box, Widget? _) =>
                box.isEmpty ?
                const Center(child: Text('The inventory is currently empty.')) :
                ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = box.getAt(index)!;

                    return Dismissible(
                      key: ValueKey(product.id),
                      onDismissed: (DismissDirection direction) => product.delete(),
                      background: const ColoredBox(color: Colors.red),
                      child: ListTile(
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
                                onPressed: () {
                                  product.stock++;
                                  product.save(); // This is only needed to trigger the listenable
                                },
                                icon: const Icon(Icons.add)
                              ),
                              IconButton(
                                onPressed: () {
                                  product.stock--;
                                  product.save(); // Same as above, just for the listenable
                                  //box.put(index, product); // Alternative to save()
                                },
                                icon: const Icon(Icons.remove)
                              ),
                            ]
                          )
                        )
                      )
                    );
                  }
                )
            )
    );
  }
}
