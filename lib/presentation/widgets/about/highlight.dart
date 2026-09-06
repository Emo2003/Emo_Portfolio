import 'package:flutter/material.dart';
import '../../../core/resource/colors_manager.dart';

class Highlight extends StatefulWidget {
  final IconData icon;
  final String title;
  final String text;

  const Highlight({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  State<Highlight> createState() => _HighlightState();
}

class _HighlightState extends State<Highlight> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: hover
              ? AppColors.card2
              : AppColors.card,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: hover
                ? AppColors.purple.withAlpha(50)
                : AppColors.border,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: AppColors.purple.withAlpha(30),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                widget.icon,
                color: AppColors.purpleLight,
                size: 20,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.text,
                    style: const TextStyle(
                      color: AppColors.muted,
                      fontSize: 10.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}