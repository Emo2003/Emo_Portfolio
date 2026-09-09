import 'package:flutter/material.dart';

import '../../../core/resource/colors_manager.dart';
import '../../widgets/common/section.dart';

class TrainingSection extends StatelessWidget {
  const TrainingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'Route Academy',
        'detail': 'Practical Flutter learning journey focused on building real interfaces, app logic, and product thinking.',
      },
      {
        'title': 'Sprints × Microsoft',
        'detail': 'Structured technical learning experience with emphasis on application development and modern workflows.',
      },
      {
        'title': 'Flutter Projects',
        'detail': 'Implemented multiple mobile apps including healthcare, e-commerce, media, and educational products.',
      },
      {
        'title': 'API & Firebase Integration',
        'detail': 'Worked with REST APIs, authentication flows, data handling, and Firebase-backed features.',
      },
    ];

    return Section(
      number: '08',
      title: 'Training & Learning Journey',
      subtitle:
          'Hands-on development experience and continuous technical growth.',
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            for (int i = 0; i < items.length; i++) ...[
              _TrainingItem(
                index: i,
                title: items[i]['title']!,
                detail: items[i]['detail']!,
              ),
              if (i != items.length - 1) const SizedBox(height: 14),
            ],
          ],
        ),
      ),
    );
  }
}

class _TrainingItem extends StatelessWidget {
  final int index;
  final String title;
  final String detail;

  const _TrainingItem({
    required this.index,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.bgSoft,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.purple.withAlpha(18),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: AppColors.purpleLight,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
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
                    fontSize: 16,
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
