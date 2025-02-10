import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:muthoot_fin/app_screens/Dashboard/all_zones_chart.dart';
import 'package:muthoot_fin/app_screens/Dashboard/all_zones_screen.dart';
import 'package:muthoot_fin/app_screens/Dashboard/customer_growth_chart.dart';
import 'package:muthoot_fin/app_screens/Dashboard/customer_growth_screen.dart';
import 'package:muthoot_fin/app_screens/Dashboard/product_sales_screen.dart';
import 'package:muthoot_fin/app_screens/Dashboard/product_sales_chart.dart';
import 'package:muthoot_fin/utils/messaging_utils.dart';
// import 'package:url_launcher/url_launcher.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  final String countrycode = "91";
  final String phoneNumber = "9422460119";
  final String phoneNumberB = "9766509216";
  String get whatsappUrl => "https://wa.me/$countrycode$phoneNumber?text=Hi%20there";
  final String websiteUrl = "https://pub.dev/packages/share_plus";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AllZonesPage()),
              ),
              child: const AllZonesChart(
                title: 'All Zones',
                value: 'View Zones',
                icon: Icons.map,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductSalesPage()),
              ),
              child: const ProductSalesChart(
                title: 'Product Sales',
                value: 'View Product Sales',
                icon: Icons.map,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CustomerGrowthPage()),
              ),
              child: const CustomerGrowthChart(
                title: 'Customer Growth',
                value: 'View Customer Growth',
                icon: Icons.map,
                color: Colors.purple,
              ),
            ),
            ///////
            // const SizedBox(height: 8),
            // ElevatedButton(
            //   onPressed: _shareFileOnWhatsApp,
            //   child: const Text("Select and Share File Via Whatsapp"),
            // ),
            // const SizedBox(height: 8),
            // ElevatedButton(
            //   onPressed: _shareFileURLOnWhatsApp,
            //   child: const Text("File URL from Whatsapp to User A"),
            // ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => MessagingUtils.shareUrlOnWhatsApp(
                countrycode,
                phoneNumber,
                websiteUrl,
              ),
              child: const Text("Share URL from Whatsapp to User A"),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => MessagingUtils.shareFileURLOnSMSA(
                phoneNumber,
                websiteUrl,
              ),
              child: const Text("Send URL from SMS to User A"),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => MessagingUtils.shareFileURLOnSMSB(
                phoneNumberB,
                websiteUrl,
              ),
              child: const Text("Send URL from SMS to User B"),
            ),
          ],
        ),
      ),
      ///////
      floatingActionButton: FloatingActionButton(
        onPressed: () => MessagingUtils.launchWhatsApp(whatsappUrl),
        backgroundColor: Colors.green,
        child: Image.asset('assets/images/whatsapp_logo.png'),
      ),
    );
  }
}
