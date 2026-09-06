import 'package:flutter/material.dart';

import '../../../core/resource/colors_manager.dart';
import '../../../data_source/projects_data.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1120,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '03',
                style: TextStyle(
                  color: AppColors.purple,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Selected Projects',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'A selection of projects showcasing my Flutter development skills.',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 30),

              if (width < 700)
                Column(
                  children: [
                    for (int i = 0; i < projects.length; i++) ...[
                      ProjectCard(
                        project: projects[i],
                      ),
                      if (i != projects.length - 1)
                        const SizedBox(height: 18),
                    ],
                  ],
                )
              else
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: projects.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                    mainAxisExtent: 395,
                  ),
                  itemBuilder: (context, index) {
                    return ProjectCard(
                      project: projects[index],
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}