import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/components.dart';
import '../components/components_app/app_components.dart';

class LabelPage extends StatefulWidget {
  const LabelPage({Key? key}) : super(key: key);

  @override
  State<LabelPage> createState() => _LabelPageState();
}

class _LabelPageState extends State<LabelPage> {

  final divider = AppComponents().divider;
  var launched = AppComponents().launched;
  final launchURL = AppComponents().launchURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('RAWA MUSIC',
                style: AppTextStyle.kHeadingTextStyle,),
            ],
          ),
          divider,
          TextButton(
              onPressed: () => setState(() {
                launched = launchURL(AppLinks.urlRawaMusic);
              }),
              child: Text('homePage'.tr,
                style: AppTextStyle.kArtistTextStyle,)),
          const SizedBox(height: 10,),
          TextButton(
              onPressed: () => setState(() {
                launched = launchURL(AppLinks.urlReleases);
              }),
              child: Text('releases'.tr,
                style: AppTextStyle.kArtistTextStyle,)),
          const SizedBox(height: 10,),
          TextButton(
              onPressed: () => setState(() {
                launched = launchURL(AppLinks.urlDoc);
              }),
              child: Text('doc'.tr,
                style: AppTextStyle.kArtistTextStyle,)),
        ],
      ),
    );
  }
}