import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/customer.dart';
import 'models/item.dart';
import 'pages/sale_or_purchase_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CustomerAdapter());
  Hive.registerAdapter(ItemAdapter());
  await Hive.openBox<Customer>('customers');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalle Pazi App',
      home: const SaleOrPurchasePage(),
    );
  }
}
