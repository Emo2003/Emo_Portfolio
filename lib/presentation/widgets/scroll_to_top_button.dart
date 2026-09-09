import 'package:flutter/material.dart';

import '../../core/resource/colors_manager.dart';

class ScrollToTopButton extends StatelessWidget {
  final bool visible;
  final VoidCallback onPressed;

  const ScrollToTopButton({
    super.key,
    required this.visible,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 220),
      offset: visible ? Offset.zero : const Offset(0, 1.2),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 220),
        opacity: visible ? 1 : 0,
        child: FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: AppColors.purple,
          foregroundColor: Colors.white,
          elevation: 12,
          tooltip: 'Back to top',
          child: const Icon(Icons.arrow_upward_rounded),
        ),
      ),
    );
  }
}
