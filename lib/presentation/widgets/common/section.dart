import 'package:flutter/material.dart';
import '../../../core/resource/colors_manager.dart';

class Section extends StatelessWidget {
  final String number;
  final String title;
  final String subtitle;
  final Widget child;

  const Section({
    super.key,
    required this.number,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final bool mobile =
        MediaQuery.sizeOf(context).width < 600;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        22,
        70,
        22,
        30,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1120,
          ),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    number,
                    style: const TextStyle(
                      color: AppColors.purpleLight,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 38,
                    height: 1,
                    color: AppColors.purple,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: mobile ? 31 : 39,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.5,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppColors.muted,
                  fontSize: 12.5,
                ),
              ),
              const SizedBox(height: 30),
              child,
            ],
          ),
        ),
      ),
    );
  }
}