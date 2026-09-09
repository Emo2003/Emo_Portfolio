import 'package:flutter/material.dart';

import '../../../core/resource/colors_manager.dart';

class PortfolioNavbar extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback onEducation;
  final VoidCallback onContact;

  const PortfolioNavbar({
    super.key,
    required this.onHome,
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onEducation,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 760;

    final items = [
      ('Home', onHome),
      ('About', onAbout),
      ('Skills', onSkills),
      ('Projects', onProjects),
      ('Education', onEducation),
      ('Contact', onContact),
    ];

    return SafeArea(
      child: Center(
        child: Container(
          width: 1120,
          margin: const EdgeInsets.only(top: 18),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 14 : 18,
            vertical: isMobile ? 10 : 12,
          ),
          decoration: BoxDecoration(
            color: AppColors.card.withAlpha(210),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(100),
                blurRadius: 30,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: onHome,
                  borderRadius: BorderRadius.circular(10),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      'EMAN MEDHAT',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.6,
                      ),
                    ),
                  ),
                ),
              ),
              if (!isMobile)
                Wrap(
                  spacing: 6,
                  runSpacing: 8,
                  children: [
                    for (final item in items)
                      TextButton(
                        onPressed: item.$2,
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.muted,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          item.$1,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                  ],
                )
              else
                PopupMenuButton<String>(
                  color: AppColors.card,
                  tooltip: 'Navigation menu',
                  icon: const Icon(Icons.menu_rounded, color: AppColors.white),
                  itemBuilder: (context) => [
                    for (final item in items)
                      PopupMenuItem<String>(
                        value: item.$1,
                        onTap: item.$2,
                        child: Text(
                          item.$1,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
