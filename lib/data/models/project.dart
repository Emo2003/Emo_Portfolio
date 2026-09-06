import 'package:flutter/material.dart';

class Project {
  final String title;
  final String category;
  final String description;
  final List<String> technologies;
  final IconData icon;
  final String github;
  final bool featured;

  const Project({
    required this.title,
    required this.category,
    required this.description,
    required this.technologies,
    required this.icon,
    required this.github,
    this.featured = false,
  });
}