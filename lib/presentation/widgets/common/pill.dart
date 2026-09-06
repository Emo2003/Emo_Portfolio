import 'package:flutter/material.dart';
import '../../../core/resource/colors_manager.dart';

class Pill extends StatelessWidget {
  final IconData icon;
  final String text;

  const Pill({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppColors.purpleLight,
            size: 14,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: AppColors.text,
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }
}