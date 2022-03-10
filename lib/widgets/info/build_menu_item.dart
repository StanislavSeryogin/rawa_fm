import 'package:flutter/material.dart';

import '../../components/components.dart';

class BuildMenuItem extends StatelessWidget {
  const BuildMenuItem({Key? key,
    required this.text, required this.icon, this.onClicked}) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback? onClicked;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.kIconColor, size: 30,),
      title: Text(text, style: const TextStyle(
          color: AppColors.kTextColor, fontSize: 23),),
      hoverColor: AppColors.kInactiveColor,
      onTap: onClicked,
    );
  }
}