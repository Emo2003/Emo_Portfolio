import 'package:flutter/material.dart';
import '../../../core/resource/colors_manager.dart';
import 'grade.dart';

class EducationInfo extends StatelessWidget {
  const EducationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Text(
          'Menofia University',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 7),
        Text(
          'Bachelor of Science in Computer Science',
          style: TextStyle(
            color: AppColors.text,
            fontSize: 13,
          ),
        ),
        SizedBox(height: 7),
        Text(
          'Faculty of Computers and Information',
          style: TextStyle(
            color: AppColors.muted,
            fontSize: 11,
          ),
        ),
        SizedBox(height: 13),
        Grade(),
      ],
    );
  }
}