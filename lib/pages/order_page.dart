import 'package:flutter/material.dart';
import '../models/customer.dart';
import '../models/item.dart';

class OrderPage extends StatefulWidget {
  final Customer customer;
  const OrderPage({super.key, required this.customer});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  void addItem() {
    final item = Item(
      name: nameController.text,
      quantity: int.tryParse(quantityController.text) ?? 0,
      unitPrice: double.tryParse(priceController.text) ?? 0,
    );
    setState(() {
      widget.customer.items.add(item);
      widget.customer.save();
      nameController.clear();
      quantityController.clear();
      priceController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.customer.items;
    return Scaffold(
      appBar: AppBar(title: Text('سفارش ${widget.customer.name}')),
      body: Column(
        children: [
          TextField(controller: nameController, decoration: const InputDecoration(labelText: 'نام کالا')),
          TextField(controller: quantityController, decoration: const InputDecoration(labelText: 'تعداد')),
          TextField(controller: priceController, decoration: const InputDecoration(labelText: 'قیمت واحد')),
          ElevatedButton(onPressed: addItem, child: const Text('افزودن')),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, i) {
                final item = items[i];
                return ListTile(
                  title: Text('${item.name}'),
                  subtitle: Text('تعداد: ${item.quantity} - قیمت: ${item.unitPrice}'),
                  trailing: Text('جمع: ${(item.quantity * item.unitPrice).toStringAsFixed(2)}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

