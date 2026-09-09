import 'package:flutter/material.dart';

import '../../../core/resource/colors_manager.dart';
import 'tech_badge.dart';

class HeroProfile extends StatelessWidget {
  const HeroProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final bool mobile = MediaQuery.sizeOf(context).width < 600;

    final double size = mobile ? 270 : 340;
    final double photoSize = mobile ? 185 : 235;

    return SizedBox(
      width: size,
      height: size + 35,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer subtle ring
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.purple.withAlpha(45),
                width: 1,
              ),
            ),
          ),

          // Inner glow ring
          Container(
            width: size - 35,
            height: size - 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.purple.withAlpha(30),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.purple.withAlpha(25),
                  blurRadius: 45,
                  spreadRadius: 5,
                ),
              ],
            ),
          ),

          // Photo
          Container(
            width: photoSize,
            height: photoSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.purple.withAlpha(120),
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.purple.withAlpha(45),
                  blurRadius: 40,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile.jpg',
                width: photoSize,
                height: photoSize,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.bgSoft,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.person_outline_rounded,
                      color: AppColors.muted,
                      size: 55,
                    ),
                  );
                },
              ),
            ),
          ),

          // Flutter badge
          Positioned(
            top: mobile ? 8 : 5,
            right: mobile ? -2 : 0,
            child: const TechBadge(icon: Icons.flutter_dash, text: 'Flutter'),
          ),

          // Dart badge
          Positioned(
            bottom: mobile ? 20 : 17,
            left: mobile ? -2 : 0,
            child: const TechBadge(icon: Icons.code_rounded, text: 'Dart'),
          ),

          // BLoC badge
          Positioned(
            bottom: mobile ? 52 : 48,
            right: mobile ? -5 : -2,
            child: const TechBadge(
              icon: Icons.account_tree_outlined,
              text: 'BLoC',
            ),
          ),
        ],
      ),
    );
  }
}
