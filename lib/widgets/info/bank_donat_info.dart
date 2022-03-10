import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawa_fm/components/components.dart';

class BankDonatInfo extends StatelessWidget {
  const BankDonatInfo({
    Key? key,
    required this.nameBank,
    required this.numCardBank,
    required this.pathIconBank,
  }) : super(key: key);

  final String nameBank;
  final String numCardBank;
  final String pathIconBank;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.defaultDialog(
            backgroundColor: AppColors.kNavigationDrawerWidget,
            title: nameBank,
            titlePadding: const EdgeInsets.only(top: 15),
            titleStyle: const TextStyle(
                color: AppColors.kTitleAndPlayAndBufferingColor),
            content: Column(
              children: [
                const Divider(
                  thickness: 2,
                  color: Colors.white70,
                  indent: 15,
                  endIndent: 15,),
                Text(numCardBank, style: AppTextStyle.kCurrentTextStyle,),
                const SizedBox(height: 10,),
                Text('nameOwnerCard'.tr,
                  style: AppTextStyle.kCurrentTextStyle,),
              ],
            )
        );
      },
      icon: Image.asset(pathIconBank),
      iconSize: MediaQuery.of(context).size.width * 0.2,
    );
  }
}