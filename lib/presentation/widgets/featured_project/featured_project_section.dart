import 'package:flutter/material.dart';

import '../../../core/resource/colors_manager.dart';
import '../../../core/utils/url_launcher_helper.dart';
import '../../../data/models/project.dart';
import '../common/section.dart';

class FeaturedProjectSection extends StatelessWidget {
  final Project project;

  const FeaturedProjectSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final bool desktop = MediaQuery.sizeOf(context).width >= 1000;

    return Section(
      number: '03',
      title: 'Featured Project',
      subtitle: 'An in-depth look at my primary work.',
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              child: SizedBox(
                width: double.infinity,
                height: desktop ? 340 : 220,
                child: Image.asset(
                  project.coverImage ?? 'assets/images/placeholder.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.bgSoft,
                      child: Center(
                        child: Icon(
                          project.icon,
                          size: desktop ? 80 : 60,
                          color: AppColors.muted,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Badge
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project.category,
                              style: const TextStyle(
                                color: AppColors.purpleLight,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              project.title,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.green.withAlpha(20),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.green.withAlpha(100),
                          ),
                        ),
                        child: const Text(
                          'Graduation Project',
                          style: TextStyle(
                            color: AppColors.green,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Description
                  Text(
                    project.description,
                    style: const TextStyle(
                      color: AppColors.text,
                      fontSize: 15,
                      height: 1.7,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Problem, Solution, Role - Three columns on desktop
                  if (desktop)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _DetailBox(
                            label: 'Problem',
                            content: project.problem ?? '',
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _DetailBox(
                            label: 'Solution',
                            content: project.solution ?? '',
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _DetailBox(
                            label: 'My Role',
                            content: project.role ?? '',
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _DetailBox(
                          label: 'Problem',
                          content: project.problem ?? '',
                        ),
                        const SizedBox(height: 16),
                        _DetailBox(
                          label: 'Solution',
                          content: project.solution ?? '',
                        ),
                        const SizedBox(height: 16),
                        _DetailBox(
                          label: 'My Role',
                          content: project.role ?? '',
                        ),
                      ],
                    ),

                  const SizedBox(height: 32),

                  // Key Features
                  if (project.features.isNotEmpty) ...[
                    const Text(
                      'Key Features',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.features.map((feature) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.bgSoft,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Text(
                            feature,
                            style: const TextStyle(
                              color: AppColors.text,
                              fontSize: 12,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 32),
                  ],

                  // Technical Details - Two columns
                  if (desktop)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _TechDetailsBox(
                            items: [
                              ('Architecture', project.architecture ?? ''),
                              (
                                'State Management',
                                project.stateManagement ?? '',
                              ),
                              ('API Integration', project.apiIntegration ?? ''),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (project.challenges != null &&
                                  project.challenges!.isNotEmpty) ...[
                                _DetailBox(
                                  label: 'Challenges',
                                  content: project.challenges!,
                                ),
                                const SizedBox(height: 16),
                              ],
                              if (project.learnings != null &&
                                  project.learnings!.isNotEmpty)
                                _DetailBox(
                                  label: 'Learnings',
                                  content: project.learnings!,
                                ),
                            ],
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _TechDetailsBox(
                          items: [
                            ('Architecture', project.architecture ?? ''),
                            ('State Management', project.stateManagement ?? ''),
                            ('API Integration', project.apiIntegration ?? ''),
                          ],
                        ),
                        const SizedBox(height: 16),
                        if (project.challenges != null &&
                            project.challenges!.isNotEmpty) ...[
                          _DetailBox(
                            label: 'Challenges',
                            content: project.challenges!,
                          ),
                          const SizedBox(height: 16),
                        ],
                        if (project.learnings != null &&
                            project.learnings!.isNotEmpty)
                          _DetailBox(
                            label: 'Learnings',
                            content: project.learnings!,
                          ),
                      ],
                    ),

                  const SizedBox(height: 32),

                  // CTA Buttons
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => UrlLauncherHelper.open(project.github),
                        icon: const Icon(Icons.code_rounded, size: 16),
                        label: const Text('View Source Code'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.purple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      if (project.liveDemoUrl != null)
                        OutlinedButton.icon(
                          onPressed: () =>
                              UrlLauncherHelper.open(project.liveDemoUrl!),
                          icon: const Icon(Icons.open_in_new_rounded, size: 16),
                          label: const Text('Live Demo'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.white,
                            side: const BorderSide(color: AppColors.border),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailBox extends StatelessWidget {
  final String label;
  final String content;

  const _DetailBox({required this.label, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgSoft,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.purpleLight,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              color: AppColors.text,
              fontSize: 12,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class _TechDetailsBox extends StatelessWidget {
  final List<(String label, String value)> items;

  const _TechDetailsBox({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgSoft,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < items.length; i++) ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items[i].$1,
                  style: const TextStyle(
                    color: AppColors.purpleLight,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  items[i].$2,
                  style: const TextStyle(color: AppColors.text, fontSize: 12),
                ),
              ],
            ),
            if (i != items.length - 1) const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}
