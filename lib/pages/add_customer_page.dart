import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/customer.dart';

class AddCustomerPage extends StatelessWidget {
  final String type;
  const AddCustomerPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('افزودن مشتری')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: controller, decoration: const InputDecoration(labelText: 'نام مشتری')),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('ذخیره'),
              onPressed: () {
                final box = Hive.box<Customer>('customers');
                box.add(Customer(name: controller.text, items: [], type: type));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
