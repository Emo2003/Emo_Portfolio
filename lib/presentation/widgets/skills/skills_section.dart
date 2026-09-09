import 'package:flutter/material.dart';

import '../../../core/resource/colors_manager.dart';
import '../../../core/resource/constant_manager.dart';
import '../../../data/models/skill.dart';
import '../../../data_source/skills_data.dart';
import '../common/section.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = <String>{for (final skill in skills) skill.category}
        .toList();

    return Section(
      number: '02',
      title: AppStrings.skillsTitle,
      subtitle: AppStrings.skillsSubtitle,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= 850;

          return Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              for (int i = 0; i < categories.length; i++)
                SizedBox(
                  width: isDesktop
                      ? (constraints.maxWidth - 16) / 2
                      : constraints.maxWidth,
                  child: _SkillCategory(
                    index: i + 1,
                    title: categories[i],
                    items: skills
                        .where((skill) => skill.category == categories[i])
                        .toList(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _SkillCategory extends StatelessWidget {
  final int index;
  final String title;
  final List<Skill> items;

  const _SkillCategory({
    required this.index,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 22),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                index.toString().padLeft(2, '0'),
                style: const TextStyle(
                  color: AppColors.purple,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(child: Container(height: 1, color: AppColors.border)),
            ],
          ),
          const SizedBox(height: 17),
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: AppColors.text,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 17),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [for (final skill in items) _SkillItem(skill: skill)],
          ),
        ],
      ),
    );
  }
}

class _SkillItem extends StatefulWidget {
  final Skill skill;

  const _SkillItem({required this.skill});

  @override
  State<_SkillItem> createState() => _SkillItemState();
}

class _SkillItemState extends State<_SkillItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (_) {
        setState(() => _hovered = true);
      },
      onExit: (_) {
        setState(() => _hovered = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _hovered ? -1 : 0, 0),
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
        decoration: BoxDecoration(
          color: _hovered
              ? AppColors.purple.withAlpha(14)
              : AppColors.white.withAlpha(3),
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: _hovered ? AppColors.purple.withAlpha(90) : AppColors.border,
          ),
        ),
        child: Text(
          widget.skill.name,
          style: TextStyle(
            color: _hovered ? AppColors.purpleLight : AppColors.text,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
