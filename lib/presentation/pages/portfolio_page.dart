import 'package:flutter/material.dart';
import '../../core/resource/colors_manager.dart';
import '../widgets/about/about_section.dart';
import '../widgets/background/background.dart';
import '../widgets/contact/contact_section.dart';
import '../widgets/education/education_section.dart';
import '../widgets/footer/footer.dart';
import '../widgets/hero/hero_section.dart';
import '../widgets/projects/projects_sections.dart';
import '../widgets/skills/skills_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() =>
      _PortfolioPageState();
}

class _PortfolioPageState
    extends State<PortfolioPage> {
  final ScrollController controller =
  ScrollController();

  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void goTo(GlobalKey key) {
    final BuildContext? targetContext =
        key.currentContext;

    if (targetContext == null) return;

    Scrollable.ensureVisible(
      targetContext,
      duration:
      const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
          const Positioned.fill(
            child: PortfolioBackground(),
          ),

          Positioned.fill(
            child: SingleChildScrollView(
              controller: controller,
              physics:
              const BouncingScrollPhysics(),
              child: Column(
                children: [
                  HeroSection(
                    onProjects: () {
                      goTo(projectsKey);
                    },
                    onContact: () {
                      goTo(contactKey);
                    },
                  ),

                  const StatsSection(),

                  const SizedBox(height: 80),

                  const AboutSection(),

                  SkillsSection(
                    key: skillsKey,
                  ),

                  ProjectsSection(
                    key: projectsKey,
                  ),

                  const EducationSection(),

                  ContactSection(
                    key: contactKey,
                  ),

                  const PortfolioFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool mobile =
        MediaQuery.sizeOf(context).width < 650;

    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints:
          const BoxConstraints(maxWidth: 900),
          child: Container(
            padding:
            const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 23,
            ),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius:
              BorderRadius.circular(18),
              border: Border.all(
                color: AppColors.border,
              ),
            ),
            child: mobile
                ? const Column(
              children: [
                Stat(
                  value: '4+',
                  label: 'Projects',
                ),
                SizedBox(height: 20),
                Stat(
                  value: 'Flutter',
                  label: 'Main Focus',
                ),
                SizedBox(height: 20),
                Stat(
                  value: '2026',
                  label: 'Graduate',
                ),
              ],
            )
                : const Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceAround,
              children: [
                Stat(
                  value: '4+',
                  label: 'Projects',
                ),
                Stat(
                  value: 'Flutter',
                  label: 'Main Focus',
                ),
                Stat(
                  value: '2026',
                  label: 'Graduate',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Stat extends StatelessWidget {
  final String value;
  final String label;

  const Stat({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 8,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}