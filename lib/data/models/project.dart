import 'package:flutter/material.dart';

class Project {
  final String title;
  final String category;
  final String description;
  final List<String> technologies;
  final IconData icon;
  final String github;
  final String? liveDemoUrl;
  final bool featured;
  final String? coverImage;
  final String? problem;
  final String? idea;
  final String? solution;
  final String? role;
  final List<String> features;
  final String? architecture;
  final String? stateManagement;
  final String? apiIntegration;
  final String? challenges;
  final String? learnings;
  final String? outcome;

  final List<String> _images;

  List<String> get images {
    if (_images.isNotEmpty) return _images;
    if (coverImage != null && coverImage!.isNotEmpty) return [coverImage!];
    return const [];
  }

  const Project({
    required this.title,
    required this.category,
    required this.description,
    required this.technologies,
    required this.icon,
    required this.github,
    this.liveDemoUrl,
    this.coverImage,
    this.featured = false,
    this.problem,
    this.idea,
    this.solution,
    this.role,
    this.features = const [],
    this.architecture,
    this.stateManagement,
    this.apiIntegration,
    this.challenges,
    this.learnings,
    this.outcome,
    List<String>? images,
  }) : _images = images ?? const [];
}
