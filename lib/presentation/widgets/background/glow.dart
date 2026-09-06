import 'package:flutter/material.dart';
import '../../../core/resource/colors_manager.dart';

class Glow extends StatelessWidget {
  final double size;
  final double opacity;

  const Glow({
    super.key,
    required this.size,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.purple.withAlpha((opacity * 255).toInt(),
      ),)
    );
  }
}