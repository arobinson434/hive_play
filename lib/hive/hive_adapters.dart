import 'package:hive_ce/hive.dart';
import 'package:hive_play/product.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<Product>(),
  AdapterSpec<Categories>()
])

class HiveAdapters {}
