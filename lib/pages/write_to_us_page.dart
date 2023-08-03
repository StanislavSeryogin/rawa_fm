import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../components/components.dart';
import '../components/components_app/app_components.dart';
import '../widgets/launcher_icon_button.dart';

class WriteToUs extends StatefulWidget {

  @override
  _WriteToUsState createState() => _WriteToUsState();
}

class _WriteToUsState extends State<WriteToUs> {
  final dividerGrey = AppComponents().dividerGrey;
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
          Container(
            margin: const EdgeInsets.fromLTRB(70, 10, 10, 10),
            child: Text(
              'writeToUs'.tr,
              style: AppTextStyle.kHeadingTextStyle,
            ),
          ),
          const CircleAvatar(radius: 80,
            backgroundImage: AssetImage('assets/photo_VM.jpg'),),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text(
              'projectManager'.tr,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text(
              'namePM'.tr,
              style: AppTextStyle.kCurrentTextStyle,
            ),
          ),
          dividerGrey,
          const SizedBox(height: 15,),
          const Text(
            'Email: rawamusiclabel@gmail.com',
            style: TextStyle(fontSize: 20, color: Colors.white,),
          ),
          const SizedBox(height: 15,),
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
            ],
          ),
        ],
      ),
    );
  }
}
