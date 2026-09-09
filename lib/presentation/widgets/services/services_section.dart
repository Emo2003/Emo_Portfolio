import 'package:flutter/material.dart';

import '../../../core/resource/colors_manager.dart';
import '../../widgets/common/section.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'icon': Icons.phone_android_rounded,
        'title': 'Cross-platform mobile apps',
        'text': 'Building responsive Flutter applications for Android and other modern mobile platforms.',
      },
      {
        'icon': Icons.api_rounded,
        'title': 'REST API integration',
        'text': 'Connecting applications to real backend systems with clean data handling and secure flows.',
      },
      {
        'icon': Icons.local_fire_department_rounded,
        'title': 'Firebase-powered apps',
        'text': 'Implementing app features that benefit from real-time and cloud-driven functionality.',
      },
      {
        'icon': Icons.lock_rounded,
        'title': 'Authentication systems',
        'text': 'Creating secure login experiences and user access flows using modern patterns.',
      },
      {
        'icon': Icons.shopping_bag_rounded,
        'title': 'E-commerce experiences',
        'text': 'Designing product browsing, cart flows, and order-related app experiences.',
      },
      {
        'icon': Icons.local_hospital_rounded,
        'title': 'Healthcare apps',
        'text': 'Developing structured, user-focused experiences for medical and service-based platforms.',
      },
      {
        'icon': Icons.palette_rounded,
        'title': 'Responsive UI design',
        'text': 'Creating polished interfaces that adapt smoothly across different device sizes.',
      },
      {
        'icon': Icons.layers_rounded,
        'title': 'Clean Architecture apps',
        'text': 'Organizing code for maintainability, reusability, and long-term scalability.',
      },
    ];

    return Section(
      number: '09',
      title: 'What I Can Build',
      subtitle: 'Focused on practical, maintainable Flutter applications and user-friendly product experiences.',
      child: GridView.builder(
        itemCount: services.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          childAspectRatio: 1.55,
        ),
        itemBuilder: (context, index) {
          final service = services[index];

          return Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.purple.withAlpha(18),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    service['icon'] as IconData,
                    color: AppColors.purpleLight,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  service['title'] as String,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  service['text'] as String,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 12.5,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
