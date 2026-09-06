import 'package:flutter/material.dart';
import '../../../core/resource/colors_manager.dart';

class YearBadge extends StatelessWidget {
  const YearBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: AppColors.purple.withAlpha(30),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.purple.withAlpha(30),
        ),
      ),
      child: const Text(
        '2022 — 2026',
        style: TextStyle(
          color: AppColors.purpleLight,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}