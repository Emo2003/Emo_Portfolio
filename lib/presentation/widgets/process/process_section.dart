import 'package:flutter/material.dart';

import '../../../core/resource/colors_manager.dart';
import '../../widgets/common/section.dart';

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = [
      {
        'number': '01',
        'title': 'Understand',
        'detail': 'Clarify requirements, user needs, and product goals before writing code.',
      },
      {
        'number': '02',
        'title': 'Design',
        'detail': 'Create clean, responsive interfaces that prioritize usability and clarity.',
      },
      {
        'number': '03',
        'title': 'Architecture',
        'detail': 'Structure the app with maintainable patterns and scalable code organization.',
      },
      {
        'number': '04',
        'title': 'Develop',
        'detail': 'Build features with Flutter and Dart using practical, production-focused solutions.',
      },
      {
        'number': '05',
        'title': 'Integrate',
        'detail': 'Connect APIs, Firebase, authentication, and real application services.',
      },
      {
        'number': '06',
        'title': 'Improve',
        'detail':
            'Refine UX, fix issues, and strengthen quality through iteration.',
      },
    ];

    return Section(
      number: '10',
      title: 'Development Approach',
      subtitle: 'A structured process for turning ideas into reliable mobile experiences.',
      child: Column(
        children: [
          for (int i = 0; i < steps.length; i++) ...[
            _ProcessStep(
              number: steps[i]['number']!,
              title: steps[i]['title']!,
              detail: steps[i]['detail']!,
            ),
            if (i != steps.length - 1) const SizedBox(height: 14),
          ],
        ],
      ),
    );
  }
}

class _ProcessStep extends StatelessWidget {
  final String number;
  final String title;
  final String detail;

  const _ProcessStep({
    required this.number,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                colors: [
                  AppColors.purple.withAlpha(34),
                  AppColors.purple.withAlpha(18),
                ],
              ),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: AppColors.purpleLight,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  detail,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 13,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
