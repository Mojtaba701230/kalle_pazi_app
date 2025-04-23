import 'package:hive/hive.dart';
import 'item.dart';

part 'customer.g.dart';

@HiveType(typeId: 0)
class Customer extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  List<Item> items;

  @HiveField(2)
  String type; // خرید یا فروش

  Customer({required this.name, required this.items, required this.type});
}
