import 'package:flutter/material.dart';
import '../common/section.dart';
import 'about_highlights.dart';
import 'about_text.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool desktop = MediaQuery.sizeOf(context).width >= 800;

    return Section(
      number: '01',
      title: 'About Me',
      subtitle:
      'A little more about me and the way I build products.',
      child: desktop
          ? const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: AboutText(),
          ),
          SizedBox(width: 45),
          Expanded(
            child: AboutHighlights(),
          ),
        ],
      )
          : const Column(
        children: [
          AboutText(),
          SizedBox(height: 25),
          AboutHighlights(),
        ],
      ),
    );
  }
}