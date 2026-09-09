import 'package:flutter/material.dart';

import '../../../core/resource/colors_manager.dart';
import '../../../data_source/certificates_data.dart';
import '../../widgets/common/section.dart';

class CertificatesSection extends StatelessWidget {
  const CertificatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      number: '07',
      title: 'Certificates',
      subtitle: 'Learning milestones and continuing technical development.',
      child: Column(
        children: [
          for (int i = 0; i < certificates.length; i++) ...[
            _CertificateCard(certificate: certificates[i]),
            if (i != certificates.length - 1) const SizedBox(height: 18),
          ],
        ],
      ),
    );
  }
}

class _CertificateCard extends StatefulWidget {
  final dynamic certificate;

  const _CertificateCard({required this.certificate});

  @override
  State<_CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<_CertificateCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final certificate = widget.certificate;

    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: hover ? AppColors.card2 : AppColors.card,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: hover ? AppColors.purple.withAlpha(80) : AppColors.border,
          ),
          boxShadow: hover
              ? [
                  BoxShadow(
                    color: AppColors.purple.withAlpha(24),
                    blurRadius: 30,
                    offset: const Offset(0, 12),
                  ),
                ]
              : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: AppColors.purple.withAlpha(18),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.purple.withAlpha(60)),
              ),
              child: Icon(
                certificate.icon,
                color: AppColors.purpleLight,
                size: 26,
              ),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    certificate.name,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${certificate.organization} • ${certificate.date}',
                    style: const TextStyle(
                      color: AppColors.purpleLight,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    certificate.description,
                    style: const TextStyle(
                      color: AppColors.muted,
                      fontSize: 13,
                      height: 1.7,
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
