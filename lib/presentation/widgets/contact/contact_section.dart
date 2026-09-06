import 'package:flutter/material.dart';
import '../../../core/resource/colors_manager.dart';
import '../../../core/resource/constant_manager.dart';
import '../common/section.dart';
import 'contact_text.dart';
import 'email_button.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool desktop =
        MediaQuery.sizeOf(context).width >= 700;

    return Section(
      number: '05',
      title: AppStrings.contactTitle,
      subtitle: AppStrings.contactSubtitle,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.card,
              Color(0xFF151326),
            ],
          ),
          borderRadius: BorderRadius.circular(23),
          border: Border.all(
            color: AppColors.purple.withAlpha(50),
          ),
        ),
        child: desktop
            ? const Row(
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ContactText(),
            ),
            SizedBox(width: 30),
            EmailButton(),
          ],
        )
            : const Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            ContactText(),
            SizedBox(height: 25),
            EmailButton(),
          ],
        ),
      ),
    );
  }
}