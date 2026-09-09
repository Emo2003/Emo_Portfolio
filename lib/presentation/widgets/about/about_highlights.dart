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
          text: 'Organizing application code in a clear, scalable way.',
        ),
        SizedBox(height: 11),
        Highlight(
          icon: Icons.account_tree_outlined,
          title: 'State Management',
          text: 'Using BLoC and Cubit to keep app behavior predictable.',
        ),
        SizedBox(height: 11),
        Highlight(
          icon: Icons.cloud_outlined,
          title: 'Real Product Work',
          text: 'Building applications with API integration, Firebase, and real user flows.',
        ),
      ],
    );
  }
}
