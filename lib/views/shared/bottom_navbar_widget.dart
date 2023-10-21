import 'package:flutter/material.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key, this.onTap, this.icon, this.size = 24});

  final VoidCallback? onTap;
  final IconData? icon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          width: 36,
          height: 36,
          child: Icon(
            icon,
            color: Colors.white,
            size: size,
          )),
    );
  }
}
