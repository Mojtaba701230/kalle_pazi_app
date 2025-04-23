import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/customer.dart';
import 'order_page.dart';
import 'add_customer_page.dart';

class CustomerListPage extends StatelessWidget {
  final String type;
  const CustomerListPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    var customerBox = Hive.box<Customer>('customers');
    return Scaffold(
      appBar: AppBar(title: Text('لیست $type')),
      body: ValueListenableBuilder(
        valueListenable: customerBox.listenable(),
        builder: (context, Box<Customer> box, _) {
          final filtered = box.values.where((c) => c.type == type).toList();
          return ListView.builder(
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final customer = filtered[index];
              return ListTile(
                title: Text(customer.name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OrderPage(customer: customer),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddCustomerPage(type: type),
            ),
          );
        },
      ),
    );
  }
}
