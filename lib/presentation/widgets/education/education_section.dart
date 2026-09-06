import 'package:flutter/material.dart';
import '../../../core/resource/colors_manager.dart';
import '../common/section.dart';
import 'education_icon.dart';
import 'education_info.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool desktop = MediaQuery.sizeOf(context).width >= 800;

    return Section(
      number: '04',
      title: 'Education',
      subtitle: 'My academic background.',
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: desktop
            ? const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EducationIcon(),
            SizedBox(width: 22),
            Expanded(
              child: EducationInfo(),
            ),
          ],
        )
            : const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EducationIcon(),
            SizedBox(height: 20),
            EducationInfo(),
          ],
        ),
      ),
    );
  }
}