import 'package:flutter/material.dart';
import '../../../core/resource/colors_manager.dart';

class EducationIcon extends StatelessWidget {
  const EducationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 62,
      height: 62,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.purple,
            AppColors.purpleLight,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(
        Icons.school_rounded,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}