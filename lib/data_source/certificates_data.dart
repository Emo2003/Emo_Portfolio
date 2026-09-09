import 'package:flutter/material.dart';

import '../data/models/certificate.dart';

const List<Certificate> certificates = [
  Certificate(
    name: 'Flutter Development Diploma',
    organization: 'Route IT Training Center',
    date: 'December 2025',
    description: 'Practical mobile development training focused on Flutter, Dart, app structure, and real-world UI implementation.',
    icon: Icons.flutter_dash,
    verificationUrl: null,
    image: 'assets/certificates/route.jpg',
  ),
  Certificate(
    name: 'Professional Technical Event',
    organization: 'IEEE',
    date: 'November 2024',
    description: 'Participation in a professional technical event focused on engineering awareness, technical learning, and innovation.',
    icon: Icons.emoji_events_rounded,
    verificationUrl: null,
    image: 'assets/certificates/ieee.jpg',
  ),
];
