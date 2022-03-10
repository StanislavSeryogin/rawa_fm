import 'package:flutter/material.dart';

class LauncherIconButton extends StatelessWidget {
  const LauncherIconButton({
    required this.icon, required this.onPressed
  });

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(
        icon,
        color: Colors.white,
        size: 50.0,
      ),
      onPressed: onPressed,
    );
  }
}