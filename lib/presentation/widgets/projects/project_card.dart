import 'package:flutter/material.dart';
import '../../../core/resource/colors_manager.dart';
import '../../../core/utils/url_launcher_helper.dart';
import '../../../data/models/project.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final Project project = widget.project;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
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
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(
          0,
          hover ? -6 : 0,
          0,
        ),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: hover ? AppColors.card2 : AppColors.card,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: hover
                ? AppColors.purple.withAlpha(100)
                : AppColors.border,
          ),
          boxShadow: hover
              ? [
            BoxShadow(
              color: AppColors.purple,
              blurRadius: 35,
            ),
          ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.purple.withAlpha(50),
                        AppColors.purple,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    project.icon,
                    color: AppColors.purpleLight,
                    size: 24,
                  ),
                ),

                const Spacer(),

                if (project.featured)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 5,
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
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 20),

            Text(
              project.category,
              style: const TextStyle(
                color: AppColors.purpleLight,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 7),

            Text(
              project.title,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 9),

            Text(
              project.description,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 13,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 15),

            Wrap(
              spacing: 7,
              runSpacing: 7,
              children: project.technologies.map(
                    (technology) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.bgSoft,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.border,
                      ),
                    ),
                    child: Text(
                      technology,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 10,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),

            const SizedBox(height: 20),

            InkWell(
              onTap: () => UrlLauncherHelper.open(project.github),
              borderRadius: BorderRadius.circular(8),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 7),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.code_rounded,
                      color: AppColors.purpleLight,
                      size: 16,
                    ),
                    SizedBox(width: 7),
                    Text(
                      'View Source Code',
                      style: TextStyle(
                        color: AppColors.purpleLight,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColors.purpleLight,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}