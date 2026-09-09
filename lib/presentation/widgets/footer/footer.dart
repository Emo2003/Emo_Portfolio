import 'package:flutter/material.dart';

import '../../../core/resource/colors_manager.dart';
import '../../../core/resource/constant_manager.dart';
import '../../../core/resource/urls_manager.dart';
import '../../../core/utils/url_launcher_helper.dart';

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 80),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Column(
        children: [
          const Text(
            'EMAN MEDHAT',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 13,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Building mobile experiences with Flutter & Dart.',
            style: TextStyle(color: AppColors.muted, fontSize: 10),
          ),

          const SizedBox(height: 18),

          Wrap(
            alignment: WrapAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  UrlLauncherHelper.open(AppUrls.github);
                },
                child: const Text(
                  'GitHub',
                  style: TextStyle(color: AppColors.muted, fontSize: 10),
                ),
              ),

              const Text('•', style: TextStyle(color: AppColors.border)),

              TextButton(
                onPressed: () {
                  UrlLauncherHelper.open(AppUrls.linkedIn);
                },
                child: const Text(
                  'LinkedIn',
                  style: TextStyle(color: AppColors.muted, fontSize: 10),
                ),
              ),

              const Text('•', style: TextStyle(color: AppColors.border)),

              TextButton(
                onPressed: () {
                  UrlLauncherHelper.open(AppUrls.cv);
                },
                child: const Text(
                  'CV',
                  style: TextStyle(color: AppColors.muted, fontSize: 10),
                ),
              ),

              const Text('•', style: TextStyle(color: AppColors.border)),

              TextButton(
                onPressed: () {
                  UrlLauncherHelper.open(AppUrls.email());
                },
                child: const Text(
                  'Email',
                  style: TextStyle(color: AppColors.muted, fontSize: 10),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            '© ${DateTime.now().year} ${AppStrings.name}. All rights reserved.',
            style: const TextStyle(color: Color(0xFF505561), fontSize: 9),
          ),
        ],
      ),
    );
  }
}
