import 'package:flutter/material.dart';

import 'highlight.dart';

class AboutHighlights extends StatelessWidget {
  const AboutHighlights({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Highlight(
          icon: Icons.layers_outlined,
          title: 'Clean Architecture',
          text: 'Structured and maintainable codebases.',
        ),
        SizedBox(height: 11),
        Highlight(
          icon: Icons.account_tree_outlined,
          title: 'State Management',
          text: 'BLoC and Cubit for predictable state.',
        ),
        SizedBox(height: 11),
        Highlight(
          icon: Icons.cloud_outlined,
          title: 'API Integration',
          text: 'REST APIs, Dio, JSON and authentication.',
        ),
      ],
    );
  }
}