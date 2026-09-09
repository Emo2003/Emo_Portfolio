import 'package:flutter/material.dart';

import '../../../core/resource/colors_manager.dart';
import '../../../core/resource/urls_manager.dart';
import '../../../core/utils/url_launcher_helper.dart';
import '../../widgets/common/section.dart';

class GitHubSection extends StatelessWidget {
  const GitHubSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool desktop = MediaQuery.sizeOf(context).width >= 760;

    return Section(
      number: '11',
      title: 'GitHub',
      subtitle: 'A look at my code, projects, and ongoing development work.',
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.card, Color(0xFF121927)],
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.border),
        ),
        child: desktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Open for code review and collaboration',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'My repositories reflect practical app building, API integration, architecture patterns, and hands-on Flutter development.',
                          style: TextStyle(
                            color: AppColors.muted,
                            fontSize: 13,
                            height: 1.8,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton.icon(
                          onPressed: () =>
                              UrlLauncherHelper.open(AppUrls.github),
                          icon: const Icon(Icons.open_in_new_rounded, size: 16),
                          label: const Text('Visit GitHub'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.purple,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 22),

                  Container(
                    width: 220,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppColors.bgSoft,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Repository focus',
                          style: TextStyle(
                            color: AppColors.muted,
                            fontSize: 10,
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(height: 18),
                        _RepoTag(label: 'Flutter apps'),
                        SizedBox(height: 10),
                        _RepoTag(label: 'UI + logic'),
                        SizedBox(height: 10),
                        _RepoTag(label: 'API integration'),
                        SizedBox(height: 10),
                        _RepoTag(label: 'Clean Architecture'),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Open for code review and collaboration',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'My repositories reflect practical app building, API integration, architecture patterns, and hands-on Flutter development.',
                    style: TextStyle(
                      color: AppColors.muted,
                      fontSize: 13,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () => UrlLauncherHelper.open(AppUrls.github),
                    icon: const Icon(Icons.open_in_new_rounded, size: 16),
                    label: const Text('Visit GitHub'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.purple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppColors.bgSoft,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Repository focus',
                          style: TextStyle(
                            color: AppColors.muted,
                            fontSize: 10,
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(height: 18),
                        _RepoTag(label: 'Flutter apps'),
                        SizedBox(height: 10),
                        _RepoTag(label: 'UI + logic'),
                        SizedBox(height: 10),
                        _RepoTag(label: 'API integration'),
                        SizedBox(height: 10),
                        _RepoTag(label: 'Clean Architecture'),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _RepoTag extends StatelessWidget {
  final String label;

  const _RepoTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.purple.withAlpha(18),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.purple.withAlpha(50)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.purpleLight,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
