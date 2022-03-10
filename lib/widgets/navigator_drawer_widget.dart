import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/components.dart';
import '../pages/about_page.dart';
import '../pages/donate_page.dart';
import '../pages/label_page.dart';
import '../pages/write_to_us_page.dart';
import 'info/build_menu_item.dart';
import 'language_picker_widget.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  final padding = const EdgeInsets.symmetric(horizontal: 20);
  final sizedBox = const SizedBox(height: 10,);

  Widget buildHeader() {
    return Container(
      padding: padding.add(const EdgeInsets.only(top: 40)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(radius: 80,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/RAWA.FM_Logo_with_circle.png'),),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: AppColors.kNavigationDrawerWidget,
        child: ListView(
          padding: padding,
          children: <Widget>[
            buildHeader(),
            BuildMenuItem(text: 'aboutButton'.tr,
              icon: Icons.sentiment_satisfied_rounded,
              onClicked:() => selectedItem(context, 0),
            ),
            sizedBox,
            BuildMenuItem(text: 'labelButton'.tr,
              icon: Icons.label_important_outline_sharp,
              onClicked:() => selectedItem(context, 1),
            ),
            sizedBox,
            BuildMenuItem(text: 'donateButton'.tr,
              icon: Icons.donut_large_outlined,
              onClicked:() => selectedItem(context, 2),
            ),
            sizedBox,
            BuildMenuItem(text: 'writeToUsButton'.tr,
              icon: Icons.support_rounded,
              onClicked:() => selectedItem(context, 3),
            ),
            sizedBox,
            const Divider(color: Colors.white70,),
            sizedBox,
            const LanguagePickerWidget(),
          ],
        ),
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    Get.back();

    switch (index) {
      case 0:
        Get.to(const AboutPage());
        break;
      case 1:
        Get.to(const LabelPage());
        break;
      case 2:
        Get.to(DonatePage());
        break;
      case 3:
        Get.to(WriteToUs());
        break;
    }
  }
}