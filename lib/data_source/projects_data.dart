import 'package:flutter/material.dart';

import '../data/models/project.dart';

const List<Project> projects = [
  Project(
    title: 'CHEFAA',
    category: 'HEALTHCARE PLATFORM',
    description:
    'A multi-role healthcare platform connecting patients, doctors, '
        'pharmacies and healthcare facilities with appointments, medications, '
        'authentication, maps and AI-powered analysis.',
    technologies: [
      'Flutter',
      'BLoC',
      'Clean Architecture',
      'Dio',
      'REST API',
      'Google Maps',
    ],
    icon: Icons.local_hospital_rounded,
    github: 'https://github.com/Emo2003/chefaa',
    featured: true,
  ),

  Project(
    title: 'Ema Store',
    category: 'E-COMMERCE',
    description:
    'A complete e-commerce mobile application featuring authentication, '
        'product browsing, search, wishlist, cart, checkout, addresses '
        'and order history.',
    technologies: [
      'Flutter',
      'BLoC',
      'Clean Architecture',
      'Dio',
      'REST API',
    ],
    icon: Icons.shopping_bag_rounded,
    github: 'https://github.com/Emo2003/ema_store',
  ),

  Project(
    title: 'Cinemax',
    category: 'MOVIE APPLICATION',
    description:
    'A movie discovery application with authentication, search, genres, '
        'favorites, trailers and REST API integration.',
    technologies: [
      'Flutter',
      'BLoC',
      'REST API',
      'GetIt',
      'Dio',
    ],
    icon: Icons.movie_rounded,
    github: 'https://github.com/Emo2003/movie_app',
  ),

  Project(
    title: 'Quiz Application',
    category: 'EDUCATIONAL APP',
    description:
    'An interactive quiz application with dynamic questions, score '
        'calculation, result summaries and session reset.',
    technologies: [
      'Flutter',
      'Dart',
      'OOP',
    ],
    icon: Icons.quiz_rounded,
    github: 'https://github.com/Emo2003/QuizApp',
  ),
];