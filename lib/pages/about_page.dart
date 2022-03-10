import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../components/components.dart';
import '../components/components_app/app_components.dart';
import '../widgets/launcher_icon_button.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  final divider = AppComponents().divider;
  var launched = AppComponents().launched;
  final launchURL = AppComponents().launchURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('about'.tr, style: AppTextStyle.kHeadingTextStyle),
          const SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Text('aboutText'.tr,
                style: AppTextStyle.kCurrentTextStyle),
          ),
          divider,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LauncherIconButton(
                  icon: FontAwesomeIcons.vk,
                  onPressed: () => setState(() {
                    launched = launchURL(AppLinks.urlVk);})),
              LauncherIconButton(
                  icon: FontAwesomeIcons.facebook,
                  onPressed: () => setState(() {
                    launched = launchURL(AppLinks.urlFb);})),
              LauncherIconButton(
                  icon: FontAwesomeIcons.telegram,
                  onPressed: () => setState(() {
                    launched = launchURL(AppLinks.urlTlg);})),
              LauncherIconButton(
                  icon: FontAwesomeIcons.instagram,
                  onPressed: () => setState(() {
                    launched = launchURL(AppLinks.urlInst);})),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LauncherIconButton(
                  icon: FontAwesomeIcons.mixcloud,
                  onPressed: () => setState(() {
                    launched = launchURL(AppLinks.urlMC);})),
              LauncherIconButton(
                  icon: FontAwesomeIcons.soundcloud,
                  onPressed: () => setState(() {
                    launched = launchURL(AppLinks.urlSC);})),
              LauncherIconButton(
                  icon: FontAwesomeIcons.youtube,
                  onPressed: () => setState(() {
                    launched = launchURL(AppLinks.urlYT);})),
            ],
          )
        ],
      ),
    );
  }
}
