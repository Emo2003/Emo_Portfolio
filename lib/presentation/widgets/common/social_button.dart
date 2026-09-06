import 'package:flutter/material.dart';
import '../../../core/resource/colors_manager.dart';

class SocialButton extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            hover = true;
          });
        },
        onExit: (_) {
          setState(() {
            hover = false;
          });
        },
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: hover
                  ? AppColors.purple.withAlpha(30)
                  : AppColors.card,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: hover
                    ? AppColors.purple
                    : AppColors.border,
              ),
            ),
            child: Icon(
              widget.icon,
              color: hover
                  ? AppColors.purpleLight
                  : AppColors.text,
              size: 17,
            ),
          ),
        ),
      ),
    );
  }
}