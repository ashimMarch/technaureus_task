
import 'package:flutter/material.dart';

import '../../resources/color_res.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.size,
    this.backgroundColor,
    this.elevation,
  });

  final VoidCallback? onPressed;
  final Size? size;
  final Widget icon;
  final Color? backgroundColor;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Palette.primaryColor,
        shape: const CircleBorder(),
        minimumSize: size ?? const Size(27, 27),
        maximumSize: size ?? const Size(27, 27),
        padding: const EdgeInsets.all(0),
        elevation: elevation ?? 1,
      ),
      child: icon,
    );
  }
}

