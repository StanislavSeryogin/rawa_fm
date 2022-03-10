import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppComponents{
  final divider = const Divider(
    thickness: 3,
    color: Colors.white,
    indent: 15,
    endIndent: 15,);

  final dividerGrey = const Divider(
    thickness: 3,
    color: Colors.white70,
    indent: 15,
    endIndent: 15,);

  Future<void>? launched;

  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}