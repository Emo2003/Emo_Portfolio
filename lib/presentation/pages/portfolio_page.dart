import 'package:flutter/material.dart';

import '../../core/resource/colors_manager.dart';
import '../../data_source/projects_data.dart';
import '../widgets/about/about_section.dart';
import '../widgets/background/background.dart';
import '../widgets/contact/contact_section.dart';
import '../widgets/education/education_section.dart';
import '../widgets/featured_project/featured_project_section.dart';
import '../widgets/footer/footer.dart';
import '../widgets/github/github_section.dart';
import '../widgets/hero/hero_section.dart';
import '../widgets/navbar/navbar.dart';
import '../widgets/projects/projects_sections.dart';
import '../widgets/scroll_to_top_button.dart';
import '../widgets/skills/skills_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController controller = ScrollController();
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey featuredProjectKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  bool showScrollToTop = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(_handleScroll);
  }

  void _handleScroll() {
    final shouldShow = controller.offset > 420;
    if (shouldShow != showScrollToTop) {
      setState(() {
        showScrollToTop = shouldShow;
      });
    }
  }

  void goTo(GlobalKey key) {
    final targetContext = key.currentContext;
    if (targetContext == null) return;

    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }

  void scrollToTop() {
    controller.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    controller.removeListener(_handleScroll);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      floatingActionButton: ScrollToTopButton(
        visible: showScrollToTop,
        onPressed: scrollToTop,
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: PortfolioBackground()),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 14),
                Expanded(
                  child: SingleChildScrollView(
                    controller: controller,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        HeroSection(
                          key: homeKey,
                          onProjects: () => goTo(featuredProjectKey),
                          onContact: () => goTo(contactKey),
                        ),
                        const SizedBox(height: 60),
                        AboutSection(key: aboutKey),
                        SkillsSection(key: skillsKey),
                        FeaturedProjectSection(
                          key: featuredProjectKey,
                          project: projects.first,
                        ),
                        ProjectsSection(key: projectsKey),
                        EducationSection(key: educationKey),
                        const GitHubSection(),
                        ContactSection(key: contactKey),
                        const PortfolioFooter(),
                      ],
                    ),
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
