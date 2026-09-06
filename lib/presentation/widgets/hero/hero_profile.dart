import 'package:flutter/material.dart';
import '../../../core/resource/colors_manager.dart';
import 'tech_badge.dart';

class HeroProfile extends StatelessWidget {
  const HeroProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final bool mobile =
        MediaQuery.sizeOf(context).width < 600;

    final double size = mobile ? 270 : 340;

    return SizedBox(
      width: size,
      height: size + 35,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.purple.withAlpha(50),
              ),
            ),
          ),
          Container(
            width: size - 55,
            height: size - 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.purple.withAlpha(50),
              border: Border.all(
                color: AppColors.purple.withAlpha(50),
              ),
            ),
          ),
          Container(
            width: mobile ? 155 : 185,
            height: mobile ? 155 : 185,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.purple,
                  AppColors.purpleLight,
                ],
              ),
              borderRadius: BorderRadius.circular(48),
              boxShadow: [
                BoxShadow(
                  color: AppColors.purple.withAlpha(50),
                  blurRadius: 55,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: Center(
              child: Text(
                'EM',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: mobile ? 50 : 60,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -3,
                ),
              ),
            ),
          ),
          Positioned(
            top: mobile ? 8 : 5,
            right: mobile ? -2 : 0,
            child: const TechBadge(
              icon: Icons.flutter_dash,
              text: 'Flutter',
            ),
          ),
          Positioned(
            bottom: mobile ? 20 : 17,
            left: mobile ? -2 : 0,
            child: const TechBadge(
              icon: Icons.code_rounded,
              text: 'Dart',
            ),
          ),
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