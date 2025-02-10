import 'package:flutter/material.dart';

class CustomerGrowthPage extends StatelessWidget {
  const CustomerGrowthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Growth'),
      ),
      body: const Center(
        child: Text('Display customer growth analytics here.'),
      ),
    );
  }
}
