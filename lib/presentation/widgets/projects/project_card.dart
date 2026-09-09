import 'package:flutter/material.dart';

import '../../../core/resource/colors_manager.dart';
import '../../../core/utils/url_launcher_helper.dart';
import '../../../data/models/project.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _isHovered ? -6 : 0, 0),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? AppColors.purple.withAlpha(100)
                : AppColors.border,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.purple.withAlpha(22),
                    blurRadius: 28,
                    offset: const Offset(0, 12),
                  ),
                ]
              : null,
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProjectHeader(project: project, isHovered: _isHovered),
            _ProjectContent(project: project, isHovered: _isHovered),
          ],
        ),
      ),
    );
  }
}

class _ProjectHeader extends StatelessWidget {
  final Project project;
  final bool isHovered;

  const _ProjectHeader({required this.project, required this.isHovered});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _ProjectImage(project: project),

          AnimatedOpacity(
            duration: const Duration(milliseconds: 220),
            opacity: isHovered ? 1 : 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, AppColors.bg.withAlpha(185)],
                ),
              ),
            ),
          ),

          Positioned(
            top: 14,
            left: 14,
            child: _Badge(label: project.category.toUpperCase()),
          ),

          if (project.featured)
            Positioned(
              top: 14,
              right: 14,
              child: _Badge(label: 'FEATURED', accent: true),
            ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final bool accent;

  const _Badge({required this.label, this.accent = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: accent
            ? AppColors.green.withAlpha(220)
            : AppColors.bg.withAlpha(210),
        borderRadius: BorderRadius.circular(6),
        border: accent ? null : Border.all(color: AppColors.border),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: accent ? AppColors.bg : AppColors.white,
          fontSize: 8,
          fontWeight: FontWeight.w800,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class _ProjectContent extends StatelessWidget {
  final Project project;
  final bool isHovered;

  const _ProjectContent({required this.project, required this.isHovered});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 19),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.3,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            project.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 12,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 15),

          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final technology in project.technologies.take(5))
                _TechnologyTag(label: technology),
            ],
          ),

          const SizedBox(height: 17),

          InkWell(
            onTap: () => UrlLauncherHelper.open(project.github),
            borderRadius: BorderRadius.circular(6),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.code_rounded,
                    size: 15,
                    color: isHovered ? AppColors.purpleLight : AppColors.muted,
                  ),
                  const SizedBox(width: 7),
                  Text(
                    'View Source',
                    style: TextStyle(
                      color: isHovered
                          ? AppColors.purpleLight
                          : AppColors.muted,
                      fontSize: 10.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  AnimatedPadding(
                    duration: const Duration(milliseconds: 180),
                    padding: EdgeInsets.only(left: isHovered ? 4 : 0),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      size: 13,
                      color: isHovered
                          ? AppColors.purpleLight
                          : AppColors.muted,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TechnologyTag extends StatelessWidget {
  final String label;

  const _TechnologyTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.white.withAlpha(4),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.text,
          fontSize: 9.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _ProjectImage extends StatelessWidget {
  final Project project;

  const _ProjectImage({required this.project});

  @override
  Widget build(BuildContext context) {
    final image =
        project.coverImage ??
        (project.images.isNotEmpty ? project.images.first : null);

    if (image == null || image.isEmpty) {
      return Container(
        color: AppColors.bgSoft,
        child: const Center(
          child: Icon(Icons.image_outlined, color: AppColors.muted, size: 30),
        ),
      );
    }

    return Image.asset(
      image,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) {
        return Container(
          color: AppColors.bgSoft,
          child: const Center(
            child: Icon(
              Icons.image_not_supported_outlined,
              color: AppColors.muted,
              size: 30,
            ),
          ),
        );
      },
    );
  }
}
