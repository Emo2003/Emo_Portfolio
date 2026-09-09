import 'package:flutter/material.dart';

class Certificate {
  final String name;
  final String organization;
  final String date;
  final String description;
  final IconData icon;
  final String? verificationUrl;
  final String image;
  const Certificate({
    required this.name,
    required this.organization,
    required this.date,
    required this.description,
    required this.icon,
    this.verificationUrl,
    required this.image,
  });
}
