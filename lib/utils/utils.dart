import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}


class Utilty {
  static Future<void> openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  static Future<void> openMail() => openUrl("gmail.com");

  static Future<void> openMyLocation() =>
      openUrl("https://goo.gl/maps/");
  static Future<void> openMyPhoneNo() => openUrl("tel:+");
  static Future<void> openWhatsapp() => openUrl("https://wa.me/");
}
