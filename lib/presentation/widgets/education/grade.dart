import 'package:flutter/material.dart';
import '../../../core/resource/colors_manager.dart';

class Grade extends StatelessWidget {
  const Grade({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.green.withAlpha(30),
        borderRadius: BorderRadius.circular(7),
      ),
      child: const Text(
        'Grade: Very Good',
        style: TextStyle(
          color: AppColors.green,
          fontSize: 9,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}