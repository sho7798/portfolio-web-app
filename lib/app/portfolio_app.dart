import 'package:flutter/material.dart';
import 'package:portfolio_app/app/theme/app_theme.dart';
import 'package:portfolio_app/app/theme/theme_controller.dart';
import 'package:portfolio_app/features/portfolio/presentation/pages/portfolio_page.dart';

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  late final ThemeController _themeController;

  @override
  void initState() {
    super.initState();
    _themeController = ThemeController();
  }

  @override
  void dispose() {
    _themeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _themeController,
      builder: (context, _) {
        final themeMode = _themeController.themeMode;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
          title: 'Portfolio',
          home: PortfolioPage(themeController: _themeController),
        );
      },
    );
  }
}

