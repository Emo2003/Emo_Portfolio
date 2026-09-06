import 'package:flutter/material.dart';

import 'hero_content.dart';
import 'hero_profile.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onProjects;
  final VoidCallback onContact;

  const HeroSection({
    super.key,
    required this.onProjects,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    final double width =
        MediaQuery.sizeOf(context).width;

    final bool desktop = width >= 850;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        desktop ? 45 : 24,
        desktop ? 105 : 65,
        desktop ? 45 : 24,
        70,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1120,
          ),
          child: desktop
              ? Row(
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 6,
                child: HeroContent(
                  onProjects: onProjects,
                  onContact: onContact,
                ),
              ),
              const SizedBox(width: 70),
              const Expanded(
                flex: 4,
                child: HeroProfile(),
              ),
            ],
          )
              : Column(
            children: [
              const HeroProfile(),
              const SizedBox(height: 50),
              HeroContent(
                onProjects: onProjects,
                onContact: onContact,
              ),
            ],
          ),
        ),
      ),
    );
  }
}