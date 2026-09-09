import 'package:flutter/material.dart';

import '../../../core/resource/colors_manager.dart';
import '../../../data/models/certificate.dart';
import '../../../data_source/certificates_data.dart';
import '../common/section.dart';
import 'education_icon.dart';
import 'education_info.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool desktop = width >= 800;

    return Section(
      number: '05',
      title: 'Education & Certifications',
      subtitle: 'Academic background and professional development.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ------------------------------------------------------------
          // Education
          // ------------------------------------------------------------
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.border),
            ),
            child: desktop
                ? const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      EducationIcon(),
                      SizedBox(width: 22),
                      Expanded(child: EducationInfo()),
                    ],
                  )
                : const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EducationIcon(),
                      SizedBox(height: 20),
                      EducationInfo(),
                    ],
                  ),
          ),

          const SizedBox(height: 42),

          // ------------------------------------------------------------
          // Certifications Title
          // ------------------------------------------------------------
          const Text(
            'Certifications',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.3,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Professional courses and technical achievements.',
            style: TextStyle(color: AppColors.muted, fontSize: 12, height: 1.5),
          ),

          const SizedBox(height: 18),

          // ------------------------------------------------------------
          // Certifications
          // ------------------------------------------------------------
          Column(
            children: [
              for (int i = 0; i < certificates.length; i++) ...[
                CertificateCard(certificate: certificates[i]),

                if (i != certificates.length - 1) const SizedBox(height: 14),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

// ======================================================================
// Certificate Card
// ======================================================================

class CertificateCard extends StatefulWidget {
  final Certificate certificate;

  const CertificateCard({super.key, required this.certificate});

  @override
  State<CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<CertificateCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool desktop = width >= 700;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        width: double.infinity,
        padding: EdgeInsets.all(desktop ? 20 : 16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? AppColors.purple.withAlpha(100)
                : AppColors.border,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.purple.withAlpha(18),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: desktop
            ? _DesktopCertificateLayout(
                certificate: widget.certificate,
                isHovered: _isHovered,
              )
            : _MobileCertificateLayout(
                certificate: widget.certificate,
                isHovered: _isHovered,
              ),
      ),
    );
  }
}

// ======================================================================
// Desktop Layout
// ======================================================================

class _DesktopCertificateLayout extends StatelessWidget {
  final Certificate certificate;
  final bool isHovered;

  const _DesktopCertificateLayout({
    required this.certificate,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CertificateImage(
          certificate: certificate,
          isHovered: isHovered,
          width: 180,
          height: 120,
        ),

        const SizedBox(width: 22),

        Expanded(child: CertificateInfo(certificate: certificate)),
      ],
    );
  }
}

// ======================================================================
// Mobile Layout
// ======================================================================

class _MobileCertificateLayout extends StatelessWidget {
  final Certificate certificate;
  final bool isHovered;

  const _MobileCertificateLayout({
    required this.certificate,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CertificateImage(
          certificate: certificate,
          isHovered: isHovered,
          width: double.infinity,
          height: 190,
        ),

        const SizedBox(height: 18),

        CertificateInfo(certificate: certificate),
      ],
    );
  }
}

// ======================================================================
// Certificate Image
// ======================================================================

class CertificateImage extends StatelessWidget {
  final Certificate certificate;
  final bool isHovered;
  final double width;
  final double height;

  const CertificateImage({
    super.key,
    required this.certificate,
    required this.isHovered,
    required this.width,
    required this.height,
  });

  void _showCertificate(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierColor: Colors.black.withAlpha(220),
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 1000,
                  maxHeight: 800,
                ),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: InteractiveViewer(
                  minScale: 0.8,
                  maxScale: 4,
                  child: Image.asset(
                    certificate.image,
                    fit: BoxFit.contain,
                    errorBuilder: (_, _, _) {
                      return const SizedBox(
                        width: 500,
                        height: 300,
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            color: AppColors.muted,
                            size: 50,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              Positioned(
                top: 12,
                right: 12,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: AppColors.bg.withAlpha(220),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: const Icon(
                        Icons.close_rounded,
                        color: AppColors.white,
                        size: 19,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCertificate(context),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.bgSoft,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isHovered
                ? AppColors.purple.withAlpha(110)
                : AppColors.border,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              certificate.image,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) {
                return const Center(
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: AppColors.muted,
                    size: 34,
                  ),
                );
              },
            ),

            // Hover overlay
            AnimatedOpacity(
              duration: const Duration(milliseconds: 180),
              opacity: isHovered ? 1 : 0,
              child: Container(
                color: AppColors.bg.withAlpha(100),
                child: const Center(
                  child: Icon(
                    Icons.zoom_in_rounded,
                    color: AppColors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================================
// Certificate Information
// ======================================================================

class CertificateInfo extends StatelessWidget {
  final Certificate certificate;

  const CertificateInfo({super.key, required this.certificate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Title
        Text(
          certificate.name,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 1.25,
          ),
        ),

        const SizedBox(height: 7),

        // Organization + Date
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: [
            Text(
              certificate.organization,
              style: const TextStyle(
                color: AppColors.purpleLight,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),

            const Text(
              '•',
              style: TextStyle(color: AppColors.muted, fontSize: 11),
            ),

            Text(
              certificate.date,
              style: const TextStyle(color: AppColors.muted, fontSize: 11),
            ),
          ],
        ),

        const SizedBox(height: 10),

        // Description
        Text(
          certificate.description,
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 11.5,
            height: 1.6,
          ),
        ),

        const SizedBox(height: 12),

        // View Certificate
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.visibility_outlined, color: AppColors.muted, size: 15),
            SizedBox(width: 6),
            Text(
              'Click to view certificate',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
