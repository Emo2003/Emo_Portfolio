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
          'I turn ideas into clean and practical mobile experiences.',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 26,
            height: 1.4,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 17),
        Text(
          'I am a Computer Science graduate from Menofia University '
              'with a strong passion for mobile application development. '
              'I enjoy creating Flutter applications that are responsive, '
              'maintainable, scalable and easy to use.',
          style: TextStyle(
            color: AppColors.muted,
            fontSize: 13.5,
            height: 1.9,
          ),
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
            Pill(
              icon: Icons.architecture_outlined,
              text: 'Scalable Architecture',
            ),
            Pill(
              icon: Icons.api_outlined,
              text: 'API Integration',
            ),
          ],
        ),
      ],
    );
  }
}