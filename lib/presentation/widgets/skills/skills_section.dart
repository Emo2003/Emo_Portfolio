import 'package:flutter/material.dart';
import '../../../core/resource/colors_manager.dart';
import '../../../core/resource/constant_manager.dart';
import '../../../data_source/skills_data.dart';
import '../common/section.dart';
import 'skill_chip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      number: '02',
      title: AppStrings.skillsTitle,
      subtitle: AppStrings.skillsSubtitle,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(19),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: skills
              .map(
                (skill) => SkillChip(
              skill: skill,
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}