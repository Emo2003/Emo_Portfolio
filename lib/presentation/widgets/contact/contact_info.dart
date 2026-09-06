import 'package:flutter/material.dart';
import '../../../core/resource/colors_manager.dart';
import '../../../core/resource/constant_manager.dart';
import '../../../core/resource/urls_manager.dart';
import '../../../core/utils/url_launcher_helper.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 18,
      runSpacing: 10,
      children: [
        InkWell(
          onTap: () {
            UrlLauncherHelper.open(
              AppUrls.email(),
            );
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.email_outlined,
                color: AppColors.purpleLight,
                size: 16,
              ),
              SizedBox(width: 7),
              Text(
                AppStrings.email,
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),

        InkWell(
          onTap: () {
            UrlLauncherHelper.open(
              AppUrls.phone(),
            );
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.phone_outlined,
                color: AppColors.purpleLight,
                size: 16,
              ),
              SizedBox(width: 7),
              Text(
                AppStrings.phone,
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}