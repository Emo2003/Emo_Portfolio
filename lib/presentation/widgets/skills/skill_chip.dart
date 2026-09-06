import 'package:flutter/material.dart';
import '../../../core/resource/colors_manager.dart';
import '../../../data/models/skill.dart';

class SkillChip extends StatefulWidget {
  final Skill skill;

  const SkillChip({
    super.key,
    required this.skill,
  });

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hover = true;
        });
      },
      onExit: (_) {
        setState(() {
          hover = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 11,
        ),
        decoration: BoxDecoration(
          color: hover
              ? AppColors.purple.withAlpha(20)
              : AppColors.card2,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: hover
                ? AppColors.purple.withAlpha(50)
                : AppColors.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.skill.icon,
              size: 16,
              color: hover
                  ? AppColors.purpleLight
                  : AppColors.text,
            ),
            const SizedBox(width: 7),
            Text(
              widget.skill.name,
              style: TextStyle(
                color: hover
                    ? AppColors.white
                    : AppColors.text,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}