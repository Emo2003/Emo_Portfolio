import 'package:flutter/material.dart';

import '../../../core/resource/colors_manager.dart';
import '../common/pill.dart';

class AboutText extends StatelessWidget {
  const AboutText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I build clean, responsive mobile experiences with a strong focus on usability and maintainability.',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 26,
            height: 1.4,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 17),
        Text(
          'I am a Computer Science graduate with a strong interest in mobile app development and a growing focus on Flutter engineering. '
          'I enjoy building applications that are not only visually polished but also structured, scalable, and easy to maintain. '
          'My work is guided by clean architecture, practical state management, and thoughtful user experience decisions.',
          style: TextStyle(color: AppColors.muted, fontSize: 13.5, height: 1.9),
        ),
        SizedBox(height: 22),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            Pill(
              icon: Icons.phone_android_outlined,
              text: 'Mobile Development',
            ),
            Pill(icon: Icons.architecture_outlined, text: 'Clean Architecture'),
            Pill(icon: Icons.api_outlined, text: 'API Integration'),
          ],
        ),
      ],
    );
  }
}
