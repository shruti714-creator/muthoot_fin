import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MessagingUtils {
  
  // static Future<void> shareFileOnWhatsApp(String phoneNumber, String url) async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();

  //   if (result != null) {
  //     File file = File(result.files.single.path!);
  //     try {
  //       await Share.shareXFiles(
  //         [XFile(file.path)],
  //         text: "Check out this file!",
  //       );
  //     } catch (e) {
  //       print("Error sharing file: $e");
  //     }
  //   } else {
  //     print("No file selected");
  //   }
  // }

  // static Future<void> shareFileURLOnWhatsApp(String phoneNumber, String url) async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();

  // if (result != null) {
  //   File file = File(result.files.single.path!);
    
  //   // Example URL, ideally upload and get a real one from storage (Firebase, S3, etc.)
  //   String fileUrl = "https://example.com/path/to/${file.path.split('/').last}";
    
  //   String message = "Check out this file: $fileUrl";
  //   final String whatsappUrl =
  //       "https://wa.me/$countrycode$phoneNumber?text=${Uri.encodeComponent(message)}";

  //   if (await canLaunch(whatsappUrl)) {
  //     await launch(whatsappUrl);
  //   } else {
  //     print("WhatsApp not supported");
  //   }
  // } else {
  //   print("No file selected");
  // }
  // }

  static Future<void> shareUrlOnWhatsApp(String countrycode, String phoneNumber, String websiteUrl) async {
  String message = "Check out this package: $websiteUrl";
  final String whatsappUrl = "https://wa.me/$countrycode$phoneNumber?text=${Uri.encodeComponent(message)}";

  if (await canLaunch(whatsappUrl)) {
    await launch(whatsappUrl);
  } else {
    print("WhatsApp not supported");
  }
}

  static Future<void> shareFileURLOnSMSA(String phoneNumber, String websiteUrl) async {
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: {
        'body': 'Check out this document url: $websiteUrl',
      },
    );

    try {
      if (await canLaunchUrl(smsUri)) {
        await launchUrl(smsUri);
      } else {
        print("SMS not supported");
      }
    } catch (e) {
      print("Error launching SMS: $e");
    }
  }

  static Future<void> launchWhatsApp(String whatsappUrl) async {
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      print("Not supported");
    }
  }

  static Future<void> shareFileURLOnSMSB(String phoneNumber, String websiteUrl) async {
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: {
        'body': 'Check out this document url: $websiteUrl',
      },
    );

    try {
      if (await canLaunchUrl(smsUri)) {
        await launchUrl(smsUri);
      } else {
        print("SMS not supported");
      }
    } catch (e) {
      print("Error launching SMS: $e");
    }
  }
}
