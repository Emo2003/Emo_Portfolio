import 'package:flutter/material.dart';
import '../../core/resource/colors_manager.dart';
import '../../core/resource/constant_manager.dart';
import '../pages/portfolio_page.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '${AppStrings.name} | ${AppStrings.title}',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bg,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.purple,
          brightness: Brightness.dark,
        ),
      ),
      home: const PortfolioPage(),
    );
  }
}