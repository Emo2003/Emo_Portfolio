import 'package:flutter/material.dart';
import '../../../core/resource/colors_manager.dart';
import '../../../core/resource/constant_manager.dart';
import '../../../core/resource/urls_manager.dart';
import '../../../core/utils/url_launcher_helper.dart';
import '../common/social_button.dart';

class HeroContent extends StatelessWidget {
  final VoidCallback onProjects;
  final VoidCallback onContact;

  const HeroContent({
    super.key,
    required this.onProjects,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    final bool mobile =
        MediaQuery.sizeOf(context).width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: AppColors.green.withAlpha(20),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.green.withAlpha(50),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.circle,
                color: AppColors.green,
                size: 7,
              ),
              SizedBox(width: 8),
              Text(
                AppStrings.available,
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 8,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        const Text(
          "Hi, I'm",
          style: TextStyle(
            color: AppColors.text,
            fontSize: 19,
          ),
        ),

        const SizedBox(height: 3),

        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [
                AppColors.white,
                AppColors.purpleLight,
              ],
            ).createShader(bounds);
          },
          child: Text(
            AppStrings.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: mobile ? 43 : 67,
              fontWeight: FontWeight.w900,
              letterSpacing: -3,
              height: 1.05,
            ),
          ),
        ),

        const SizedBox(height: 15),

        const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Junior ',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: 'Flutter Developer',
                style: TextStyle(
                  color: AppColors.purpleLight,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        const SizedBox(
          width: 620,
          child: Text(
            AppStrings.bio,
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 14,
              height: 1.85,
            ),
          ),
        ),

        const SizedBox(height: 30),

        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: onProjects,
              icon: const Icon(
                Icons.arrow_forward_rounded,
                size: 16,
              ),
              label: const Text(
                'View My Work',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.purple,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 21,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: onContact,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.white,
                side: const BorderSide(
                  color: AppColors.border,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 21,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
              child: const Text(
                "Let's Talk",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 27),

        Row(
          children: [
            const Text(
              'Find me on',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 10,
              ),
            ),
            const SizedBox(width: 12),

            SocialButton(
              icon: Icons.code_rounded,
              tooltip: 'GitHub',
              onTap: () {
                UrlLauncherHelper.open(
                  AppUrls.github,
                );
              },
            ),

            const SizedBox(width: 8),

            SocialButton(
              icon: Icons.business_center_outlined,
              tooltip: 'LinkedIn',
              onTap: () {
                UrlLauncherHelper.open(
                  AppUrls.linkedIn,
                );
              },
            ),

            const SizedBox(width: 8),

            SocialButton(
              icon: Icons.email_outlined,
              tooltip: 'Email',
              onTap: () {
                UrlLauncherHelper.open(
                  AppUrls.email(),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}