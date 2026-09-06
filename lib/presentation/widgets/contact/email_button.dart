import 'package:flutter/material.dart';
import '../../../core/resource/colors_manager.dart';
import '../../../core/resource/urls_manager.dart';
import '../../../core/utils/url_launcher_helper.dart';

class EmailButton extends StatelessWidget {
  const EmailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        UrlLauncherHelper.open(
          AppUrls.email(),
        );
      },
      icon: const Icon(
        Icons.email_outlined,
        size: 17,
      ),
      label: const Text(
        'Send Me an Email',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 17,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
      ),
    );
  }
}