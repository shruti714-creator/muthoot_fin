import 'package:flutter/material.dart';

class AllZonesPage extends StatelessWidget {
  const AllZonesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Zones'),
      ),
      body: const Center(
        child: Text('Display all zones information here.'),
      ),
    );
  }
}
