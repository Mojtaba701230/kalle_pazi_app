import 'package:flutter/material.dart';
import 'customer_list_page.dart';

class SaleOrPurchasePage extends StatelessWidget {
  const SaleOrPurchasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('نوع عملیات')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text('خرید'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CustomerListPage(type: 'خرید'),
                ),
              );
            },
          ),
          ElevatedButton(
            child: const Text('فروش'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CustomerListPage(type: 'فروش'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
