import 'package:flutter/material.dart';

class ProductSalesPage extends StatelessWidget {
  const ProductSalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Sales'),
      ),
      body: const Center(
        child: Text('Display product sales data here.'),
      ),
    );
  }
}
