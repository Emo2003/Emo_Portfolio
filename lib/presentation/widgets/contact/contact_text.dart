import 'package:flutter/material.dart';
import '../../../core/resource/colors_manager.dart';
import 'contact_info.dart';

class ContactText extends StatelessWidget {
  const ContactText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Text(
          "Let's build something great.",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 27,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 11),
        Text(
          'I am open to junior Flutter opportunities, '
              'internships and interesting mobile application projects.',
          style: TextStyle(
            color: AppColors.muted,
            fontSize: 13,
            height: 1.7,
          ),
        ),
        SizedBox(height: 20),
        ContactInfo(),
      ],
    );
  }
}